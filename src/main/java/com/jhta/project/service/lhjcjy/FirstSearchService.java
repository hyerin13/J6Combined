package com.jhta.project.service.lhjcjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.lhjcjy.FirstSearchMapper;
import com.jhta.project.vo.lhjcjy.AccommodationsVo;
import com.jhta.project.vo.lhjcjy.Room_InfoVo;

@Service
public class FirstSearchService {
	@Autowired private FirstSearchMapper mapper;
	
	public List<Room_InfoVo> searchNotRev(){
		return mapper.searchNotRev();
	}
	
	public List<AccommodationsVo> searchInRev(){
		return mapper.searchInRev();
	}
}
