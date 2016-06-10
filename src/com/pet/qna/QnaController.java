package com.pet.qna;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.common.MyUtil;

@Controller("qna.qnaController")
public class QnaController {
	@Autowired
	private QnaService service;
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value="/qna/list")
	public ModelAndView list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int numPerPage=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page=myUtil.pageCount(numPerPage, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * numPerPage + 1;
        int end = current_page * numPerPage;
        map.put("start", start);
        map.put("end", end);
        
        //글 리스트
        List<Qna> list=service.listQna(map);
        
        //리스트 번호
        int listNum, n=0;
        Iterator<Qna> it=list.iterator();
        while(it.hasNext()) {
            Qna data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String params = "";
        String urlList = cp+"/qna/list";
        String urlArticle = cp+"/qna/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	params = "searchKey=" +searchKey + 
        	             "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(params.length()!=0) {
            urlList = cp+"/qna/list?" + params;
            urlArticle = cp+"/qna/article?page=" + current_page + "&"+ params;
        }

        ModelAndView mav=new ModelAndView(".qna.list");
        mav.addObject("list", list);
        mav.addObject("urlArticle", urlArticle);
        mav.addObject("page", current_page);
        mav.addObject("dataCount", dataCount);
        mav.addObject("total_page", total_page);
        mav.addObject("paging", myUtil.paging(current_page, total_page, urlList));		
		
		return mav;
	}
	
	@RequestMapping(value="/qna/created", method=RequestMethod.GET)
	public ModelAndView createdForm(
			HttpSession session
			) throws Exception {
		
		ModelAndView mav=new ModelAndView("qna.created");
		mav.addObject("mode", "created");
		return mav;
	}
	
	@RequestMapping(value="/qna/created")
	public ModelAndView createdSubmit(
			HttpSession session,
			Qna dto
			) throws Exception {
		
		service.insertQna(dto);
		
		return new ModelAndView("redirect:/qna/list");
	}
	
	@RequestMapping(value="/qna/article")
	public ModelAndView article(
			@RequestParam(value="qNum") int qNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		
		searchValue=URLDecoder.decode(searchValue, "utf-8");
		
		//조회수 증가
		service.updateHitCount(qNum);
		
		//해당 레코드 가져오기
		Qna dto=service.readQna(qNum);
		if(dto==null)
			return new ModelAndView("redirect:/qna/list?page="+page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("qNum", qNum);
		
		ModelAndView mav=new ModelAndView(".qna.article");
		mav.addObject("dto", dto);
		mav.addObject("page", page);
		return mav;
	}
	
	// 댓글 리스트
		@RequestMapping(value="/qna/listReply")
		public ModelAndView listReply(
				@RequestParam(value="aNum") int num,
				@RequestParam(value="pageNo", defaultValue="1") int current_page
				) throws Exception {
			
			int numPerPage=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("aNum", num);
			
			dataCount=service.replyDataCount(map);
			total_page=myUtil.pageCount(numPerPage, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
			// 리스트에 출력할 데이터
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			map.put("start", start);
			map.put("end", end);
			List<Qna> listReply=service.listReply(map);
			
			// 엔터를 <br>
			Iterator<Qna> it=listReply.iterator();
			int listNum, n=0;
			while(it.hasNext()) {
				Qna dto=it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				n++;
			}
			
			// 페이징처리(인수2개 짜리 js로 처리)
			String paging=myUtil.paging(current_page, total_page);
			
			ModelAndView mav=new ModelAndView("qna/listReply");

			// jsp로 넘길 데이터
			mav.addObject("listReply", listReply);
			mav.addObject("pageNo", current_page);
			mav.addObject("replyCount", dataCount);
			mav.addObject("total_page", total_page);
			mav.addObject("paging", paging);
			
			return mav;
		}
}
