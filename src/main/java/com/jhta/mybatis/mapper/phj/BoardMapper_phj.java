package com.jhta.mybatis.mapper.phj;

import java.util.List;

import com.jhta.project.vo.phj.BoardVo_phj;

public interface BoardMapper_phj {
	int insertBoard(BoardVo_phj vo);
	List<BoardVo_phj> selectBoard(String bcate);
	List<BoardVo_phj> selectBoardAll();
}
