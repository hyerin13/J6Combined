package com.jhta.project.controller.lhj;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.project.service.lhj.AccommodationsServicelhj;
import com.jhta.project.vo.lhj.AccommodationsVo;
import com.jhta.project.vo.lhj.Room_infoVo;
import com.jhta.util.PageUtil;



@RestController
public class AccommodationsControllerlhj {
	@Autowired private AccommodationsServicelhj acservice;
	@Autowired ServletContext sc;
	
	@RequestMapping(value = "admin/lhj/accommlist", produces = {MediaType.APPLICATION_JSON_VALUE}) //숙소 목록 불러오기
	public HashMap<String, Object> accommList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<AccommodationsVo> list = acservice.accommlist();
		String aregdate1 = list.get(0).getAregdate().substring(0,10);
		for(int i=0; i<list.size() ;i++) {
			list.get(i).setAregdate(aregdate1);
		}	
		map.put("list", list);
		//System.out.println("컨트롤러: " + list);
		return map;
	}
	
	@RequestMapping(value = "admin/lhj/detail", produces = {MediaType.APPLICATION_JSON_VALUE}) //개별 숙소 목록 불러오기
	public HashMap<String, Object> detail(int aid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		AccommodationsVo vo = acservice.detail(aid);
		System.out.println("컨트롤러: " + aid);
		String aregdate1 = vo.getAregdate().substring(0,10);
		vo.setAregdate(aregdate1);
		map.put("vo", vo);
		return map;
	}
	
	@RequestMapping(value = "admin/lhj/accommUpdate", produces = {MediaType.APPLICATION_JSON_VALUE}) //숙소 정보 변경하기
	public HashMap<String, Object> accommUpdate(AccommodationsVo vo, MultipartHttpServletRequest mfRequest){
		HashMap<String, Object> map = new HashMap<String, Object>();
		MultipartFile main = mfRequest.getFile("amainimg");
		MultipartFile detail = mfRequest.getFile("adetail");
		// 새로 등록된 사진이 있을 시
		if(!main.isEmpty() || !detail.isEmpty()) {
			String path = sc.getRealPath("/resources/hjy/hotelmain_temp");
			String orgfilename = main.getOriginalFilename();// 전송된 메인 사진 파일명
			String orgfilename1 = detail.getOriginalFilename();// 전송된 추가 사진 파일명
			String savefilename = UUID.randomUUID() + "_" + orgfilename;// 저장할 파일명
			String savefilename1 = UUID.randomUUID() + "_" + orgfilename1;// 저장할 파일명
			try {
				InputStream is = main.getInputStream();
				InputStream is1 = detail.getInputStream();
				FileOutputStream fos = new FileOutputStream(path + "//" + savefilename);
				FileOutputStream fos1 = new FileOutputStream(path + "//" + savefilename1);
				FileCopyUtils.copy(is, fos);
				FileCopyUtils.copy(is1, fos1);
				is.close();
				fos.close();
				is1.close();
				fos1.close();
				// 1. 기존 파일 삭제
				
				// 2. 업로드된 파일정보 DB에 저장하기
				vo.setAmainimg(savefilename);
				vo.setAdetail(savefilename1);
				int n = acservice.accommUpdate(vo);
				if(n > 0) {
					map.put("msg", "숙소 정보 변경이 완료되었습니다.");
				}else {
					map.put("msg", "숙소 정보 변경에 실패했습니다.");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}else {
			int n = acservice.accommUpdate(vo);
			if(n > 0) {
				map.put("msg", "숙소 정보 변경이 완료되었습니다.");
			}else {
				map.put("msg", "숙소 정보 변경에 실패했습니다.");
			}
		}
		return map;
	}
	
	@RequestMapping(value = "admin/lhj/roomlist", produces = {MediaType.APPLICATION_JSON_VALUE}) //객실 목록 불러오기
	public HashMap<String, Object> roomList(int aid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Room_infoVo> list = acservice.roomlist(aid);
		map.put("list", list);
		//System.out.println("컨트롤러: " + list);
		return map;
	}
	
	@RequestMapping(value = "admin/lhj/roomDetail", produces = {MediaType.APPLICATION_JSON_VALUE}) //개별 객실 목록 불러오기
	public HashMap<String, Object> roomDetail(int riid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Room_infoVo vo = acservice.roomDetail(riid);
		System.out.println("컨트롤러: " + riid);
		map.put("vo", vo);
		return map;
	}
	
	@RequestMapping(value = "admin/lhj/roomUpdate", produces = {MediaType.APPLICATION_JSON_VALUE}) //숙소 정보 변경하기
	public HashMap<String, Object> roomUpdate(Room_infoVo vo, MultipartHttpServletRequest mfRequest){
		HashMap<String, Object> map = new HashMap<String, Object>();
		MultipartFile main = mfRequest.getFile("rimainimg");
		MultipartFile ex1 = mfRequest.getFile("riextraimg1");
		MultipartFile ex2 = mfRequest.getFile("riextraimg1");
		// 새로 등록된 사진이 있을 시
		if(!main.isEmpty() || !ex1.isEmpty() || !ex2.isEmpty()) {
			String path = sc.getRealPath("/resources/hjy/hotelmain_temp");
			String orgfilename = main.getOriginalFilename();// 전송된 메인 사진 파일명
			String orgfilename1 = ex1.getOriginalFilename();// 전송된 추가 사진 파일명
			String orgfilename2 = ex2.getOriginalFilename();// 전송된 추가 사진 파일명
			String savefilename = UUID.randomUUID() + "_" + orgfilename;// 저장할 파일명
			String savefilename1 = UUID.randomUUID() + "_" + orgfilename1;// 저장할 파일명
			String savefilename2 = UUID.randomUUID() + "_" + orgfilename2;// 저장할 파일명
			try {
				InputStream is = main.getInputStream();
				InputStream is1 = ex1.getInputStream();
				InputStream is2 = ex2.getInputStream();
				FileOutputStream fos = new FileOutputStream(path + "//" + savefilename);
				FileOutputStream fos1 = new FileOutputStream(path + "//" + savefilename1);
				FileOutputStream fos2 = new FileOutputStream(path + "//" + savefilename2);
				FileCopyUtils.copy(is, fos);
				FileCopyUtils.copy(is1, fos1);
				FileCopyUtils.copy(is2, fos2);
				is.close();
				fos.close();
				is1.close();
				fos1.close();
				is2.close();
				fos2.close();
				// 1. 기존 파일 삭제
				
				// 2. 업로드된 파일정보 DB에 저장하기
				vo.setRimainimg(savefilename);
				vo.setRiextraimg1(savefilename1);
				vo.setRiextraimg2(savefilename2);
				int n = acservice.roomUpdate(vo);
				if(n > 0) {
					map.put("msg", "숙소 정보 변경이 완료되었습니다.");
				}else {
					map.put("msg", "숙소 정보 변경에 실패했습니다.");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} 
		}else {	
			int n = acservice.roomUpdate(vo);
			if(n > 0) {
				map.put("msg", "객실 정보 변경이 완료되었습니다.");
			}else {
				map.put("msg", "객실 정보 변경에 실패했습니다.");
			}
		}
		return map;
	}
	
	// 삭제 클릭시 삭제여부 변경
	@RequestMapping(value = "admin/lhj/delUpdate", produces = {MediaType.APPLICATION_JSON_VALUE}) //숙소 정보 변경하기
	public HashMap<String, Object> delUpdate(int aid){
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map.put("aid", aid);
		int data = acservice.delupdate(map);
		if(data > 0) {
			map2.put("data", data);
			System.out.println("컨트롤러: " + data);
			map2.put("msg", "숙소 삭제가 완료되었습니다.");
		}else {
			map2.put("msg", "숙소 삭제에 실패했습니다.");
		}
		return map2;
	}
}
