package com.jhta.mybatis.mapper.cjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jhta.project.vo.cjy.ReservationVo;

public interface Admin_CancelRefundMapperCjy {
	public List<ReservationVo> list();
	public int update(HashMap<String, Object> map);
	public List<ReservationVo> afterapprovallist();
}
