package com.jhta.project.controller.lhj;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.lhj.AccommodationsServicelhj;
import com.jhta.project.vo.lhjcjy.AccommodationsVolhjcjy;



@Controller
public class AccommodationsControllerlhj {
	@Autowired private AccommodationsServicelhj service;
	
	@GetMapping("admin/lhj/accommSearch") //숙소 목록 불러오기
	public HashMap<String, Object> accommList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<AccommodationsVolhjcjy> accommList = service.accommList();
		map.put("list", accommList);
		return map;
	}		
}
