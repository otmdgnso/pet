package com.pet.main;

import java.net.URLEncoder;
import java.util.Currency;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pet.adopt.Adopt;
import com.pet.adopt.AdoptService;
import com.pet.photo.Photo;
import com.pet.photo.PhotoService;

@Controller("mainController")
public class MainController {
	@Autowired
	private PhotoService photoService;
	@Autowired
	private AdoptService adoptService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView mainPage() throws Exception{		
		
		Map<String, Object> map=new HashMap<>();		
		int start=1;
		int end=6;
		map.put("start", start);
		map.put("end", end);
		
		List<Photo> list=photoService.mainListPhoto(map);
		List<Adopt> listAdopt=adoptService.listPreSale(map);
				
		ModelAndView mav=new ModelAndView(".mainLayout");
		mav.addObject("list",list);
		mav.addObject("listAdopt",listAdopt);
		return mav;
	}	
	
}






