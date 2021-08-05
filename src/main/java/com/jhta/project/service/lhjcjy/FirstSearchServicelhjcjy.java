package com.jhta.project.service.lhjcjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.lhjcjy.AutoCompleteMapperlhjcjy;
import com.jhta.mybatis.mapper.lhjcjy.FirstSearchMapperlhjcjy;
import com.jhta.project.vo.lhjcjy.SearchVolhjcjy;



@Service
public class FirstSearchServicelhjcjy {
@Autowired private FirstSearchMapperlhjcjy mapper;
@Autowired private AutoCompleteMapperlhjcjy mapper1;

	public List<String> findhotel(String aname){
		return mapper1.findhotel(aname);
	}
	
	public List<SearchVolhjcjy> searchDefault(HashMap<String, Object> map){
		return mapper.searchDefault(map);
	}
	
}
