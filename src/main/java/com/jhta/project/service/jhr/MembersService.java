package com.jhta.project.service.jhr;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.jhr.MembersMapper;
import com.jhta.project.vo.jhr.MembersVo;

@Service
public class MembersService {
   @Autowired MembersMapper mapper;
   public int insert(MembersVo vo) {
      return mapper.insert(vo);
   }
   public MembersVo isMember(HashMap<String, String> map) {
      return mapper.isMember(map);
   }
   public MembersVo findId(HashMap<String, String> map) {
	  return mapper.findId(map);
   }
   public MembersVo checkPw(HashMap<String, String> map) {
	  return mapper.checkPw(map);
   }
   public int resetPw(MembersVo vo) {
	  return mapper.resetPw(vo);
   }
   public MembersVo checkId(String mid) {
	  return mapper.checkId(mid);
   }
   public int update(MembersVo vo) {
	  return mapper.update(vo);
   }
   public MembersVo find(String mid) {
	   return mapper.find(mid);
   }
   public int delete(MembersVo vo) {
	   return mapper.delete(vo);
   }
}