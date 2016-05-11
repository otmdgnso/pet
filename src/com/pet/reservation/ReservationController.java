package com.pet.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("reservation.reservationController")
public class ReservationController {
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.GET)
	public ModelAndView createdForm() throws Exception {
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		return mav;
	}

}
