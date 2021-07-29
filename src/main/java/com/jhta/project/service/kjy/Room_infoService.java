package com.jhta.project.service.kjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.kjy.Room_infoMapper;
import com.jhta.project.vo.kjy.Room_infoVo;

@Service
public class Room_infoService {
	@Autowired private Room_infoMapper mapper;
	public List<Room_infoVo> list(int AID){
		return mapper.list(AID);
	}
}
