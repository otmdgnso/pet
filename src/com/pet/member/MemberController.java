package com.pet.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.member.SessionInfo;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> loginSubmit(
			HttpSession session,
			@RequestParam(value="userId") String userId,
			@RequestParam(value="pwd") String pwd
			) throws Exception{

		Member dto=service.readMember(userId);
		String state = "true";
		String userName="no";
		if(dto==null||(!dto.getPwd().equals(pwd))){
			 state="false";
		} else {
			userName=dto.getUserName();
			SessionInfo info = new SessionInfo();
			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());
			info.setMemberNum(dto.getNum());
			session.setAttribute("member", info);
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("userName", userName);
		
		return model;
	}
	
	@RequestMapping(value="/member/logout")
	public String logout(
			HttpSession session
			) throws Exception{
		
		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memberSubmit(Member dto){
		
		
		Map<String , Object> model=new HashMap<>();
		
		
		return model;
	}
	
	
}
