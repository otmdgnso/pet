package com.pet.photo;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pet.member.SessionInfo;

@Controller("photo.photoController")
public class PhotoController {
	@Autowired
	private PhotoService service;
	
	@RequestMapping(value="/photo/photo")
	public ModelAndView list() throws Exception {
		
		ModelAndView mav=new ModelAndView(".photo.photo");
		return mav;
	}
	
	@RequestMapping(value="/photo/created", method=RequestMethod.GET)
	public ModelAndView created() throws Exception{
			
		ModelAndView mav=new ModelAndView(".photo.created");
		mav.addObject("mode","created");
		
		return mav;
	}
	
	@RequestMapping(value="/photo/created", method=RequestMethod.POST)
	public String createdSubmit(
			HttpSession session,
			Photo dto
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		
		dto.setNum(info.getMemberNum());
		service.insertPhoto(dto, pathname);
		return "redirect:/photo/photo";
	}
}
