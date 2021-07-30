package com.jhta.project.controller.hjy;


import java.util.Date;
import java.util.HashMap;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.project.service.hjy.AccommodationsService_hjy;
import com.jhta.project.service.hjy.Additional_feeService_hjy;
import com.jhta.project.service.hjy.PeriodService_hjy;
import com.jhta.project.service.hjy.Room_infoService_hjy;
import com.jhta.project.vo.hjy.AccommodationsVo;
import com.jhta.project.vo.hjy.Additional_feeVo;
import com.jhta.project.vo.hjy.PeriodVo;
import com.jhta.project.vo.hjy.Room_InfoVo;

@Controller
public class HotelManageController {
	@Autowired AccommodationsService_hjy accommodationsservice;
	@Autowired Room_infoService_hjy roomInfoservice;
	@Autowired PeriodService_hjy periodservice;
	@Autowired Additional_feeService_hjy additional_feeservice;
	@GetMapping("hjy/hotelType")
	public String hotelInsertForm1() {
		return "user/hjy/hotelManage/hotelType";
	}
	@GetMapping("hjy/hotelCategory")
	public String hotelInsertForm2(String type) {
//		return "user/hjy/hotelManage/hotelSignUp";
//		return "user/hjy/hotelManage/hotelCate_"+type;
		return "user/hjy/hotelManage/form";
	}
	@GetMapping("hjy/ok")
	public void hotelInsertForm3(String type) {
//		return "user/hjy/hotelManage/hotelSignUp";
//		return "user/hjy/hotelManage/hotelCate_"+type;
		System.out.println("성공~!~~~");
	}
	@PostMapping("hjy/hotelreq")
	public String hotelRequest(AccommodationsVo accommodationsVo, Additional_feeVo additional_feeVo, 
			PeriodVo periodVo, Room_InfoVo roomInfoVo) {
		sendMail(accommodationsVo, additional_feeVo, 
				periodVo, roomInfoVo);
		return "user/hjy/hotelManage/result";
	}
	public static void sendMail(AccommodationsVo accommodationsVo, Additional_feeVo additional_feeVo, 
			PeriodVo periodVo, Room_InfoVo roomInfoVo) {
	    // 메일 인코딩
	    final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
	    
	    String subject = "[숙소등록]";
	    String fromEmail = "hgyoung06@gmail.com";
	    String fromUsername = "J6 MANAGER";
	    String toEmail = "hgyoung06@gmail.com"; // 콤마(,)로 여러개 나열
	    
	    final String username = "hgyoung06@gmail.com";         
	    final String password = "cyqbwmbqaoqkpjum";
	    
	    // 메일에 출력할 텍스트
	    StringBuffer sb = new StringBuffer();
	    sb.append("<h3>안녕하세요</h3>\n");
	    sb.append("<h4>hello</h4>\n");    
	    sb.append("<h4>hello</h4>\n");    
	    sb.append("<h4>"+accommodationsVo.getAcate()+"</h4>");    
	    sb.append("<a href='http://localhost:8090/project/hjy/ok'>"+"등록"+"</button>");    
	    String html = sb.toString();
	    
	    // 메일 옵션 설정
	    Properties props = new Properties();    
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	 
	    props.put("mail.smtp.quitwait", "false");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.socketFactory.fallback", "false");
	    
	    try {
	      // 메일 서버  인증 계정 설정
	      Authenticator auth = new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	          return new PasswordAuthentication(username, password);
	        }
	      };
	      
	      // 메일 세션 생성
	      Session session = Session.getInstance(props, auth);
	      
	      // 메일 송/수신 옵션 설정
	      Message message = new MimeMessage(session);
	      message.setFrom(new InternetAddress(fromEmail, fromUsername));
	      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
	      message.setSubject(subject);
	      message.setSentDate(new Date());
	      
	      // 메일 콘텐츠 설정
	      Multipart mParts = new MimeMultipart();
	      MimeBodyPart mTextPart = new MimeBodyPart();
	      MimeBodyPart mFilePart = null;
	 
	      // 메일 콘텐츠 - 내용
	      mTextPart.setText(html, bodyEncoding, "html");
	      mParts.addBodyPart(mTextPart);
	            
	      // 메일 콘텐츠 설정
	      message.setContent(mParts);
	      
	      // MIME 타입 설정
	      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	      CommandMap.setDefaultCommandMap(MailcapCmdMap);
	 
	      // 메일 발송
	      Transport.send( message );
	      
	    } catch ( Exception e ) {
	      e.printStackTrace();
	    }
	  }
	
//	AccommodationsVo accommodationsVo, Additional_feeVo additional_feeVo, PeriodVo periodVo, Room_InfoVo roomInfoVo
//	public String hotelRequest() {
//		
//		final String user = "hgyoung06@gmail.com"; //발신자의 이메일 아이디를 입력 
//		final String password = "ab3829756!"; //발신자 이메일의 패스워드를 입력
//		Properties prop = new Properties(); 
//		prop.put("mail.smtp.host", "smtp.gmail.com"); 
//		prop.put("mail.smtp.port", 465); 
//		prop.put("mail.smtp.auth", "true"); 
//		prop.put("mail.smtp.ssl.enable", "true"); 
//		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(user, password);
//            }
//        });
//		try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(user));
//
//            //수신자메일주소
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress("hgyoung06@gmail.com")); 
//
//            // Subject
//            message.setSubject("[J6] 숙소 등록 요청"); //메일 제목을 입력
//
//            // Text
//            message.setText("메일 내용을 입력");    //메일 내용을 입력
//
//            // send the message
//            Transport.send(message); ////전송
//            System.out.println("message sent successfully...");
//        } catch (AddressException e) {
//            e.printStackTrace();
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//

//		//숙소테이블
//		int n = accommodationsservice.insert(accommodationsVo);
//		int aidseq = accommodationsservice.seq();
//		
//		//객실세부정보
//		roomInfoVo.setAid(aidseq);
//		int n1= roomInfoservice.insert(roomInfoVo);
//		int riidseq = roomInfoservice.seq();
//		
//		//기간정보
//		periodVo.setAid(aidseq);
//		int n2= periodservice.insert(periodVo);
//				
//		//추가요금정보
//		additional_feeVo.setRiid(riidseq);
//		int n3 = additional_feeservice.insert(additional_feeVo);
//		
//		System.out.println(n+"개 추가");
//		System.out.println(n1+"개 추가");
//		System.out.println(n2+"개 추가");
//		System.out.println(n3+"개 추가");
//		return "user/hjy/hotelManage/result";
//	}
}
