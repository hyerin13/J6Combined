package com.jhta.mybatis.mapper.hjy;

import com.jhta.project.vo.hjy.Room_InfoVo;

public interface Room_info_tempMapper_hjy {
	public int seq();
	public Room_InfoVo find(int aid);
	public int insert(Room_InfoVo vo);
	public int delete(int aid);
}
