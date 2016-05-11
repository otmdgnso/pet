package com.pet.adopt;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("adopt.adoptController")
public class AdoptController {
	@Autowired
	private AdoptService service;
	
	@RequestMapping(value="/adopt/list")
	public ModelAndView list() throws Exception {
		ModelAndView mav = new ModelAndView(".adopt.list");
		return mav;
	}
	
	@RequestMapping(value="/adopt/created", method=RequestMethod.GET)
	public ModelAndView create() throws Exception {
		ModelAndView mav = new ModelAndView(".adopt.created");
		return mav;
	}
	
	public String createSubmit(
			HttpSession session,
			Adopt dto
			) throws Exception {
		String root=session.getServletContext().getRealPath("/");
		
		
		return "redirect:/adopt/list";
	}
	
	
	
	
	
	
	
	
	
	
	
}
