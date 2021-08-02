package com.jhta.project.controller.lhjcjy;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.lhjcjy.FirstSearchService;
import com.jhta.project.vo.lhjcjy.AccommodationsVo;

@RestController
public class FirstSearchAjaxController {
	@Autowired private FirstSearchService service;
	
	@RequestMapping(value="/lhjcjy/ajax/auto", produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> autolist(Locale locale, Model model,String aname) {
		HashMap<String, Object> map =new HashMap<String, Object>();
		List<AccommodationsVo> list= service.findhotel(aname);
		System.out.println(list);
		map.put("list", list);
		return map;
	}
}
