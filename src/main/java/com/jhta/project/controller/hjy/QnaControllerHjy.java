package com.jhta.project.controller.hjy;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.hjy.UserqnaServiceHjy;
import com.jhta.project.vo.hjy.UserqnaVo;
import com.jhta.util.PageUtil;

@Controller
public class QnaControllerHjy {
	@Autowired UserqnaServiceHjy userqnaService;
	@GetMapping("hjy/qna")
	public String qnaForm(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum,
			String field, String keyword,UserqnaVo vo,String qcate,Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		if(qcate==null) {
			qcate="all";
		}else {
			model.addAttribute("qcate", qcate);
		}
		map.put("qcate", qcate);
		PageUtil pu = new PageUtil(pageNum, 10, 5, userqnaService.qnacount(map));
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		System.out.println("field"+field);
		System.out.println("keyword"+keyword);
		System.out.println("qcate"+qcate);
		System.out.println("pu"+pu);
		List<UserqnaVo> list = userqnaService.qnalist(map);
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return "user/hjy/qna/qnaMain";
	}
	@GetMapping("hjy/qna/qnaDetail")
	public String qnaForm(int qid,Model model) {
		UserqnaVo vo = userqnaService.qnaDetail(qid);
		model.addAttribute("vo", vo);
		return "user/hjy/qna/qnaDetail";
	}
	
	
}
