package com.pet.message;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("message.messageController")
public class MessageController {
	
	
	
	
	@RequestMapping(value="/message/list")
	public ModelAndView list() throws Exception {
		ModelAndView mav = new ModelAndView(".message.list");
		return mav;
	}
}
