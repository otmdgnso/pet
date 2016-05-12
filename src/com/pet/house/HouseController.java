package com.pet.house;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("house.houseController")
public class HouseController {
	
	
	// �˻� ��� â
	@RequestMapping(value="house/list")
	public ModelAndView houseList() throws Exception{
		ModelAndView mav = new ModelAndView(".house.list");
		return mav;
	}
	// �˻� ��� â
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
	
	// ȣ������ �� ����(��α��������� ���� �ʿ�)
	@RequestMapping(value="house/houseinfo")
	public ModelAndView houseInfo() throws Exception{
		ModelAndView mav = new ModelAndView(".house.houseinfo");
		return mav;
	}
	// ȣ������ ��, ���� ���� ����(��α��������� ���� �ʿ�)
	@RequestMapping(value="house/house_reservation")
	public ModelAndView houseReservationInfo() throws Exception{
		ModelAndView mav = new ModelAndView(".house.house_reservation");
		return mav;
	}

}
