package com.pet.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("pay.payController")
public class payController {

	@RequestMapping(value="/pay/reservepay")
	public ModelAndView list() throws Exception {
		ModelAndView mav=new ModelAndView(".pay.reservepay");
		return mav;
	}
	
	@RequestMapping(value="/pay/paycomplete")
	public ModelAndView complete() throws Exception {
		ModelAndView mav=new ModelAndView(".pay.paycomplete");
		return mav;
	}	
}
