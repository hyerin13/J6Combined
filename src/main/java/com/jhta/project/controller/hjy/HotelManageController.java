package com.jhta.project.controller.hjy;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.project.service.hjy.HotelManageService;


@Controller
public class HotelManageController {
	@Autowired HotelManageService service;
	@GetMapping("hjy/hotelType")
	public String hotelInsertForm1() {
		int n = service.insert();
		System.out.println(n);
		return "user/hjy/hotelManage/hotelType";
	}
	@GetMapping("hjy/hotelCategory")
	public String hotelInsertForm2(String type) {
		return "user/hjy/hotelManage/hotelCate_"+type;
	}
}
