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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.common.MyUtil;
import com.pet.member.SessionInfo;
import com.pet.message.Message;
import com.pet.message.MessageService;

@Controller("reservation.reservationController")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/reservation/list")
	public ModelAndView list(
			HttpSession session
			,Reservation dto
			,HttpServletRequest req
			,@RequestParam(value="page", defaultValue="1") int current_page
			,@RequestParam(value="searchState", defaultValue="all") String searchState 
			,@RequestParam(value="searchHost", defaultValue="") String searchHost
			,@RequestParam(value="oderList", defaultValue="") String orderList
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setNum(info.getMemberNum());
		dto.setUserName(info.getUserName());
		
		int numPerPage=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchHost=URLDecoder.decode(searchHost, "utf-8");
		}
		
		//전체페이지수
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchState", searchState);
		map.put("searchHost", searchHost);
		map.put("orderList", orderList);
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

		ModelAndView mav=new ModelAndView("/reservation/list");
		mav.addObject("list",list);
		mav.addObject("page",current_page);
		mav.addObject("dataCount",dataCount);
		mav.addObject("paging",util.paging(current_page, total_page));
		return mav;
	}
	
/*	@RequestMapping(value="/reservation/createdform",method=RequestMethod.GET)
	public ModelAndView created(
			HttpSession session
			,Reservation dto
			) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setNum(info.getMemberNum());
		dto.setHostNum(dto.getHostNum());
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		mav.addObject("mode", "created");
		mav.addObject("dto", dto);
	
		return mav;
	}*/
	
	@RequestMapping(value="/reservation/createdform", method=RequestMethod.POST)
	public ModelAndView createdForm(
			HttpSession session,
			Reservation dto
			) throws Exception {		
		
		/*int tax=(int)((double)dto.getCost()*0.1);*/
		int tax=0;
		int tax1=0;
		int total=(int)(tax+(double)dto.getCost());
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setNum(info.getMemberNum());
		dto.setHostNum(dto.getHostNum());
		dto.setTotalCost(total);
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		mav.addObject("mode", "created");
		mav.addObject("dto", dto);
		mav.addObject("tax", tax);
		mav.addObject("tax1", tax1);
		mav.addObject("total", total);
		
		return mav;
	}
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.POST)
	public String createdSubmit(
			Reservation dto
			,Message mto,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		service.insertReservation(dto, "created");
		
		mto.setSendUserId("시스템_예약");
		int num= dto.getHostNum();
		String userId= messageService.userNumSel(num);
		mto.setReceiveUserId(userId);
		mto.setSubject(info.getUserId()+"님이 예약을 신청하셨습니다.");
		String msg="예약 신청일 : "+dto.getCheckIn()+" ~ "+dto.getCheckOut() +"<br>";
		msg+="펫 종류 : " +dto.getPet_type() +" 펫 수 : " +dto.getPet_su() +"<br> 총 가격 : "+dto.getTotalCost();
		msg+="<br><a href=''>수락하러가기</a>";
		mto.setContent(msg);
		
		messageService.insertMessage(mto);
		
		System.out.println(dto.getFees());

		return "redirect:/house/list";
	}
	
	@RequestMapping(value="/reservation/update", method=RequestMethod.GET)
	public ModelAndView updateForm(
			HttpSession session
			,@RequestParam(value="reservationNum") int reservationNum
			) throws Exception {
		
		//SessionInfo info=(SessionInfo)session.getAttribute("member");;
		
		Reservation dto = (Reservation)service.readReservation(reservationNum);
		/*int tax= (int)((double)cost*(double)pet_su*0.1);
		int total= tax+cost;*/
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		mav.addObject("mode", "update");
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value="/reservation/ajaxUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String ajaxUpdateForm(
			HttpSession session
			,Reservation dto,
			Message mto
		) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		service.updateReservation(dto);
		
		mto.setSendUserId("시스템_예약");
		int num= dto.getHostNum();
		String userId= messageService.userNumSel(num);
		mto.setReceiveUserId(userId);
		mto.setSubject(info.getUserId()+"님이 예약을 수정하셨습니다.");
		String msg="예약 신청일 : "+dto.getCheckIn()+" ~ "+dto.getCheckOut() +"<br>";
		msg+="펫 종류 : " +dto.getPet_type() +" 펫 수 : " +dto.getPet_su() +"<br> 총 가격 : "+dto.getTotalCost();
		msg+="<br><a href=''>수락하러가기</a>";
		mto.setContent(msg);
		
		messageService.insertMessage(mto);
		
		return "ok";
	}
	
	@RequestMapping(value="/reservation/update", method=RequestMethod.POST)
	public ModelAndView updateSubmit(
			HttpSession session
			,Reservation dto
			) throws Exception{
		System.out.println("gdgdgdgdgd");
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return new ModelAndView("redirect:/");
		}
		System.out.println(dto.getTax()+"전");
		service.updateReservation(dto);
		System.out.println(dto.getTax()+"후");
		return new ModelAndView("redirect:/member/blog#tab-2");
	}
	
	@RequestMapping(value="/reservation/delete")
	public String delete(
			@RequestParam(value="reservationNum") int reservationNum
			,@RequestParam(value="page", defaultValue="1") String page
			) throws Exception {

		service.deleteReservation(reservationNum);
		
		return "redirect:/member/blog#tab-3";
	}
}
