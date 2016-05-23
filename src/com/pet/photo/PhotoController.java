package com.pet.photo;

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

@Controller("photo.photoController")
public class PhotoController {
	@Autowired
	private PhotoService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/photo/photo")
	public ModelAndView list(
			HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
		
		String cp=req.getContextPath();
		
		int numPerPage=9;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")){
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		//전체 페이지수
		Map<String, Object> map=new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page=util.pageCount(numPerPage, dataCount);
		
		//다른 사람이 자료삭제해서 전체 페이지수 변경되는경우
		if(total_page<current_page)
			current_page=total_page;
		
		//리스트에 출력할 데이터 가져오기
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		
		List<Photo> list=service.listPhoto(map);
		
		//리스트 번호
		int listNum, n=0;
		Iterator<Photo> it=list.iterator();
		while(it.hasNext()){
			Photo data=it.next();
			listNum = dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}
		String params="";
		String listUrl;
		String articleUrl;
		if(searchValue.length()!=0){
			params="searchKey="+searchKey+
					"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(params.length()==0){
			listUrl=cp+"/photo/photo";
			articleUrl=cp+"/photo/article?page="+current_page;
		}else{
			listUrl=cp+"/photo/photo?"+params;
			articleUrl=cp+"/photo/article?page="+current_page+"&"+params;
		}
		
		ModelAndView mav=new ModelAndView(".photo.photo");
		mav.addObject("list",list);
		mav.addObject("articleUrl",articleUrl);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",util.paging(current_page, total_page,listUrl));
		return mav;
	}
	
	@RequestMapping(value="/photo/created", method=RequestMethod.GET)
	public ModelAndView created(
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		ModelAndView mav=new ModelAndView(".photo.created");

		if(info==null){
			return mav=new ModelAndView("redirect:/");
		}
		
		mav.addObject("mode","created");
		return mav;
	}
	
	@RequestMapping(value="/photo/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			Photo dto
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
				
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		dto.setNum(info.getMemberNum());
		service.insertPhoto(dto, pathname);
		return "redirect:/photo/photo";
	}
	
	@RequestMapping(value="/photo/article", method=RequestMethod.GET)
	public ModelAndView article(
			@RequestParam(value="photoNum") int photoNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception{
		
		searchValue= URLDecoder.decode(searchValue,"utf-8");
		
		//조회수 증가
		service.photoHitCount(photoNum);
		
		Map<String, Object> map=new HashMap<>();
		map.put("photoNum", photoNum);
		
		Photo dto=service.readPhoto(photoNum);
		if(dto==null)
			return new ModelAndView("redirect:.photo.photo?page="+page);
		
		//내용에 엔터
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		String params="page="+page;
		if(searchValue.length()!=0){
			params+="&searchKey="+searchKey+
						"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		ModelAndView mav=new ModelAndView(".photo.article");
		mav.addObject("dto",dto);
		mav.addObject("page",page);
		mav.addObject("params",params);
		
		return mav;
	}
	
	@RequestMapping(value="/photo/update", method=RequestMethod.GET)
	public ModelAndView updateForm(
			@RequestParam(value="photoNum") int photoNum,
			@RequestParam(value="page") String page
			) throws Exception{
		
		Photo dto=service.readPhoto(photoNum);
		if(dto==null)
			return new ModelAndView("redirect/:.photo.photo?page="+page);
		
		ModelAndView mav=new ModelAndView(".photo.created");
		mav.addObject("mode","update");
		mav.addObject("page",page);
		mav.addObject("dto",dto);	
		return mav;
	}
	
	@RequestMapping(value="/photo/update",method=RequestMethod.POST)
	public String updateSubmit(
			HttpSession session,
			Photo dto,
			@RequestParam(value="page") String page
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		//수정하기
		service.updatePhoto(dto, pathname);
		
		return "redirect:/photo/photo?page="+page;
	}
	
	@RequestMapping(value="/photo/delete")
	public String delete(
			HttpSession session
			,@RequestParam(value="saveFilename") String saveFilename
			,@RequestParam(value="photoNum") int photoNum
			,@RequestParam(value="page") String page
			) throws Exception{
				
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		service.deletePhoto(photoNum, pathname, saveFilename);
		
		return "redirect:/photo/photo?page="+page;
	}
}







