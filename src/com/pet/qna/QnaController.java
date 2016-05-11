package com.pet.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {

	@RequestMapping(value="/qna/qna")
	public ModelAndView list() throws Exception {
		
		ModelAndView mav=new ModelAndView(".qna.qna");
		return mav;
	}
}
