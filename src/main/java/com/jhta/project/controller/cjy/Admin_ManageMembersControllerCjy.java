package com.jhta.project.controller.cjy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.project.service.cjy.Admin_ManageMembersServiceCjy;
import com.jhta.project.vo.cjy.Admin_ManageMemVo;
import com.jhta.util.PageUtil;

@RestController
public class Admin_ManageMembersControllerCjy {
	@Autowired Admin_ManageMembersServiceCjy memService;
	@RequestMapping(value="admin/cjy/searchmem", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> memlist(@RequestParam(value="pageNum", defaultValue="1")int pageNum, String field, String keyword){
		HashMap<String, Object> map = new HashMap<String,Object>();
		HashMap<String, Object> map1 = new HashMap<String,Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int totalRowCount=memService.getCount(map);
		PageUtil pu=new PageUtil(pageNum,10,10,totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow", startRow); //boardmapper에서 sql문에 필요
		map.put("endRow", endRow);//boardmapper에서 sql문에 필요
		try {
			List<Admin_ManageMemVo> list=memService.list(map);
			String mrdate1=list.get(0).getMrdate().substring(0,10);
			String mbirth1=list.get(0).getMbirth().substring(0,10);
			for(int i=0; i<list.size() ;i++) {
				list.get(i).setMrdate(mrdate1);
				list.get(i).setMbirth(mbirth1);
			}		
			map1.put("list", list);
			map1.put("pu", pu);
			map1.put("field", field);
			map1.put("keyword", keyword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map1;
		

	}
}
