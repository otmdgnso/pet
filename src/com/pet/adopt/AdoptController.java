package com.pet.adopt;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pet.member.SessionInfo;

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
	public ModelAndView create(
			HttpSession session
			) throws Exception {
		ModelAndView mav = new ModelAndView(".adopt.created");
		mav.addObject("mode","created");
		return mav;
	}
	
	@RequestMapping(value="/apopt/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			Adopt dto
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("userId");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"apopt";
		
		
		
		
		return "redirect:/adopt/list";
	}
	
	
	
	
	
	
	
	
	
	
	
}
