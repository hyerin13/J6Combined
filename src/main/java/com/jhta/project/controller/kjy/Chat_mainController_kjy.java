package com.jhta.project.controller.kjy;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.mybatis.mapper.kjy.ChatMapperkjy;
import com.jhta.project.vo.kjy.Chat_buddyVo_kjy;
import com.jhta.project.vo.kjy.Chat_membersVo_kjy;
import com.jhta.project.vo.kjy.Chat_roomjoinVo_kjy;

@Controller
public class Chat_mainController_kjy {
	@Autowired private ChatMapperkjy service;
	
	@RequestMapping(value="/user/kjy/chat_main", method= RequestMethod.GET)
	public ModelAndView chat_Form(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mv=new ModelAndView("user/kjy/chat_main");
		HttpSession session=req.getSession();
		String cmid=(String)session.getAttribute("mid");
		//본인 프로필 불러오기
		Chat_membersVo_kjy vo=service.member(cmid);
		//날짜 형식 변경
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strNowDate = simpleDateFormat.format(vo.getCmbirth());
		
		//친구목록 불러오기
		List<Chat_membersVo_kjy> list=service.buddy(cmid);
		
		mv.addObject("list",list);
		mv.addObject("strNowDate",strNowDate);
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/user/kjy/chat_room1", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> chat_room1(String cmid){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<HashMap<String, Object>> countlist=service.count(cmid);
		map.put("countlist", countlist);
		return map;
	}
	
	@RequestMapping(value="/user/kjy/chat_room2", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> chat_room2(String cmid, String crid){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cmid", cmid);
		map.put("crid", crid);
		List<Chat_roomjoinVo_kjy> list=service.roomjoin(map);
		HashMap<String, Object> listmap=new HashMap<String, Object>();
		listmap.put("list", list);
		return listmap;
	}
	
	@RequestMapping(value="/user/kjy/chating", method= RequestMethod.GET)
	public ModelAndView chating(HttpServletRequest req, HttpServletResponse resp, String crid) {
		ModelAndView mv=new ModelAndView("user/kjy/chat_room");
		//System.out.println(crid);
		return mv;
	}
}
