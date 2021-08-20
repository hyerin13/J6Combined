package com.jhta.project.controller.kjy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController_kjy {
	@RequestMapping(value="/user/kjy/chat", method= RequestMethod.GET)
	public ModelAndView AccommodationsForm() {
		ModelAndView mv=new ModelAndView("user/kjy/chat");
		return mv;
	}
}
