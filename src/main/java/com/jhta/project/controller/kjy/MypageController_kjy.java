package com.jhta.project.controller.kjy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.mybatis.mapper.kjy.MypageMapperkjy;
import com.jhta.project.vo.kjy.MypageVo_kjy;

@Controller
public class MypageController_kjy {
	@Autowired private MypageMapperkjy service;
	
	@RequestMapping(value="/user/kjy/mypage", method = RequestMethod.GET)
	public ModelAndView MypageForm(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("/user/kjy/mypage");
		HttpSession session=request.getSession(true);
		String mid=(String)session.getAttribute("mid");
		MypageVo_kjy vo=service.list(mid);
		String initial=mid.substring(0,1);
		mv.addObject("initial", initial);
		mv.addObject("vo", vo);
		return mv;
	}
}
