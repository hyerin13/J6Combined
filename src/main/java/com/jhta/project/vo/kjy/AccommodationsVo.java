package com.jhta.project.vo.kjy;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AccommodationsVo {
	private int AID;
	private String ACATE;
	private String ANAME;
	private String AADDRESS;
	private String APHONE;
	private String AXCOORDI;
	private String AYCOORDI;
	private int ATOTALROOM;
	private String AGRADE;
	private String ADETAIL;
	private String AMAINIMG;
	private Date AREGDATE;
	private String AISDEL;
	
}
