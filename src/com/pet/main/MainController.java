package com.pet.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mainController")
public class MainController {
	
	@RequestMapping(value="/main")
	public String mainPage() throws Exception{
		return ".mainLayout";
	}
}
