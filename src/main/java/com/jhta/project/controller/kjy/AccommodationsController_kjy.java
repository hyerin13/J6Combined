package com.jhta.project.controller.kjy;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AccommodationsController_kjy {
	
	@RequestMapping(value="/user/kjy/accommodations", method= RequestMethod.GET)
	public ModelAndView AccommodationsForm() {
		ModelAndView mv=new ModelAndView("user/kjy/accommodations");
		return mv;
	}
	
	@RequestMapping(value="/user/kjy/accommodations", method= RequestMethod.POST)
	public ModelAndView Accommodations(String mid, HttpServletRequest request) {
		HttpSession session=request.getSession(true);
		session.setAttribute("mid",mid);
		ModelAndView mv=new ModelAndView("user/kjy/accommodations");
		return mv;
	}
}
