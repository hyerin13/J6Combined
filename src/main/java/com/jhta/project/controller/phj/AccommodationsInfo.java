package com.jhta.project.controller.phj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.phj.AccommodationsService_phj;
import com.jhta.project.vo.phj.AccommodationsVo;

@Controller
public class AccommodationsInfo {
	@Autowired private AccommodationsService_phj service;
	@GetMapping("/test")
	public String test() {
		return "user/phj/test";
	}
	
	@RequestMapping(value="phj/accoinfo")
	public String accoinfo(int aid,Model model) {
		AccommodationsVo vo=service.select(1);
		model.addAttribute("vo",vo);
		return "resinfo";
	}
}
