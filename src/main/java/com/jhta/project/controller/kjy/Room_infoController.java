package com.jhta.project.controller.kjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.kjy.Room_infoService;
import com.jhta.project.vo.kjy.Room_infoVo;

@Controller
public class Room_infoController {
	@Autowired private Room_infoService service;
	
	@RequestMapping(value="/user/kjy/room_info", method= RequestMethod.GET)
	public ModelAndView Room_infoForm(int AID) {
		ModelAndView mv=new ModelAndView("user/kjy/room_info");
		try {
			List<Room_infoVo> list=service.list(AID);
			mv.addObject("list",list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
