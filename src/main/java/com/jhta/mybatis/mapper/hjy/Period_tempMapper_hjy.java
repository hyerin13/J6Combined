package com.jhta.mybatis.mapper.hjy;

import com.jhta.project.vo.hjy.PeriodVo;

public interface Period_tempMapper_hjy {
	public int seq();
	public PeriodVo find(int aid);
	public int insert(PeriodVo vo);
	public int delete(int aid);
}
