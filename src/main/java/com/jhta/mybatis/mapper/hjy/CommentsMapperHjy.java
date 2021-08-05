package com.jhta.mybatis.mapper.hjy;

import java.util.List;

import com.jhta.project.vo.hjy.CommentsVo;

public interface CommentsMapperHjy {
	public List<CommentsVo> list(int bid);
	public int insert(CommentsVo vo);
	public int insertPlus(CommentsVo vo);
	public int update(int cstep);
}
