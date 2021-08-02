package com.jhta.mybatis.mapper.lhjcjy;

import java.util.List;

import com.jhta.project.vo.lhjcjy.AccommodationsVo;

public interface AutoCompleteMapper {
	public List<String> findhotel(String aname);
}
