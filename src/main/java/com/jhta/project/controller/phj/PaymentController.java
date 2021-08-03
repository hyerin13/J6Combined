package com.jhta.project.controller.phj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	@GetMapping("/pay")
	public String reservationForm() {
		return "user/phj/pay";
	}
}
