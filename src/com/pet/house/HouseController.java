package com.pet.house;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("house.houseController")
public class HouseController {
	
	
	// 검색 결과 창
	@RequestMapping(value="house/list")
	public ModelAndView houseList() throws Exception{
		ModelAndView mav = new ModelAndView(".house.list");
		return mav;
	}
	// 검색 결과 창
	@RequestMapping(value="house/join", method=RequestMethod.GET)
	public ModelAndView houseJoinInput() throws Exception{
		ModelAndView mav = new ModelAndView(".house.join");
		return mav;
	}
	@RequestMapping(value="house/join", method=RequestMethod.POST)
	public ModelAndView houseJoinSubmit() throws Exception{
		ModelAndView mav = new ModelAndView(".house.join");
		return mav;
	}
	
	// 호스팅한 집 정보(블로그형식으로 수정 필요)
	@RequestMapping(value="house/houseinfo")
	public ModelAndView houseInfo() throws Exception{
		ModelAndView mav = new ModelAndView(".house.houseinfo");
		return mav;
	}
	// 호스팅한 집, 예약 받은 정보(블로그형식으로 수정 필요)
	@RequestMapping(value="house/house_reservation")
	public ModelAndView houseReservationInfo() throws Exception{
		ModelAndView mav = new ModelAndView(".house.house_reservation");
		return mav;
	}

}
