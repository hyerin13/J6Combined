package com.jhta.project.controller.lhj;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.lhj.AccommodationsServicelhj;
import com.jhta.project.vo.lhj.AccommodationsVo;
import com.jhta.util.PageUtil;



@RestController
public class AccommodationsControllerlhj {
	@Autowired private AccommodationsServicelhj acservice;
	
	@RequestMapping(value = "admin/lhj/accommlist", produces = {MediaType.APPLICATION_JSON_VALUE}) //숙소 목록 불러오기
	public HashMap<String, Object> accommList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<AccommodationsVo> list = acservice.accommlist();
		map.put("list", list);
		//System.out.println("컨트롤러: " + list);
		return map;
	}
	
	@RequestMapping(value = "admin/lhj/detail", produces = {MediaType.APPLICATION_JSON_VALUE}) //개별 숙소 목록 불러오기
	public HashMap<String, Object> detail(int aid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<AccommodationsVo> list = acservice.detail(aid);
		System.out.println("컨트롤러: " + aid);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value = "admin/lhj/accommUpdate", produces = {MediaType.APPLICATION_JSON_VALUE}) //숙소 정보 변경하기
	public String accommUpdate(AccommodationsVo vo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int aid = vo.getAid();
		acservice.detail(aid);
		int n = acservice.accommUpdate(vo);
		if(n>0) {
			return "redirect:/admin/lhj/accommlist";
		}else {
			return "admin/lhj/accommUpdate";
		}
	}
}
