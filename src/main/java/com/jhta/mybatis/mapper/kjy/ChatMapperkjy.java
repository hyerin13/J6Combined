package com.jhta.mybatis.mapper.kjy;

import java.util.HashMap;
import java.util.List;

import com.jhta.project.vo.kjy.Chat_buddyVo_kjy;
import com.jhta.project.vo.kjy.Chat_membersVo_kjy;
import com.jhta.project.vo.kjy.Chat_roomjoinVo_kjy;

public interface ChatMapperkjy {
	Chat_membersVo_kjy member(String cmid);
	List<Chat_membersVo_kjy> buddy(String cmid);
	List<Chat_roomjoinVo_kjy> roomjoin(HashMap<String, Object> map);
	List<HashMap<String, Object>> count(String cmid);
}
