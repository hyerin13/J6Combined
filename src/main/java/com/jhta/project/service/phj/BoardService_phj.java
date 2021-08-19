package com.jhta.project.service.phj;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.phj.BoardMapper_phj;
import com.jhta.project.vo.phj.BoardVo_phj;
@Service
public class BoardService_phj {
	@Autowired private BoardMapper_phj mapper;
	
	public void setMapper(BoardMapper_phj mapper) {
		this.mapper=mapper;
	}
	public int insertBoard(BoardVo_phj vo) {
		return mapper.insertBoard(vo);
	}
	public List<BoardVo_phj> selectBoard(String bcate) {
		return mapper.selectBoard(bcate);
	}
}
