package com.jhta.project.service.hjy;

import java.com.jhta.mybatis.mapper.hjy.HotelMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class HotelManageService {
	@Autowired HotelMapper mapper;
	public int insert() {
		return mapper.insert();
	}
}
