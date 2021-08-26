package com.jhta.project.controller.kjy;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.jhta.project.vo.kjy.Chat_messageVo_kjy;
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
		HashMap<String, Object> countmap=new HashMap<String, Object>();
		List<HashMap<String, Object>> countlist=new ArrayList<HashMap<String,Object>>();
		List<HashMap<String, Object>> chat_rank=service.chat_rank(cmid);
		for (int i=0; i<chat_rank.size(); i++) {
			HashMap<String, Object> str = chat_rank.get(i);
			str.put("cmid", cmid);
			countmap=service.count(str);
			countlist.add(countmap);
		}
		map.put("countlist", countlist);
		return map;
	}
	
	@RequestMapping(value="/user/kjy/chat_room2", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> chat_room2(String cmid, String crid){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cmid", cmid);
		map.put("crid", crid);
		List<Chat_roomjoinVo_kjy> list=service.roomjoin(map);
		List<Chat_messageVo_kjy> list2=service.chat_message_recently(crid);
		HashMap<String, Object> listmap=new HashMap<String, Object>();
		listmap.put("list", list);
		listmap.put("list2", list2);
		return listmap;
	}
	@RequestMapping(value="/user/kjy/chating_check", method= RequestMethod.GET)
	public ModelAndView chating_check(String cmid, String cbbuid, String cmprofile, String cmname) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		ModelAndView mv=new ModelAndView("user/kjy/chat_room");
		int cnt=0;
		int crid=0;
		boolean check=false; //방여부 체크
		//cmid=본인아이디, cbbuid=친구아이디
		HashMap<String, Object> checkmap=new HashMap<String, Object>();
		checkmap.put("cmid", cmid);
		checkmap.put("cbbuid", cbbuid);
		List<Chat_roomjoinVo_kjy> roomcheck=service.roomcheck(checkmap);
		if(roomcheck.isEmpty()) {
			//검색결과 아무것도 없을경우
			check=true;
		}
		if(check==false) {
			check=true;
			//검색결과는 있으나 2명이상 방일경우(신규생성가능)
			for(Chat_roomjoinVo_kjy vo:roomcheck) {
				cnt=service.roomcheck_cnt(vo.getCrid());
				if(cnt==2) {
					check=false;
					break;
				}
			}
		}

		if(check==true) {
			//새로 방 생성
			int n1=service.chat_room_insert();
			//방금 생성한 시퀀스 번호 확인(방번호)
			crid=service.room_seq();
			HashMap<String, Object> roomjoin=new HashMap<String, Object>();
			roomjoin.put("cmid",cmid);
			roomjoin.put("crid",crid);
			//cmid=본인아이디로 된 roomjoin생성
			int n2=service.chat_roomjoin_insert(roomjoin);
			roomjoin.put("cmid", cbbuid);
			//cbbuid=친구아이디로 된 roomjoin생성
			int n3=service.chat_roomjoin_insert(roomjoin);
			if(n1==0 && n2==0 && n3==0) {
				System.out.println("방생성 오류발생");
			}
			mv.addObject("cmid",cmid);//본인아이디 전송
			mv.addObject("cmprofile", cmprofile);//본인 프로필 전송
			mv.addObject("cmname",cmname);//본인 이름 전송
			mv.addObject("cbbuid", cbbuid);//친구아이디 전송
			mv.addObject("crid",crid);//방번호 전송
		}else if(check==false) {
			//기존에 있던 방 열기
			mv.addObject("cmid",cmid);//본인아이디 전송
			mv.addObject("cmprofile", cmprofile);//본인 프로필 전송
			mv.addObject("cmname",cmname);//본인 이름 전송
			mv.addObject("cbbuid", cbbuid);//친구아이디 전송
			mv.addObject("crid",crid);//방번호 전송
		}
		return mv;
	}
	
	@RequestMapping(value="/user/kjy/chating_room", method= RequestMethod.GET)
	public ModelAndView chating_room(String cmid, String crid, String cmprofile, String cmname) {
		ModelAndView mv=new ModelAndView("user/kjy/chat_room");
		mv.addObject("cmid",cmid);//본인아이디 전송
		mv.addObject("cmprofile", cmprofile);//본인 프로필 전송
		mv.addObject("cmname",cmname);//본인 이름 전송
		mv.addObject("crid",crid);//방번호 전송
		return mv;
	}
	
	@RequestMapping(value="/user/kjy/messagelist", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> messagelist(String crid){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int crid1=Integer.parseInt(crid);
		List<Chat_messageVo_kjy> list=service.chat_message_list(crid1);
		map.put("list", list);
		return map;
	}
}
