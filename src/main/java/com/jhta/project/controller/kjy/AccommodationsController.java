package com.jhta.project.controller.kjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.kjy.AccommodationsService;
import com.jhta.project.vo.kjy.AccommodationsVo;

@Controller
public class AccommodationsController {
	@Autowired private AccommodationsService service;
	
	@RequestMapping(value="/user/kjy/accommodations", method= RequestMethod.GET)
	public ModelAndView AccommodationsForm() {
		ModelAndView mv=new ModelAndView("user/kjy/accommodations");
		try {
			List<AccommodationsVo> list=service.list();
			mv.addObject("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
