package com.jhta.mybatis.mapper.kjy;

import java.util.List;

import com.jhta.project.vo.kjy.Room_infoVo;

public interface Room_infoMapper {
	List<Room_infoVo> list(int AID);
}
