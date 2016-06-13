package com.pet.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pet.adopt.Adopt;
import com.pet.adopt.AdoptService;
import com.pet.house.House;
import com.pet.house.HouseService;
import com.pet.member.SessionInfo;
import com.pet.message.Message;
import com.pet.message.MessageService;

@Controller("pay.payController")
public class PayController {
	
	@Autowired
	MessageService messageservice;	
	@Autowired
	AdoptService adoptservice;
	@Autowired
	PayService payservice;
	@Autowired
	HouseService houseservice;

	@RequestMapping(value="/pay/reservepay")
	public ModelAndView list(
			Pay dto,
			@RequestParam int hostNum,
			@RequestParam int reservationNum
			) throws Exception {
				
		Map<String, Object> map=new HashMap<>();
		map.put("hostNum", hostNum);
		map.put("reservationNum", reservationNum);
		
		map.put("start", 1);
		map.put("end", 1);
		
		List<House> list=houseservice.listHouse(map);
		
		dto=payservice.listHost(map);		
		
		ModelAndView mav=new ModelAndView(".pay.reservepay");		
		mav.addObject("dto",dto);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping(value="/pay/paycomplete", method=RequestMethod.POST)
	public ModelAndView complete(
			Pay dto,
			@RequestParam int reservationNum
			) throws Exception {
		payservice.insertpay(dto);
		ModelAndView mav=new ModelAndView(".pay.paycomplete");
		return mav;
	}
	
	@RequestMapping(value="/pay/paycompleteAdopt")
	public ModelAndView paycompleteAdopt(
			Adopt dto
			) throws Exception {
		adoptservice.payCompleteAdopt(dto);
		ModelAndView mav=new ModelAndView(".pay.paycomplete");
		return mav;
	}
	
	@RequestMapping(value="/pay/adoptpay")
	public ModelAndView listAdopt(HttpSession session,
			@RequestParam(value="preSaleNum") int preSaleNum
			) throws Exception {
		
		Adopt dto = adoptservice.readPreSale(preSaleNum);
		
		ModelAndView mav=new ModelAndView(".pay.adoptpay");
		mav.addObject("dto", dto);
		return mav;
	}
}
