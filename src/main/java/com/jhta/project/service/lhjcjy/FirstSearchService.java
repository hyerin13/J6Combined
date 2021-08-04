package com.jhta.project.service.lhjcjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.lhjcjy.AutoCompleteMapper;
import com.jhta.mybatis.mapper.lhjcjy.FirstSearchMapper;
import com.jhta.project.vo.lhjcjy.SearchVo;



@Service
public class FirstSearchService {
@Autowired private FirstSearchMapper mapper;
@Autowired private AutoCompleteMapper mapper1;

	public List<String> findhotel(String aname){
		return mapper1.findhotel(aname);
	}
	
	public List<SearchVo> searchDefault(HashMap<String, Object> map){
		return mapper.searchDefault(map);
	}
	
}
