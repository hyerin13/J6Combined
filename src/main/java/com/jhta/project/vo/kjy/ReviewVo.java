package com.jhta.project.vo.kjy;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewVo {
	private int REID;
	private String RETITLE;
	private String RECONTENT;
	private String REPHOTO;
	private Date RERDATE;
	private int RESTAR;
	private String MID;
	private int RID;
}
