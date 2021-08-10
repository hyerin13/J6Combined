package com.jhta.mybatis.mapper.hjy.firstsearch;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.lhjcjy.SearchVolhjcjy;


public interface FirstSearchMapperHjy {
	public List<SearchVolhjcjy> searchDefault(HashMap<String, Object> map);
}
