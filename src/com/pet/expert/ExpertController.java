package com.pet.expert;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExpertController {
	
	@RequestMapping(value="/expert/expert")
	public ModelAndView list() throws Exception {
		
		ModelAndView mav=new ModelAndView("/expert/expert");
		return mav;
	}
}
