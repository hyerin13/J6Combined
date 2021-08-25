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
			for(int i=0; i<list.size() ;i++) {
				if(list.get(i).getQcate().equals("1")) {
					list.get(i).setQcate("자유");
				}else if(list.get(i).getQcate().equals("2")) {
					list.get(i).setQcate("공유");
				}else {
					list.get(i).setQcate("매칭");	
				}
			}
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
			//DateFormat dateFormat = new SimpleDateFormat ("yyyyMMdd");
			//Date qrdate1 = dateFormat.parse(qrdate);
			//답변글 qid는 문의글qid+1로 처리해주기
			//int qid1=Integer.parseInt(qid)+1;
			//String qid2=String.valueOf(qid1);
			System.out.println(qref);
			qlev="Y";
			int qref1=Integer.parseInt(qref);
			int qstep1=Integer.parseInt(qstep)+1;
			String qtitle1="re "+qtitle;
			mid="관리자";
			UserqnaVo vo= new UserqnaVo("0",qcate,qpw,qtitle1,qcontent,qfile,null,qlev,qref1,qstep1,mid);
			int insert=service.insert(vo);
			int n=service.updatetoy(qid);
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
	@RequestMapping(value="admin/cjy/userqnadelete", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> userqnadelete(String qid){
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			int qid1=Integer.parseInt(qid);
			int delete=service.delete(qid1);
			map.put("code", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}
}
