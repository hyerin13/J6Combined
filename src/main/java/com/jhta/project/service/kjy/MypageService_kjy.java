package com.jhta.project.service.kjy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.kjy.MypageMapperkjy;
import com.jhta.project.vo.kjy.MypageVo_kjy;

@Service
public class MypageService_kjy {
	@Autowired private MypageMapperkjy mapper;
	public MypageVo_kjy list(String MID) {
		return mapper.list(MID);
	}
}
