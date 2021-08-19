package com.jhta.project.controller.cjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.cjy.Admin_CancelRefundServiceCjy;
import com.jhta.project.vo.cjy.Admin_ManageMemVo;
import com.jhta.project.vo.cjy.ReservationVo;
import com.jhta.util.PageUtil;

@RestController
public class Admin_CancelRefundControllerCjy {
	//@Autowired Admin_CancelRefundServiceCjy crservice;
	/*
	//취소환불관리
	@GetMapping("admin/cjy/mngcancel")
		public HashMap<String, Object> loadmanagerefund() {
			HashMap<String, Object> map = new HashMap<String,Object>();
			List<ReservationVo> list=crservice.list(map);
			map.put("list", list);
			return map;
	}
	
	@RequestMapping(value="admin/cjy/", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> cancelrefundlist(@RequestParam(value="pageNum", defaultValue="1")int pageNum, String field, String keyword){
		HashMap<String, Object> map = new HashMap<String,Object>();
		HashMap<String, Object> map1 = new HashMap<String,Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int totalRowCount=crservice.count(map);
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		System.out.println(pu);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow", startRow); //boardmapper에서 sql문에 필
		try {
			List<ReservationVo> list=crservice.list(map);
			map1.put("list", list);
			map1.put("pu", pu);
			map1.put("field", field);
			map1.put("keyword", keyword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
		*/
	/*
	@RequestMapping(value="admin/cjy/searchmem", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> cancelrefundlist(@RequestParam(value="pageNum", defaultValue="1")int pageNum, String field, String keyword){
		HashMap<String, Object> map = new HashMap<String,Object>();
		HashMap<String, Object> map1 = new HashMap<String,Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int totalRowCount=crservice.count(map);
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		System.out.println(pu);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow", startRow); //boardmapper에서 sql문에 필
		try {
			List<ReservationVo> list=crservice.list(map);
			map1.put("list", list);
			map1.put("pu", pu);
			map1.put("field", field);
			map1.put("keyword", keyword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	*/
	/*
	@RequestMapping(value="admin/cjy/", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> update(int rid, String rcancel ){
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			int update=crservice.update(map);
			map.put("update", update);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
*/
}
