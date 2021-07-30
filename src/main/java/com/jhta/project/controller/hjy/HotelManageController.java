package com.jhta.project.controller.hjy;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.hjy.AccommodationsService_hjy;
import com.jhta.project.service.hjy.Additional_feeService_hjy;
import com.jhta.project.service.hjy.PeriodService_hjy;
import com.jhta.project.service.hjy.Room_infoService_hjy;
import com.jhta.project.vo.hjy.AccommodationsVo;
import com.jhta.project.vo.hjy.Additional_feeVo;
import com.jhta.project.vo.hjy.PeriodVo;
import com.jhta.project.vo.hjy.Room_InfoVo;

@Controller
public class HotelManageController {
	@Autowired AccommodationsService_hjy Accommodationsservice;
	@Autowired Room_infoService_hjy roomInfoservice;
	@Autowired PeriodService_hjy periodservice;
	@Autowired Additional_feeService_hjy additional_feeservice;
	@GetMapping("hjy/hotelType")
	public String hotelInsertForm1() {
		return "user/hjy/hotelManage/hotelType";
	}
	@GetMapping("hjy/hotelCategory")
	public String hotelInsertForm2(String type) {
//		return "user/hjy/hotelManage/hotelSignUp";
//		return "user/hjy/hotelManage/hotelCate_"+type;
		return "user/hjy/hotelManage/form";
	}
	@PostMapping("hjy/hotelreq")
	public String hotelRequest(AccommodationsVo accommodationsVo, Additional_feeVo additional_feeVo, PeriodVo periodVo, Room_InfoVo roomInfoVo) {
		int n = Accommodationsservice.insert(accommodationsVo);
		int n1= roomInfoservice.insert(roomInfoVo);
		int n2= periodservice.insert(periodVo);
		int n3 = additional_feeservice.insert(additional_feeVo);
		System.out.println(n+"개 추가");
		System.out.println(n1+"개 추가");
		System.out.println(n2+"개 추가");
		System.out.println(n3+"개 추가");
		return "user/hjy/hotelManage/result";
	}
}
