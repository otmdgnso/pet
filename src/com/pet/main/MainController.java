package com.pet.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pet.photo.PhotoService;

@Controller("mainController")
public class MainController {
	@Autowired
	private PhotoService photoService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String mainPage() throws Exception{
				
		return ".mainLayout";
	}	
	
}
