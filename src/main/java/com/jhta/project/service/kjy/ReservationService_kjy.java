package com.jhta.project.service.kjy;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.kjy.ReservationMapperkjy;

@Service
public class ReservationService_kjy {
	@Autowired private ReservationMapperkjy mapper;
	public HashMap<String, Object> datelist(Date day){
		return mapper.datelist(day);
	}
}
