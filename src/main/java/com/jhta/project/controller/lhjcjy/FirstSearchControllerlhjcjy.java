package com.jhta.project.controller.lhjcjy;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.lhjcjy.FirstSearchServicelhjcjy;
import com.jhta.project.service.lhjcjy.GetPriceServicelhjcjy;
import com.jhta.project.service.lhjcjy.PeriodServicelhjcjy;
import com.jhta.project.vo.lhjcjy.AccommodationsVolhjcjy;
import com.jhta.project.vo.lhjcjy.SearchVolhjcjy;



@Controller
public class FirstSearchControllerlhjcjy {
	@Autowired private FirstSearchServicelhjcjy service;
	@Autowired private PeriodServicelhjcjy peservice;
	@Autowired private GetPriceServicelhjcjy gpservice;
	
	@GetMapping("lhjcjy/firstsearch") //
	public String searchForm() {
		return "user/lhjcjy/firstsearch";
	}

	@RequestMapping(value = "lhjcjy/firstsearch", method = RequestMethod.POST)
	public ModelAndView search(String searchHotel, String checkin, String checkout, String countPeople, String countRoom) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		ModelAndView mv = new ModelAndView();
		try {
			DateFormat df1=new SimpleDateFormat("yyyyMMdd");
			String checkin1=checkin.replace("-", "");
			String checkout1=checkout.replace("-", "");
			hs.put("aaddress", searchHotel);
			hs.put("aname", searchHotel);
			hs.put("rcheckin", checkin1);
			hs.put("rcheckout", checkout1);
			hs.put("rimaxper", countPeople);
			hs.put("countRoom", countRoom);
			
			mv.addObject("aaddress", searchHotel);
			mv.addObject("rcheckin", checkin);
			mv.addObject("rcheckout", checkout);
			mv.addObject("rimaxper", countPeople);
			mv.addObject("countRoom", countRoom);
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
			mv.addObject("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("user/lhjcjy/firstsearch2");
		return mv;
	}
}
