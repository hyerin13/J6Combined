package com.jhta.mybatis.mapper.kjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.kjy.Room_infoVo;

public interface Room_infoMapperkjy {
	List<Room_infoVo> list(HashMap<String, Object> map);
	String daylist(HashMap<String, Object> map);
}
