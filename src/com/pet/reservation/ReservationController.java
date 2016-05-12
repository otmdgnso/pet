package com.pet.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("reservation.reservationController")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@RequestMapping(value="/reservation/list")
	public ModelAndView list() throws Exception {
		
		ModelAndView mav=new ModelAndView(".reservation.list");
		return mav;
	}
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.GET)
	public ModelAndView createdForm() throws Exception {
		
		ModelAndView mav=new ModelAndView(".reservation.created");
		mav.addObject("mode", "created");
		return mav;
	}
	
	@RequestMapping(value="/reservation/created", method=RequestMethod.POST)
	public String createdSubmit(Reservation dto) throws Exception {
		service.insertReservation(dto, "created");
		
		return "redirect:/reservation/created";
	}

}
