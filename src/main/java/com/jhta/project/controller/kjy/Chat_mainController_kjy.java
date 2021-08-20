package com.jhta.project.controller.kjy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Chat_mainController_kjy {
	@RequestMapping(value="/user/kjy/chat_main", method= RequestMethod.GET)
	public ModelAndView AccommodationsForm() {
		ModelAndView mv=new ModelAndView("user/kjy/chat_main");
		return mv;
	}
}
