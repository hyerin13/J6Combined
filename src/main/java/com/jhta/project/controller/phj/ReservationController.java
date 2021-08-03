package com.jhta.project.controller.phj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.phj.ReservationServicephj;
import com.jhta.project.vo.phj.ReservationVo;

@Controller
public class ReservationController {
	@Autowired private ReservationServicephj service;
	
	@GetMapping("/reservation")
	public String reservationForm() {
		return "user/phj/resinfo";
	}
	
	@PostMapping("/reservation")
	public String reservation(ReservationVo vo,Model model) {
		try {
			service.insertRes(vo);
			model.addAttribute("code","예약성공");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("code","예약실패");
		}
		return "user/phj/resultpage";
	}
}
