package com.jhta.mybatis.mapper.lhj;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.lhj.AccommodationsVo;
import com.jhta.project.vo.lhj.Room_infoVo;

public interface Admin_AccommodationsMapperlhj {
	public int count(HashMap<String, Object> map);
	public List<AccommodationsVo> accommlist();
	public List<AccommodationsVo> detail(int aid);
	public List<Room_infoVo> roomlist();
	public int accommUpdate(AccommodationsVo vo);
	public int roomUpdate(Room_infoVo vo);
	public int delupdate(AccommodationsVo vo);
}