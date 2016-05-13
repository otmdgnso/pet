package com.pet.reservation;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.common.MyUtil;

@Controller("reservation.reservationController")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/reservation/list")
	public ModelAndView list(
			HttpServletRequest req
			,@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(defaultValue="reservationNum") String searchKey
			,@RequestParam(defaultValue="") String searchValue
			) throws Exception {
		
		String cp=req.getContextPath();
		
		int numPerPage=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		//전체페이지수
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		
		if(dataCount!=0)
			total_page=util.pageCount(numPerPage, dataCount);
		
		//리스트에 출력할 데이터를 가져오기
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		map.put("start", start);
		map.put("end", end);
		
		List<Reservation> list=service.listReservation(map);
		
		//리스트 번호
		int listNum, n=0;
		Iterator<Reservation> it=list.iterator();
		while(it.hasNext()) {
			Reservation data=it.next();
			listNum=dataCount-(start+n-1);
			data.setReservationNum(listNum);
			n++;
		}
		
		ModelAndView mav=new ModelAndView(".reservation.list");
		return mav;
	}
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.GET)
	public ModelAndView createdForm() throws Exception {
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		mav.addObject("mode", "created");
		return mav;
	}
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.POST)
	public String createdSubmit(Reservation dto) throws Exception {
		service.insertReservation(dto, "created");
		
		return "redirect:/reservation/list";
	}

}
