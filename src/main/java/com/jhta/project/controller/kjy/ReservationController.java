package com.jhta.project.controller.kjy;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {
	
	@RequestMapping(value="/user/kjy/reservation", method = RequestMethod.GET)
	public ModelAndView ReservationForm(String RIID, String STARTDAY, String ENDDAY, String RAMOUNT, String MID, 
			String SUM) {
		ModelAndView mv=new ModelAndView("user/kjy/reservation");
		mv.addObject("RIID",RIID);
		mv.addObject("STARTDAY",STARTDAY);
		mv.addObject("ENDDAY",ENDDAY);
		mv.addObject("RAMOUNT",RAMOUNT);
		mv.addObject("SUM",SUM);
		mv.addObject("MID",MID);
		return mv;
	}
}
