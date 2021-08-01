package com.jhta.project.service.hjy;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.Room_infoMapper_hjy;
import com.jhta.mybatis.mapper.hjy.Room_info_tempMapper_hjy;
import com.jhta.project.vo.hjy.AccommodationsVo;
import com.jhta.project.vo.hjy.Room_InfoVo;


@Service
public class Room_info_tempService_hjy {
	@Autowired Room_info_tempMapper_hjy mapper;
	public int seq() {
		return mapper.seq();
	}
	public Room_InfoVo find(int aid) {
		return mapper.find(aid);
	};
	public int insert(Room_InfoVo vo) {
		return mapper.insert(vo);
	};
	public int delete(int aid) {
		return mapper.delete(aid);
	};
}
