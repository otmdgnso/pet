package com.pet.reservation;

import java.net.URLDecoder;
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

@Controller("reservation.reservationController")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/reservation/list")
	public ModelAndView list(
			HttpSession session
			,Reservation dto
			,HttpServletRequest req
			,@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(defaultValue="reservationNum") String searchKey
			,@RequestParam(defaultValue="") String searchValue
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setNum(info.getMemberNum());
		dto.setUserName(info.getUserName());
		
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
		map.put("num", dto.getNum());
		
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
			data.setListNum(listNum);
			n++;
		}
		
		ModelAndView mav=new ModelAndView(".reservation.list");
		mav.addObject("list",list);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",util.paging(current_page, total_page));
		return mav;
	}
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.GET)
	public ModelAndView createdForm(
			HttpSession session
			,Reservation dto
			) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserName(info.getUserName());
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		mav.addObject("mode", "created");
		
		return mav;
	}
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session
			,Reservation dto
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserName(info.getUserName());
		
		dto.setNum(info.getMemberNum());
		service.insertReservation(dto, "created");

		return "/reservation/list";
	}
	
	@RequestMapping(value="/reservation/update", method=RequestMethod.GET)
	public ModelAndView updateReservation(
			HttpSession session
			,Reservation dto
			,@RequestParam(value="reservationNum") int reservationNum
			,@RequestParam(value="page") String page
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserName(info.getUserName());
		
		dto=(Reservation)service.readReservation(reservationNum);
		int tax=(int)((double)dto.getPay()*0.1);
		int total=(int)(tax+(double)dto.getPay());
		
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		mav.addObject("mode", "update");
		mav.addObject("page", page);
		mav.addObject("dto", dto);
		mav.addObject("tax", tax);
		mav.addObject("total", total);
		return mav;
	}
	
	@RequestMapping(value="/reservation/update", method=RequestMethod.POST)
	public ModelAndView updateSubmit(
			Reservation dto
			,@RequestParam(value="page") String page
			) throws Exception {
		
		service.updateReservation(dto);
		
		return new ModelAndView("redirect:/reservation/list?page="+page);
	}
	
	@RequestMapping(value="/reservation/delete")
	public String delete(
			@RequestParam(value="reservationNum") int reservationNum
			,@RequestParam(value="page", defaultValue="1") String page
			) throws Exception {

		service.deleteReservation(reservationNum);
		
		return "redirect:/reservation/list?page="+page;
	}
}
