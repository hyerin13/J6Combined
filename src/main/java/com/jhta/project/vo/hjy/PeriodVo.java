package com.jhta.project.vo.hjy;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PeriodVo {
	private int peid;
	private String peseason;
	private Date pestart;
	private Date peend;
	private int aid;
}
