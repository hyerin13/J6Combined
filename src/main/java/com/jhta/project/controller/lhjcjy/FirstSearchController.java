package com.jhta.project.controller.lhjcjy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.lhjcjy.FirstSearchService;

@Controller
public class FirstSearchController {
	@Autowired private FirstSearchService service;
	
	@GetMapping("lhjcjy/firstsearch") //
	public String searchForm() {
		return "user/lhjcjy/firstsearch";
	}

	@PostMapping("lhjcjy/firstsearch")
	public String search(String rcheckin, String rcheckout) {
		//service.searchInRev()
		return "user/lhjcjy/firstsearch";
	}
}
