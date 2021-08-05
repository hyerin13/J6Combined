package com.jhta.project.controller.hjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.hjy.CommentsServiceHjy;
import com.jhta.project.vo.hjy.CommentsVo;

@RestController
public class CommentsAjaxControllerHjy {
	@Autowired
	CommentsServiceHjy commentsService;
	@RequestMapping(value="hjy/commentList", produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> commentList(int bid) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			List<CommentsVo> list = commentsService.list(bid);
			map.put("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping(value="hjy/commentInsert", produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> list(Model model, CommentsVo vo) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			vo.setClev(0);
			vo.setCstep(0);
			commentsService.insert(vo);
			map.put("code", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}
	@RequestMapping(value="hjy/commentPlus", produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> commentPlus(CommentsVo vo) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			vo.setClev(vo.getClev()+1);
			commentsService.insertPlus(vo);
			commentsService.update(vo.getCstep());
			vo.setCstep(vo.getCstep()+1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
