package com.jhta.project.controller.phj;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.phj.ReservationServicephj;
import com.jhta.project.vo.phj.ReservationVo;

@Controller
public class ReservationController_phj {
	@Autowired private ReservationServicephj service;
	@GetMapping("phj/pay")
	public String payForm() {
		return "user/phj/pay";
	}
	
	@RequestMapping(value="phj/reservation",method=RequestMethod.GET)
	public ModelAndView ReservationInfo(String riid, String startday, String endday, String ramount, String mid, 
			String sum) {
		ModelAndView mv=new ModelAndView("user/phj/resinfo");
		mv.addObject("riid",riid);
		mv.addObject("startday",startday);
		mv.addObject("endday",endday);
		mv.addObject("ramount",ramount);
		mv.addObject("sum",sum);
		mv.addObject("mid",mid);
		return mv;
	}
	@RequestMapping(value="phj/insert",produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, String> insert(
			@RequestBody ReservationVo vo,Model model) {
		HashMap<String, String> map=new HashMap<String, String>();
		try {
			service.insertRes(vo);
			map.put("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("code","fail");
		}
		return map;
	}
}
