package com.jhta.project.service.hjy;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.AccommodationsMapper_hjy;
import com.jhta.mybatis.mapper.hjy.Accommodations_tempMapper_hjy;
import com.jhta.project.vo.hjy.AccommodationsVo;


@Service
public class AccommodationsTempServiceHjy {
	@Autowired Accommodations_tempMapper_hjy mapper;
	public int seq() {
		return mapper.seq();
	}
	public AccommodationsVo find(int aid) {
		return mapper.find(aid);
	};
	public int insert(AccommodationsVo vo) {
		return mapper.insert(vo);
	}
	public int delete(int aid) {
		return mapper.delete(aid);
	};
}
