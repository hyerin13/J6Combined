package com.jhta.project.controller.kjy;


import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
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

import com.jhta.mybatis.mapper.kjy.MypageMapperkjy;
import com.jhta.project.vo.kjy.FavoriteVo_kjy;
import com.jhta.project.vo.kjy.MypageVo_kjy;

@Controller
public class MypageController_kjy {
	@Autowired private MypageMapperkjy service;
	
	@RequestMapping(value="/user/kjy/mypage", method = RequestMethod.GET)
	public ModelAndView MypageForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mv=new ModelAndView("/user/kjy/mypage");
		HttpSession session=req.getSession(true);
		//ID세션에서 불러오기
		String mid=(String)session.getAttribute("mid");
		
		MypageVo_kjy vo=service.list(mid);
		String initial=mid.substring(0,1);
		mv.addObject("initial", initial);
		mv.addObject("vo", vo);
		return mv;
	}
	
	//프로필사진 삭제
	@RequestMapping(value="/user/kjy/profiledel", produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody int profiledel(HttpServletRequest req, HttpServletResponse resp){
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid");
		int n=service.profiledel(mid);
		return n;
	}
}
