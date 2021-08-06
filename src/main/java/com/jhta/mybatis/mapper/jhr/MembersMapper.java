package com.jhta.mybatis.mapper.jhr;

import java.util.HashMap;

import com.jhta.project.vo.jhr.MembersVo;

public interface MembersMapper {
	int insert(MembersVo vo);
	MembersVo isMember(HashMap<String,String> map);
	MembersVo findId(HashMap<String,String> map);
	MembersVo checkPw(HashMap<String,String> map);
	int resetPw(MembersVo vo);
	MembersVo checkId(String mid);
}
