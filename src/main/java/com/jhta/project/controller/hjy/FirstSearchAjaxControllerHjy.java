package com.jhta.project.controller.hjy;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.hjy.FirstSearchServiceHjy;
import com.jhta.project.service.hjy.GetPriceServiceHjy;
import com.jhta.project.service.hjy.PeriodServicefirstSearchHjy;
import com.jhta.project.vo.lhjcjy.AccommodationsVolhjcjy;

@RestController
public class FirstSearchAjaxControllerHjy {
	@Autowired private FirstSearchServiceHjy service;
	@Autowired private PeriodServicefirstSearchHjy peservice;
	@Autowired private GetPriceServiceHjy gpservice;

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
	
	@RequestMapping(value = "hjy/firstsearchajax", method = RequestMethod.POST)
	public HashMap<String, Object> search(String searchHotel, String checkin, String checkout, String countPeople, String countRoom,
			@RequestParam(value="facilities", required = false) String[] facilities) {
		logger.debug(searchHotel);
		logger.debug(checkin);
		logger.debug(checkout);
		logger.debug(countPeople);
		logger.debug(countRoom);
		if(facilities !=null) {
			for (int i = 0; i < facilities.length; i++) {
				logger.debug(facilities[i]);
			}
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, Object> hs = new HashMap<String, Object>();
		try {
			DateFormat df1=new SimpleDateFormat("yyyyMMdd");
			String checkin1=checkin.replace("-", "");
			String checkout1=checkout.replace("-", "");
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
			String days=gpservice.daylist(hs1);

			//날짜사이 성수기,준성수기,비수기 숫자 구하기
			int OFF=0;//비수기
			int SEMI=0;//준성수기
			int PEAK=0;//성수기

			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			Date d1=df.parse(checkin);//시작날짜
			Date d2=df.parse(checkout);//종료날짜
			Calendar c1=Calendar.getInstance();
			Calendar c2=Calendar.getInstance();
			c1.setTime(d1);//calendar 타입으로 변경, add메소드로 1일씩 추가해 주기위해 셋팅
			c2.setTime(d2);
			
			HashMap<String, Object> hs2=new HashMap<String, Object>();
			DecimalFormat formatt=new DecimalFormat("###,###,###");//콤마찍기
			for(AccommodationsVolhjcjy vo:list) {
				//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
				while( c1.compareTo( c2 ) !=1 ){
					//비수기,성수기,준성수기 확인
					Date day=c1.getTime();
					hs2.put("day", day);
					hs2.put("aid", vo.getAid());
					String peseason=peservice.list(hs2);
					if(peseason.equals("비수기")) {
						OFF++;//분류별 카운터
					}else if(peseason.equals("준성수기")) {
						SEMI++;
					}else {
						PEAK++;
					}
					//시작날짜 + 1일(시작~끝)
					c1.add(Calendar.DATE, 1);
				}
				
				int offprice=vo.getRIOFF();
				int semiprice=vo.getRISEMIPEAK();
				int peakprice=vo.getRIPEAK();
				int offpr=OFF*offprice;
				int semipr=SEMI*semiprice;
				int peakpr=PEAK*peakprice;

				int sum=(OFF*offprice)+(semiprice*SEMI)+(peakprice*PEAK);
				String finalsum=formatt.format(sum);
				vo.setSUM(finalsum); //가격
			}
			result.put("list", list);
			result.put("code", "success");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("code", "fail");
		}
		return result;
	}
	
}
