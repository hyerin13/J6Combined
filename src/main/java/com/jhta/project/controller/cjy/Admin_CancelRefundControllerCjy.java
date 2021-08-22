package com.jhta.project.controller.cjy;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.cjy.Admin_CancelRefundServiceCjy;
import com.jhta.project.vo.cjy.Admin_ManageMemVo;
import com.jhta.project.vo.cjy.ReservationVo;
import com.jhta.util.PageUtil;

import lombok.Data;


@RestController

public class Admin_CancelRefundControllerCjy {
	@Autowired Admin_CancelRefundServiceCjy crservice;

	//취소환불 리스트
	@RequestMapping(value="admin/cjy/rvcancel", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> cancelrefunddata(){
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			//rcheckin, rcheckout이 yy/mm/dd형태로 들어가 있기 때문에 회원목록과 통일성을 주기 위해 보여지는 형식 변경
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date tempDate1=null;
			java.util.Date tempDate2=null;
			List<ReservationVo> data=crservice.list();
			map.put("data", data);
			System.out.println(data);
			try {
				tempDate1=beforeFormat.parse(data.get(0).getRcheckin());
				tempDate2=beforeFormat.parse(data.get(0).getRcheckout());
			}catch(ParseException p) {
				p.printStackTrace();
			}
			
			String rcheckin=afterFormat.format(tempDate1);
			String rcheckout=afterFormat.format(tempDate2);
			
			System.out.println("rcheckin:"+rcheckin);
			System.out.println("rcheckout:"+rcheckout);
			for(int i=0; i<data.size() ;i++) {
				data.get(i).setRcheckin(rcheckin);
				data.get(i).setRcheckout(rcheckout);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	

	//취소승인
	@RequestMapping(value="admin/cjy/rvcancelapproval", produces = {MediaType.APPLICATION_JSON_VALUE})
	public  HashMap<String, Object> cancelapproval(String rid){
		HashMap<String, Object> map = new HashMap<String,Object>();
		HashMap<String, Object> map1 = new HashMap<String,Object>();
		map.put("rid", rid);
		try {
			int data=crservice.update(map);
			map1.put("data", data);
			map1.put("msg", "취소승인 되었습니다");
		}catch(Exception e) {
			e.printStackTrace();
			map1.put("msg", "취소승인이 실패되었습니다");
		}
		return map1;
	}
	
	//취소승인후 리스트 제외
	@RequestMapping(value="admin/cjy/rvcancelaftapporoval", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> rvcancelaftapporoval(){
		HashMap<String, Object> map = new HashMap<String,Object>();
		try {
			//rcheckin, rcheckout이 yy/mm/dd형태로 들어가 있기 때문에 회원목록과 통일성을 주기 위해 보여지는 형식 변경
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date tempDate1=null;
			java.util.Date tempDate2=null;
			List<ReservationVo> data=crservice.afterapprovallist();
			map.put("data", data);
			System.out.println(data);
			try {
				tempDate1=beforeFormat.parse(data.get(0).getRcheckin());
				tempDate2=beforeFormat.parse(data.get(0).getRcheckout());
			}catch(ParseException p) {
				p.printStackTrace();
			}
			
			String rcheckin=afterFormat.format(tempDate1);
			String rcheckout=afterFormat.format(tempDate2);
			
			System.out.println("rcheckin:"+rcheckin);
			System.out.println("rcheckout:"+rcheckout);
			for(int i=0; i<data.size() ;i++) {
				data.get(i).setRcheckin(rcheckin);
				data.get(i).setRcheckout(rcheckout);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
}
