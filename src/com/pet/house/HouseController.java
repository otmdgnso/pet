package com.pet.house;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("house.houseController")
public class HouseController {
	
	
	// 검색 결과 창
	@RequestMapping(value="house/list")
	public ModelAndView houseList() throws Exception{
		ModelAndView mav = new ModelAndView(".house.list");
		return mav;
	}
	
	/*// 호스팅 등록
	@RequestMapping(value="house/join", method=RequestMethod.GET)
	public ModelAndView houseJoinInput() throws Exception{
		List<Location> list = locationService.listCategory1();
		
		
		ModelAndView mav = new ModelAndView(".house.join");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping(value="house/join", method=RequestMethod.POST)
	public ModelAndView houseJoinSubmit() throws Exception{
		ModelAndView mav = new ModelAndView(".house.join");
		return mav;
	}*/
	
	// 호스팅 등록시 필요한 카테고리 
	/*@RequestMapping(value="house/listCategory2", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listCategory2(String category1) throws Exception{
		List<Location> list = locationService.listCategory2(category1);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return model;
	}*/
	
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
