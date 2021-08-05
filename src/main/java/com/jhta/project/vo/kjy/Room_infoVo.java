package com.jhta.project.vo.kjy;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Room_infoVo {
	private int RIID;
	private int RORDERNUM;
	private String RIROOMTYPE;
	private int RIROOM;
	private String RISERVICE;
	private String RISIZE;
	private int RIMINPER;
	private int RIMAXPER;
	private int RIPEAK;
	private int RISEMIPEAK;
	private int RIOFF;
	private String RIMAINIMG;
	private String RIEXTRAIMG1;
	private String RIEXTRAIMG2;
	private int AID;
	
	//추가
	private String SUM; //전체금액
	private String PRICE; //숙박금액
	private String PERIMG; //최대인원이미지
	private String MINPERIMG; //현재인원이미지
	private String REDAY; //예약가능날짜
}
