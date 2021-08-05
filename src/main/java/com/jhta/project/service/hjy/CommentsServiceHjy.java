package com.jhta.project.service.hjy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.hjy.CommentsMapperHjy;
import com.jhta.project.vo.hjy.CommentsVo;

@Service
public class CommentsServiceHjy {
	@Autowired CommentsMapperHjy mapper;
	public List<CommentsVo> list(int bid){
		return mapper.list(bid);
	};
	public int insert(CommentsVo vo) {
		return mapper.insert(vo);
	};
	public int insertPlus(CommentsVo vo) {
		return mapper.insert(vo);
	};
	public int update(int cstep) {
		return mapper.update(cstep);
	};
}
