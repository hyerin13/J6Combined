package com.jhta.mybatis.mapper.kjy;

import java.util.List;

import com.jhta.project.vo.kjy.FavoritesearchVo_kjy;

public interface FavoritesearchMapperkjy {
	List<FavoritesearchVo_kjy> hotelsearch(String hotel);
	List<String> airportsearch(String portname);
	List<String> airlinesearch(String airname);
}
