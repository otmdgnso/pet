package com.pet.house;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("house.houseController")
public class HouseController {
	
	
	// �˻� ��� â
	@RequestMapping(value="house/list")
	public ModelAndView houseList() throws Exception{
		ModelAndView mav = new ModelAndView(".house.list");
		return mav;
	}
	
	/*// ȣ���� ���
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
	
	// ȣ���� ��Ͻ� �ʿ��� ī�װ� 
	/*@RequestMapping(value="house/listCategory2", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listCategory2(String category1) throws Exception{
		List<Location> list = locationService.listCategory2(category1);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return model;
	}*/
	
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
