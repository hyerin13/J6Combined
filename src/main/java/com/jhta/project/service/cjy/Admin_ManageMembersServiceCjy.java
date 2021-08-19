package com.jhta.project.service.cjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.cjy.Admin_ManageMembersMapperCjy;
import com.jhta.project.vo.cjy.Admin_ManageMemVo;

@Service
public class Admin_ManageMembersServiceCjy {
	@Autowired Admin_ManageMembersMapperCjy mapper;
	public int getCount(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	public List<Admin_ManageMemVo> list(HashMap<String, Object> map){
		System.out.println(mapper.list(map).get(0).getMrdate());
		return mapper.list(map);
	}
}
