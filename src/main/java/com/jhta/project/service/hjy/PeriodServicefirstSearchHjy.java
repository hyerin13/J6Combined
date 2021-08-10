package com.jhta.project.service.hjy;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.lhjcjy.PeriodMapperlhjcjy;


@Service
public class PeriodServicefirstSearchHjy {
	@Autowired private PeriodMapperlhjcjy mapper;
	public String list(HashMap<String, Object> map) {
		return mapper.list(map);
	}
}
