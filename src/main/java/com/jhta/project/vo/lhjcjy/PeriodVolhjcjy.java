package com.jhta.project.vo.lhjcjy;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PeriodVolhjcjy {
	private int PEID;
	private String PESEASON;
	private Date PESTART;
	private Date PEEND;
	private int AID;
}
