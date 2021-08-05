package com.jhta.project.controller.lhjcjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.lhjcjy.FirstSearchService;
import com.jhta.project.vo.lhjcjy.SearchVo;

@Controller
public class FirstSearchControllerlhjcjy {
	@Autowired private FirstSearchService service;
	
	@GetMapping("lhjcjy/firstsearch") //
	public String searchForm() {
		return "user/lhjcjy/firstsearch";
	}

	@RequestMapping(value = "lhjcjy/firstsearch", method = RequestMethod.POST)
	public ModelAndView search(HashMap<String, Object> map, String searchHotel, String checkin, String checkout, int countPeople) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		ModelAndView mv = new ModelAndView("search");
		hs.put("aaddress", searchHotel);
		hs.put("aname", searchHotel);
		hs.put("rcheckin", checkin);
		hs.put("rcheckout", checkout);
		hs.put("rimaxper", countPeople);
		hs.put("riminper", countPeople);
		
		List<SearchVo> list = service.searchDefault(hs);
		mv.addObject("list", list);
		mv.setViewName("user/lhjcjy/firstsearch");
		return mv;
	}
}
