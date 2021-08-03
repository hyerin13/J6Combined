package com.jhta.project.service.kjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.kjy.AccommodationsMapperkjy;
import com.jhta.project.vo.kjy.AccommodationsVo;

@Service
public class AccommodationsService {
	@Autowired private AccommodationsMapperkjy mapper;
	public AccommodationsVo aidlist(int AID1) {
		return mapper.aidlist(AID1);
	}
}
