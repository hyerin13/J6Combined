package com.jhta.project.controller.kjy;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.mybatis.mapper.kjy.FavoritesearchMapperkjy;
import com.jhta.project.vo.kjy.FavoritesearchVo_kjy;

@Controller
public class FavoritesearchController_kjy {
	@Autowired private FavoritesearchMapperkjy service;
	
	@RequestMapping(value="/user/kjy/hotelseach", produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> hotelsearch(String hotel){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<FavoritesearchVo_kjy> list=service.hotelsearch(hotel);
		map.put("hotel",list);
		return map;
	}
	
	@RequestMapping(value="/user/kjy/airportsearch", produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> airportsearch(String portname){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<String> list=service.airportsearch(portname);
		map.put("port", list);
		return map;
	}
	
	@RequestMapping(value="/user/kjy/airlinesearch", produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> airlinesearch(String airname){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<String> list=service.airlinesearch(airname);
		map.put("air", list);
		return map;
	}
}
