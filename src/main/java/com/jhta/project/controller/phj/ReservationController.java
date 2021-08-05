package com.jhta.project.controller.phj;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.project.service.phj.ReservationServicephj;
import com.jhta.project.vo.phj.ReservationVo;

@Controller
public class ReservationController {
	@Autowired private ReservationServicephj service;
	
	@GetMapping("/reservation")
	public String reservationForm() {
		return "user/phj/resinfo";
	}
	
	@RequestMapping(value="/reservation", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> reservation(ReservationVo vo) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		try {
			service.insertRes(vo);
			map.put("code","예약성공");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("code","예약실패");
		}
		return map;
	}
}
