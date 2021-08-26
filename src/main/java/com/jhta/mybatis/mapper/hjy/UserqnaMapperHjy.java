package com.jhta.mybatis.mapper.hjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.hjy.UserqnaVo;

public interface UserqnaMapperHjy {
	public List<UserqnaVo> qnalist(HashMap<String, Object> map);
	public int qnacount(HashMap<String, Object> map);
	public UserqnaVo qnaDetail(int qid);
}
