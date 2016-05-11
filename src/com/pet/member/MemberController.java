package com.pet.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public ModelAndView loginForm() throws Exception{
		return new ModelAndView(".login.register");
	}
	
	
	@RequestMapping(value="/member/member", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView memberSubmit(Member dto){
		int result =service.insertMemeber(dto);
		
		ModelAndView mav=new ModelAndView();
		
		if(result==1){
			StringBuffer sb=new StringBuffer();
			mav.setViewName(".member.complete");
			mav.addObject("message", sb.toString());
	
			
		}else{
			mav.setViewName(".member.member");
			mav.addObject("mode", "created");
			
		}
		return mav;
	}
	
	
}
