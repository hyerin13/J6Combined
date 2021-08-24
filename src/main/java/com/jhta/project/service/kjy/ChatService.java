package com.jhta.project.service.kjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.mybatis.mapper.kjy.ChatMapperkjy;
import com.jhta.project.vo.kjy.Chat_buddyVo_kjy;
import com.jhta.project.vo.kjy.Chat_membersVo_kjy;
import com.jhta.project.vo.kjy.Chat_roomjoinVo_kjy;

@Service
public class ChatService {
	@Autowired private ChatMapperkjy mapper;
	public Chat_membersVo_kjy member(String cmid) {
		return mapper.member(cmid);
	}
	public List<Chat_membersVo_kjy> buddy(String cmid){
		return mapper.buddy(cmid);
	}
	public List<Chat_roomjoinVo_kjy> roomjoin(HashMap<String, Object> map){
		return mapper.roomjoin(map);
	}
	public List<HashMap<String, Object>> count(String cmid){
		return mapper.count(cmid);
	}
}
