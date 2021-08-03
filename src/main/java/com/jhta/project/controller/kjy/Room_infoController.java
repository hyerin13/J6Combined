package com.jhta.project.controller.kjy;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.kjy.AccommodationsService;
import com.jhta.project.service.kjy.PeriodService;
import com.jhta.project.service.kjy.Room_infoService;
import com.jhta.project.vo.kjy.AccommodationsVo;
import com.jhta.project.vo.kjy.Room_infoVo;

@Controller
public class Room_infoController {
	@Autowired private Room_infoService service;
	@Autowired private PeriodService peservice;
	@Autowired private AccommodationsService accservice;
	
	@RequestMapping(value="/user/kjy/room_info", method= RequestMethod.GET)
	public ModelAndView Room_infoForm(String AID, String person, String startday, String endday) {
		ModelAndView mv=new ModelAndView("user/kjy/room_info");
		try {
			
			//객실세부정보
			int AID1=Integer.parseInt(AID);
			DateFormat df1=new SimpleDateFormat("yyyyMMdd");
			String STARTDAY1=startday.replace("-", "");
			String ENDDAY1=endday.replace("-", "");
			HashMap<String, Object> hs=new HashMap<String, Object>();
			hs.put("AID", AID1);
			hs.put("PERSON", person);
			hs.put("STARTDAY", STARTDAY1);
			hs.put("ENDDAY", ENDDAY1);
			List<Room_infoVo> alllist=service.list(hs);
			
			//입력한 날짜 중간포함 리스트 얻기
			HashMap<String, Object> hs1=new HashMap<String, Object>();
			hs1.put("STARTDAY", STARTDAY1);
			hs1.put("ENDDAY", ENDDAY1);
			String days=service.daylist(hs1);
			
			//날짜사이 성수기,준성수기,비수기 숫자 구하기
			int OFF=0;//비수기
			int SEMI=0;//준성수기
			int PEAK=0;//성수기
			
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			Date d1=df.parse(startday);//시작날짜
			Date d2=df.parse(endday);//종료날짜
			Calendar c1=Calendar.getInstance();
			Calendar c2=Calendar.getInstance();
			c1.setTime(d1);//calendar 타입으로 변경, add메소드로 1일씩 추가해 주기위해 셋팅
			c2.setTime(d2);
			//시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
			while( c1.compareTo( c2 ) !=1 ){
				//비수기,성수기,준성수기 확인
				Date day=c1.getTime();
				String peseason=peservice.list(day);
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
			int offprice=0;//비수기
			int semiprice=0;//준성수기
			int peakprice=0;//성수기
			String perimg=null;			
			DecimalFormat formatt=new DecimalFormat("###,###,###");//콤마찍기
			for(Room_infoVo vo:alllist) {
				//총금액
				offprice=vo.getRIOFF();
				semiprice=vo.getRISEMIPEAK();
				peakprice=vo.getRIPEAK();
				String offpr=formatt.format(OFF*offprice);
				String semipr=formatt.format(SEMI*semiprice);
				String peakpr=formatt.format(PEAK*peakprice);
				if(OFF>0 && SEMI>0 && PEAK > 0) {
					vo.setPRICE("비수기 "+OFF+"박, 요금: "+offpr+" + 준성수기 "+SEMI+"박, 요금:"+semipr+" + 성수기 "+PEAK+"박, 요금:"+peakpr);
				}else if(OFF>0 && SEMI>0) {
					vo.setPRICE("비수기 "+OFF+"박, 요금: "+offpr+" + 준성수기 "+SEMI+"박, 요금:"+semipr);
				}else if(SEMI>0 && PEAK>0) {
					vo.setPRICE("준성수기 "+SEMI+"박, 요금: "+semipr+" + 성수기 "+PEAK+"박, 요금:"+peakpr);
				}else if(OFF>0 && PEAK>0) {
					vo.setPRICE("비수기 "+OFF+"박, 요금: "+offpr+" + 성수기 "+PEAK+"박, 요금:"+peakpr);
				}else if(OFF>0 && SEMI<1 && PEAK<1) {
					vo.setPRICE("비수기 "+OFF+"박, 요금: "+offpr);
				}else if(OFF<1 && SEMI>0 && PEAK<1) {
					vo.setPRICE("준성수기 "+SEMI+"박, 요금: "+semipr);
				}else if(OFF<1 && SEMI<1 && PEAK>0) {
					vo.setPRICE("성수기 "+PEAK+"박, 요금: "+peakpr);
				}
				
				int sum=(OFF*offprice)+(semiprice*SEMI)+(peakprice*PEAK);
				String finalsum=formatt.format(sum);
				vo.setSUM(finalsum);
				
				//특수문자 치환(,->√ ,♥, ♡)
				String service=vo.getRISERVICE();
				service=service.replace(",", "√ ");
				vo.setRISERVICE(service);
				
				//인원그림(♥, ♡)
				int maxper=vo.getRIMAXPER();
				//최대인원
				if(maxper==1) {
					vo.setPERIMG("resources/images/kjy/room_info/person1.png");
				}else if(maxper==2) {
					vo.setPERIMG("resources/images/kjy/room_info/person2.png");
				}else if(maxper==3) {
					vo.setPERIMG("resources/images/kjy/room_info/person3.png");
				}else if(maxper==4) {
					vo.setPERIMG("resources/images/kjy/room_info/person4.png");
				}else if(maxper==5) {
					vo.setPERIMG("resources/images/kjy/room_info/person5.png");
				}else if(maxper==6) {
					vo.setPERIMG("resources/images/kjy/room_info/person6.png");
				}
				
				//현재인원
				if(person.equals("1")) {
					vo.setMINPERIMG("resources/images/kjy/room_info/minperson1.png");
				}else if(person.equals("2")) {
					vo.setMINPERIMG("resources/images/kjy/room_info/minperson2.png");
				}else if(person.equals("3")) {
					vo.setMINPERIMG("resources/images/kjy/room_info/minperson3.png");
				}else if(person.equals("4")) {
					vo.setMINPERIMG("resources/images/kjy/room_info/minperson4.png");
				}else if(person.equals("5")) {
					vo.setMINPERIMG("resources/images/kjy/room_info/minperson5.png");
				}else if(person.equals("6")) {
					vo.setMINPERIMG("resources/images/kjy/room_info/minperson6.png");
				}
				
				
				//예약이 꽉찼을경우 페이지이동
				if(!days.equals(vo.getREDAY())) {
					ModelAndView mv1=new ModelAndView("user/kjy/result");
					mv1.addObject("code", "입력하신 날짜는 예약이 모두 완료되었습니다.");
					return mv1;
				}
			}
			//숙소정보
			AccommodationsVo accvo=accservice.aidlist(AID1);
			
			mv.addObject("accvo",accvo);
			mv.addObject("person", person);
			mv.addObject("list",alllist);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
