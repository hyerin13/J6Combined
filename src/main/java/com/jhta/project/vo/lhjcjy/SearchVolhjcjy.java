package com.jhta.project.vo.lhjcjy;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SearchVolhjcjy {
	private int aid;
	private String aname;
	private String aaddress;
	private int atotalroom;
	private String amainimg;
	private int riid;
	private int riminper;
	private int rimaxper;
	private int rireak;
	private int risemipeak;
	private int rioff;
	private String rimainimg;
	private String riextraimg1;
	private String riextraimg2;
	private int rid;
	private Date rcheckin;
	private Date rcheckout;
	private int rexperson;
	private int afid;
	private int afpersonnel;
}
