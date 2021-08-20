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
//@Data
public class Admin_CancelRefundControllerCjy {
	/*
	private int rid;
	private int rordernum;
	private int ramount;
	private String rcheckin;
	private String rcheckout;
	private String rresname;
	private String rresphone;
	private String rresemail;
	private int rexbreaknum;
	private int rexbed;
	private int rexperson;
	private String rcancel;
	private String mid;
	private int riid;
	
	private List map;
	public List getData() {
		 if(CollectionUtils.isEmpty(map)){
	            map = new ArrayList();
	        }
	        return map;
	}
	
}
*/
	@Autowired Admin_CancelRefundServiceCjy crservice;
	//취소환불 리스트

	@RequestMapping(value="admin/cjy/rvcancel", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> cancelrefunddata(@RequestParam(value="pageNum", defaultValue="1")int pageNum, String field, String keyword){
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
		map.put("endRow", endRow);
		try {

			//rcheckin, rcheckout이 yy/mm/dd형태로 들어가 있기 때문에 회원목록과 통일성을 주기 위해 보여지는 형식 변경
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yy/MM/dd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date tempDate1=null;
			java.util.Date tempDate2=null;
			List<ReservationVo> data=crservice.list(map);
			map1.put("data", data);
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
			data.get(0).setRcheckin(rcheckin);
			data.get(0).setRcheckout(rcheckout);
			map1.put("pu", pu);
			map1.put("field", field);
			map1.put("keyword", keyword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map1;
	}
	
	
	
}
