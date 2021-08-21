package com.jhta.project.controller.lhj;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.lhj.PaymentServicelhj;
import com.jhta.project.vo.lhj.PaymentVo;

@RestController
public class PaymentControllerlhj {
	@Autowired private PaymentServicelhj pmservice;
	
	@RequestMapping(value = "admin/lhj/paymentlist", produces = {MediaType.APPLICATION_JSON_VALUE}) //숙소 목록 불러오기
	public HashMap<String, Object> paymentlist() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<PaymentVo> list = pmservice.paymentlist();
		map.put("list", list);
		//System.out.println("컨트롤러: " + list);
		return map;
	}
}
