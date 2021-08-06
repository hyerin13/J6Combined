package com.jhta.project.vo.kjy;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PeriodVo_kjy {
	private int PEID;
	private String PESEASON;
	private Date PESTART;
	private Date PEEND;
	private int AID;
}
