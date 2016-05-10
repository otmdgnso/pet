package com.pet.photo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("photo.photoController")
public class PhotoController {

	@RequestMapping(value="/photo/photo")
	public ModelAndView list() throws Exception {
		
		ModelAndView mav=new ModelAndView(".photo.photo");
		return mav;
	}
}
