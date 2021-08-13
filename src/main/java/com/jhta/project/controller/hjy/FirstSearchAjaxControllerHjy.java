package com.jhta.project.controller.hjy;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ctc.wstx.shaded.msv_core.driver.textui.Debug;
import com.jhta.project.service.hjy.FavoriteServiceHjy;
import com.jhta.project.service.hjy.FirstSearchServiceHjy;
import com.jhta.project.service.hjy.GetPriceServiceHjy;
import com.jhta.project.service.hjy.PeriodServicefirstSearchHjy;
import com.jhta.project.vo.lhjcjy.AccommodationsVolhjcjy;

@RestController
public class FirstSearchAjaxControllerHjy {
	@Autowired private FirstSearchServiceHjy service;
	@Autowired private PeriodServicefirstSearchHjy peservice;
	@Autowired private GetPriceServiceHjy gpservice;
	@Autowired private FavoriteServiceHjy favoriteService;

	Logger logger = LoggerFactory.getLogger(FirstSearchAjaxControllerHjy.class);
	
	@RequestMapping(value="/hjy/ajax/auto", produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> autolist(String aname,HttpServletRequest request,
            HttpServletResponse response) {
		
		HashMap<String, Object> map =new HashMap<String, Object>();
		List<String> list= service.findhotel(aname);
		logger.debug(list.toString());
		map.put("list", list);
		return map;
	}
	@RequestMapping(value="/hjy/facilities", produces= {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> facilities(String id) {
		logger.debug(id);
		HashMap<String, Object> map =new HashMap<String, Object>();
		return map;
	}
	
	@RequestMapping(value = "hjy/firstsearchajax", method = RequestMethod.GET)
	public HashMap<String, Object> searchGet(String searchHotel, String checkin, String checkout, String countPeople, String countRoom,
			 String fac, HttpSession session) {
		String [] facilities = fac.split(",");
		return execute(searchHotel, checkin, checkout, countPeople, countRoom,facilities,session);
	}
	
	@RequestMapping(value = "hjy/firstsearchajax", method = RequestMethod.POST)
	public HashMap<String, Object> searchPOST(String searchHotel, String checkin, String checkout, String countPeople, String countRoom,
			@RequestParam(value="facilities", required = false)  String[] facilities, HttpSession session) {
		return execute(searchHotel, checkin, checkout, countPeople, countRoom,facilities,session);

	}
	private HashMap<String, Object> execute(String searchHotel, String checkin, String checkout, String countPeople, String countRoom,
			String[] facilities, HttpSession session){
		logger.debug(searchHotel);
		logger.debug(checkin);
		logger.debug(checkout);
		logger.debug(countPeople);
		logger.debug(countRoom);
		String bookmark = "";
		if(facilities!=null) {
			for (int i = 0; i < facilities.length; i++) {
				logger.debug(facilities[i]);
				if(facilities[i].equals("즐겨찾기")) {
					bookmark=facilities[i];
				};
				
			}
			
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, Object> hs = new HashMap<String, Object>();
		try {
			DateFormat df1=new SimpleDateFormat("yyyyMMdd");
			String checkin1=checkin.replace("-", "");
			String checkout1=checkout.replace("-", "");
			if(bookmark.equals("")==false) {
				//db에서 즐겨찾는호텔 가져오기
				String hotelname = favoriteService.find((String)session.getAttribute("id"));
				hs.put("bookmark", hotelname);
			}
			hs.put("facilities", facilities);
			hs.put("aaddress", searchHotel);
			hs.put("aname", searchHotel);
			hs.put("rcheckin", checkin1);
			hs.put("rcheckout", checkout1);
			hs.put("rimaxper", countPeople);
			hs.put("countRoom", countRoom);
			
			result.put("aaddress", searchHotel);
			result.put("rcheckin", checkin);
			result.put("rcheckout", checkout);
			result.put("rimaxper", countPeople);
			result.put("countRoom", countRoom);
			List<AccommodationsVolhjcjy> list = gpservice.getprice(hs);
			
			//입력한 날짜 중간포함 리스트 얻기
			HashMap<String, Object> hs1=new HashMap<String, Object>();
			String STARTDAY1=checkin.replace("-", "");
			String ENDDAY1=checkout.replace("-", "");
			hs1.put("STARTDAY", STARTDAY1);
			hs1.put("ENDDAY", ENDDAY1);
			result.put("list", list);
			result.put("checkin", checkin1);
			result.put("checkout", checkout1);
			result.put("code", "success");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("code", "fail");
		}
		return result;
	}
	
}
