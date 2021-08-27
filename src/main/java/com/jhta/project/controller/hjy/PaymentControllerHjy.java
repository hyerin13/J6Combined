package com.jhta.project.controller.hjy;

import java.util.HashMap;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class PaymentControllerHjy {
	@GetMapping(value="hjy/payment/refund")
	public HashMap<String, Object> login(String token,String mid) {
		PayAjax pay = new PayAjax();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = pay.cancelPayment(token, mid);
		if(result>0) {
			map.put("result", "success");	
		}else {
			map.put("result", "fail");	
		}
		return map;
	}
}
