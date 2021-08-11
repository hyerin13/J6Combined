package com.jhta.project.service.hjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.firstsearch.AutoCompleteMapperHjy;
import com.jhta.mybatis.mapper.hjy.firstsearch.FirstSearchMapperHjy;
import com.jhta.mybatis.mapper.lhjcjy.AutoCompleteMapperlhjcjy;
import com.jhta.mybatis.mapper.lhjcjy.FirstSearchMapperlhjcjy;
import com.jhta.project.vo.lhjcjy.SearchVolhjcjy;



@Service
public class FirstSearchServiceHjy {
@Autowired private FirstSearchMapperHjy mapper;
@Autowired private AutoCompleteMapperHjy automapper;

	public List<String> findhotel(String aname){
		return automapper.findhotel(aname);
	}
	
	public List<SearchVolhjcjy> searchDefault(HashMap<String, Object> map){
		return mapper.searchDefault(map);
	}
	
}
