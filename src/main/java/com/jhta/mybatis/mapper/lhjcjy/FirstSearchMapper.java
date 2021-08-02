package com.jhta.mybatis.mapper.lhjcjy;

import java.util.List;

import com.jhta.project.vo.lhjcjy.AccommodationsVo;
import com.jhta.project.vo.lhjcjy.Room_InfoVo;

public interface FirstSearchMapper {
	public List<Room_InfoVo> searchNotRev();
	public List<AccommodationsVo> searchInRev(String rcheckout);
}
