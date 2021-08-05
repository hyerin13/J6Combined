package com.jhta.project.service.kjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.kjy.ReviewMapperkjy;
import com.jhta.project.vo.kjy.ReviewVo;

@Service
public class ReviewService {
	@Autowired private ReviewMapperkjy mapper;
	public List<ReviewVo> list(HashMap<String, Object> map){
		return mapper.list(map);
	}
	public HashMap<String, Object> sumstar(int AID) {
		return mapper.sumstar(AID);
	}
	public int count(int AID) {
		return mapper.count(AID);
	}
}
