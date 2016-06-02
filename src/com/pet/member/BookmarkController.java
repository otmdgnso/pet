package com.pet.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.common.MyUtil;

@Controller("member.bookmarkController")
public class BookmarkController {
	   @Autowired
	   private MemberService service;	
	   @Autowired
	   private MyUtil util;	
	   
	@RequestMapping(value="/member/bookmark")
	   public ModelAndView listBookmark(
			   @RequestParam(value="page", defaultValue="1") int current_page
			   ) throws Exception {
		   
		   int numPerPage=10;
		   int total_page=0;
		   int dataCount=0;
		   
		   //전체페이지수
		   Map<String, Object> map=new HashMap<String, Object>();
		   dataCount=service.dataCount(map);
			
			if(dataCount!=0)
				total_page=util.pageCount(numPerPage, dataCount);
			
			//리스트에 출력할 데이터를 가져오기
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			map.put("start", start);
			map.put("end", end);
			
			List<Bookmark> list=service.listBookmark(map);
			
			ModelAndView mav=new ModelAndView("/member/bookmark");
			mav.addObject("list", list);
			mav.addObject("page",current_page);
			mav.addObject("dataCount",dataCount);
			mav.addObject("paging",util.paging(current_page, total_page));
			return mav;

	   }
	
}
