package com.jhta.mybatis.mapper.lhjcjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.lhjcjy.SearchVo;


public interface FirstSearchMapper {
	public List<SearchVo> searchDefault(HashMap<String, Object> map);
}
