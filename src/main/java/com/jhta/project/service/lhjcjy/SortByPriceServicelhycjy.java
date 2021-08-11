package com.jhta.project.service.lhjcjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.lhjcjy.SortByPriceMapperlhjcjy;
import com.jhta.project.vo.lhjcjy.AccommodationsVo2lhjcjy;



@Service
public class SortByPriceServicelhycjy {
	@Autowired private SortByPriceMapperlhjcjy mapper;
	
	public List<AccommodationsVo2lhjcjy> sortPrice(HashMap<String, Object> map){
		return mapper.sortPrice(map);
	}
	public List<AccommodationsVo2lhjcjy> rangeSlider_price(HashMap<String, Object> map) {
		return mapper.rangeSlider_price(map);
	}

}
 