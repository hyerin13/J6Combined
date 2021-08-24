package com.jhta.project.controller.cjy;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.cjy.Admin_UserQnaServiceCjy;
import com.jhta.project.vo.cjy.ReservationVo;
import com.jhta.project.vo.cjy.UserqnaVo;

@RestController
public class Admin_UserQnaControllerCjy {
	@Autowired Admin_UserQnaServiceCjy service;
	
	//userqna 리스트
	@RequestMapping(value="admin/cjy/userqnalist", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> userqnalist(){
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			List<UserqnaVo> list=service.list();	
			map.put("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="admin/cjy/userqnareply", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> userqnareply(String qid,String qcate ,String qpw,String qtitle,String qcontent, String qfile,String qrdate,String qlev,String qref,String qstep,String mid   ){
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			DateFormat dateFormat = new SimpleDateFormat ("yyyyMMdd");
			Date qrdate1 = dateFormat.parse(qrdate);
			int qref1=Integer.parseInt(qref);
			int qstep1=Integer.parseInt(qstep);
			UserqnaVo vo= new UserqnaVo(qid,qcate,qpw,qtitle,qcontent,qfile,qrdate1,qlev,qref1,qstep1,mid);
			int insert=service.insert(vo);
			map.put("code", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}
	@RequestMapping(value="admin/cjy/userqnaupdate", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> userqnaupdate(UserqnaVo vo){
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			int update=service.update(vo);
			map.put("code", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}
}
