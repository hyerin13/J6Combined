package com.jhta.project.service.kjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.kjy.AccommodationsMapper;
import com.jhta.project.vo.kjy.AccommodationsVo;

@Service
public class AccommodationsService {
	@Autowired private AccommodationsMapper mapper;
	public List<AccommodationsVo> list(){
		return mapper.list();
	}
}
