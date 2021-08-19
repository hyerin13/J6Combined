package com.jhta.project.service.cjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.cjy.Admin_CancelRefundMapperCjy;
import com.jhta.project.vo.cjy.ReservationVo;

@Service
public class Admin_CancelRefundServiceCjy {
	@Autowired Admin_CancelRefundMapperCjy mapper;
	public List<ReservationVo> list(HashMap<String, Object> map){
		return mapper.list(map);
	}
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	public int update(HashMap<String, Object> map) {
		return mapper.update(map);
	}
	public ReservationVo select(int rid) {
		return mapper.select(rid);
	}
}
