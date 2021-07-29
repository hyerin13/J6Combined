package com.jhta.project.service.hjy;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.HotelMapper;


@Service
public class HotelManageService {
	@Autowired HotelMapper mapper;
	public int insert() {
		return mapper.insert();
	}
}
