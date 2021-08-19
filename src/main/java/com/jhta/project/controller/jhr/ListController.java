package com.jhta.project.controller.jhr;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.mybatis.mapper.jhr.UserqnaMapper;
import com.jhta.project.vo.jhr.UserqnaVo;

@Controller
public class ListController {
	@Autowired UserqnaMapper service;
	@RequestMapping(value="/user/jhr/list", produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> reservationlist(HttpServletRequest req, HttpServletResponse resp){
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid");
		List<UserqnaVo> list=service.detail2(mid);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
}
