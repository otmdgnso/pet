package com.pet.house;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pet.member.SessionInfo;

@Controller("house.houseController2")
public class HouseContorller2 {
	
	@Autowired
	LocationService locationService;
	
	@RequestMapping(value="/house/joina", method=RequestMethod.GET)
	public ModelAndView houseJoinInput() throws Exception{
		List<Location> list = locationService.listCategory1();		
		
		ModelAndView mav = new ModelAndView(".house.join");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping(value="/house/joina", method=RequestMethod.POST)
	public String houseJoinSubmit(House dto, HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"adopt";
		
		dto.setNum(info.getMemberNum());
		//service.insertHouseInfo(dto, pathname);

		return "redirect:/adopt/list";
	}
}
