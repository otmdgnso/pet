package com.pet.message;

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

@Controller("message.messageController")
public class MessageController {
	@Autowired
	private MessageService service;
	
	@RequestMapping(value="/message/send", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendSubmit(
			HttpSession session, Message dto) throws Exception {
		// 메시지 보내기
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		dto.setSendUserId(info.getUserId());
		
		service.insertMessage(dto);
		
		Map<String, Object> model = new HashMap<>();
		return model;
	
	}
	@RequestMapping(value="/message/list")
	public ModelAndView list(
			@RequestParam(value="pageNo",defaultValue="1")int current_page
			) throws Exception {
		ModelAndView mav = new ModelAndView(".message.list");
		return mav;
	}
}
