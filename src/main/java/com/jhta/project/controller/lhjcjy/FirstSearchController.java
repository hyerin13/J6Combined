package com.jhta.project.controller.lhjcjy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FirstSearchController {
	@GetMapping("lhjcjy/firstsearch")
	public String searchForm() {
		return "user/lhjcjy/firstsearch";
	}

	@PostMapping("lhjcjy/firstsearch")
	public String search() {
		
		return "user/lhjcjy/firstsearch";
	}
}
