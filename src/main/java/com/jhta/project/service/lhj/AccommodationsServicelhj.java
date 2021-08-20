package com.jhta.project.service.lhj;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.lhj.Admin_AccommodationsMapperlhj;
import com.jhta.mybatis.mapper.lhjcjy.GetPriceMapperlhjcjy;
import com.jhta.project.vo.lhjcjy.AccommodationsVolhjcjy;


@Service
public class AccommodationsServicelhj {
	@Autowired private Admin_AccommodationsMapperlhj mapper;
	
	public List<AccommodationsVolhjcjy> accommList(){
		return mapper.accoomList();
	}
}
