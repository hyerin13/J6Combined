package com.jhta.project.controller.kjy;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.mybatis.mapper.kjy.ReviewMapperkjy;
import com.jhta.project.util.kjy.PageUtil;
import com.jhta.project.vo.kjy.ReviewVo;

@Controller
public class ReviewController_kjy {
	@Autowired private ReviewMapperkjy service;
	
	@RequestMapping(value="/user/kjy/review1", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> list(@RequestParam(value="pageNum",defaultValue = "1") int pageNum, String AID){
		int AID1=Integer.parseInt(AID);
		int count=service.count(AID1);
		PageUtil pu=new PageUtil(pageNum, 5, 5, count);
		HashMap<String, Object> pmap=new HashMap<String, Object>();
		pmap.put("startRowNum", pu.getStartRow());
		pmap.put("endRowNum", pu.getEndRow());
		pmap.put("AID", AID1);
		List<ReviewVo> list=service.list(pmap);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("result", list);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum());
		map.put("pageCount", pu.getTotalPageCount());
		map.put("pageNum", pageNum);
		return map;
	}
	
	@RequestMapping(value="/user/kjy/review2", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> starsum(String AID){
		int AID1=Integer.parseInt(AID);
		HashMap<String, Object> map=service.sumstar(AID1);
		return map;
	}
}
