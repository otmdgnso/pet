package com.pet.adopt;

import java.io.File;
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
import com.pet.member.SessionInfo;

@Controller("adopt.adoptController")
public class AdoptController {
	@Autowired
	private AdoptService service;
	
	@Autowired
	private MyUtil myutil;
	
	@RequestMapping(value="/adopt/created", method=RequestMethod.GET)
	public ModelAndView create(
			HttpSession session
			) throws Exception {
		ModelAndView mav = new ModelAndView(".adopt.created");
		mav.addObject("mode","created");
		return mav;
	}
	
	@RequestMapping(value="/adopt/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			Adopt dto
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"adopt";
		
		dto.setNum(info.getMemberNum());
		service.insertPreSale(dto, pathname);

		return "redirect:/adopt/list";
	}
	
	@RequestMapping(value="/adopt/list")
	public ModelAndView list(HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		String cp = req.getContextPath();
		
		int numPerPage = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page= myutil.pageCount(numPerPage, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지의수가 변화 된 경우
		if (total_page<current_page)
			current_page = total_page;
		
		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * numPerPage +1;
		int end = current_page * numPerPage;
		map.put("start", start);
		map.put("end", end);
		
		List<Adopt> list = service.listPreSale(map);
		
		// 리스트의 번호
		int listNum, n=0;
		Iterator<Adopt> it=list.iterator();
		while(it.hasNext()) {
			Adopt data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
			n++;
		}
		
		String params ="";
		String listUrl;
		String articleUrl;
		if(searchValue.length()!=0) {
			params = "searchKey=" +searchKey +
					"&searchValue=" + URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(params.length()==0) {
			listUrl = cp+"/adopt/list";
			articleUrl = cp+"/adopt/article?page=" +current_page;
		} else {
			listUrl = cp+"adopt/list?" +params;
			articleUrl = cp+"adopt/article?page=" + current_page + "&" +params;
		}
		
		ModelAndView mav = new ModelAndView(".adopt.list");
		mav.addObject("list",list);
		mav.addObject("articleUrl",articleUrl);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",myutil.paging(current_page, total_page, listUrl));
		
		return mav;
	}
	
	@RequestMapping(value="adopt/article", method=RequestMethod.GET)
	public ModelAndView article(
			@RequestParam(value="preSaleNum") int preSaleNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject")String searchKey,
			@RequestParam(value="searchValue", defaultValue="")String searchValue
			) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		// 조회수 증가
		service.preUpdateHitCount(preSaleNum);
		
		// 해당 레코드 가져오기
		Adopt dto = service.readPreSale(preSaleNum);
		if(dto==null)
			return new ModelAndView("redirect:.adopt.list?page="+page);
		
		// 내용에 엔터 넣기
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 파일
		List<Adopt> readPreFile=service.readPreFile(preSaleNum);
		
		String params = "page="+page;
		if(searchValue.length()!=0) {
			params += "&searchKey=" + searchKey +
					"&searchValue=" +URLEncoder.encode(searchValue,"utf-8");
		}
		
		ModelAndView mav= new ModelAndView(".adopt.article");
		mav.addObject("dto",dto);
		mav.addObject("readPreFile",readPreFile);
		
		mav.addObject("page",page);
		mav.addObject("params",params);
		
		return mav;
	}
	
	@RequestMapping(value="/adopt/delete")
	public String delete (
			HttpSession session,
			@RequestParam(value="preSaleNum") int preSaleNum,
			@RequestParam(value="page") String page
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" +File.separator + "adopt";
		
		// 자료 삭제
		service.deletePreSale(preSaleNum, pathname);
		
		return "redirect:/adopt/list?page="+page;
	}
	
	
	
	
	
	
}
