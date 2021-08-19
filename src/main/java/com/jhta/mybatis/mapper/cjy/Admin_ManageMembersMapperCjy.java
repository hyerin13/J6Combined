package com.jhta.mybatis.mapper.cjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.cjy.Admin_ManageMemVo;

public interface Admin_ManageMembersMapperCjy {
	public List<Admin_ManageMemVo> selectall();
	public List<Admin_ManageMemVo> select(String mid);
	public int count(HashMap<String, Object> map);
	public List<Admin_ManageMemVo> list(HashMap<String, Object> map);
}
