package com.jhta.mybatis.mapper.kjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.kjy.ReviewVo;

public interface ReviewMapperkjy {
	List<ReviewVo> list(HashMap<String, Object> map);
	HashMap<String, Object> sumstar(int AID);
	int count(int AID);
}
