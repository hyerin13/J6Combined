package com.jhta.mybatis.mapper.cjy;

import java.util.List;

import com.jhta.project.vo.cjy.UserqnaVo;

public interface Admin_UserQnaMapperCjy {
	public List<UserqnaVo> list();
	public int insert(UserqnaVo vo);
	public int update(UserqnaVo vo);
	public int delete(int qid);
	public int updatetoy(String qid);
}
