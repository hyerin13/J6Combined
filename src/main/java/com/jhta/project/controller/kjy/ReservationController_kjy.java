package com.jhta.project.controller.kjy;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController_kjy {
	
	@RequestMapping(value="/user/kjy/reservation", method = RequestMethod.GET)
	public ModelAndView ReservationForm(String riid, String startday, String endday, String ramount, String mid, 
			String sum) {
		ModelAndView mv=new ModelAndView("user/kjy/reservation");
		mv.addObject("riid",riid);
		mv.addObject("startday",startday);
		mv.addObject("endday",endday);
		mv.addObject("ramount",ramount);
		mv.addObject("sum",sum);
		mv.addObject("mid",mid);
		return mv;
	}
}
