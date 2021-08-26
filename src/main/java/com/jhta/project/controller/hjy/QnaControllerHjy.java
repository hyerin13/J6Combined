package com.jhta.project.controller.hjy;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.project.service.hjy.UserqnaServiceHjy;
import com.jhta.project.vo.hjy.UserqnaVo;
import com.jhta.util.PageUtil;

@Controller
public class QnaControllerHjy {
	@Autowired ServletContext sc;
	@Autowired UserqnaServiceHjy userqnaService;
	@GetMapping("hjy/qna")
	public String qnaForm(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum,
			String field, String keyword,UserqnaVo vo,String qcate,Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		if(qcate==null) {
			qcate="all";
		}else {
			model.addAttribute("qcate", qcate);
		}
		map.put("qcate", qcate);
		PageUtil pu = new PageUtil(pageNum, 10, 5, userqnaService.qnacount(map));
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		System.out.println("field"+field);
		System.out.println("keyword"+keyword);
		System.out.println("qcate"+qcate);
		System.out.println("pu"+pu);
		List<UserqnaVo> list = userqnaService.qnalist(map);
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return "user/hjy/qna/qnaMain";
	}
	@GetMapping("hjy/qna/qnaDetail")
	public String qnaForm(int qid,Model model) {
		UserqnaVo vo = userqnaService.qnaDetail(qid);
		UserqnaVo nextVo = userqnaService.next(qid);
		UserqnaVo prevVo = userqnaService.prev(qid);
		String ans = userqnaService.qnaAns(vo.getQref());
		model.addAttribute("vo", vo);
		model.addAttribute("ans", ans);
		model.addAttribute("nextVo", nextVo);
		model.addAttribute("prevVo", prevVo);
		return "user/hjy/qna/qnaDetail";
	}
	@GetMapping("hjy/newQna")
	public String qnaWriteForm() {
		return "user/hjy/qna/qnaWriteForm";
	}
	@PostMapping("hjy/newQna")
	public String qnaWrite(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum,HttpSession session, Model model, String qcate, String qtitle, String qcontent, MultipartFile qfile,String qpw ) {
		String path=sc.getRealPath("/resources/images/userqna");
		System.out.println(path);
		String orgfilename=qfile.getOriginalFilename();//전송된 파일명
		String savefilename=UUID.randomUUID() + "_" + orgfilename; //저장할 파일명(중복되지 않는 이름으로 만들기)
		//uuid : 랜덤하고 중복되지 않는 값을 얻어옴
		try {
			//1. 파일 업로드 하기
			InputStream is=qfile.getInputStream(); 
			FileOutputStream fos=new FileOutputStream(path+"\\"+savefilename);
			FileCopyUtils.copy(is, fos);
			File f=new File(path+"\\"+savefilename);
			long filesize=f.length();
			//혹은 long filesize=file1.getsize();
			is.close();
			fos.close();
			//2. 업로드된 파일정보 DB에 저장하기
			String mid=(String)session.getAttribute("mid");
			System.out.println("mid"+mid);
			int qref=userqnaService.getQref();
			UserqnaVo vo=new UserqnaVo(0,qcate,qpw,qtitle,qcontent,savefilename,null,null,qref,0,mid);
			int n=userqnaService.qnawrite(vo);	
			HashMap<String, Object> map = new HashMap<String, Object>();
			PageUtil pu = new PageUtil(pageNum, 10, 5, userqnaService.qnacount(map));
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			map.put("qcate", qcate);
			List<UserqnaVo> list = userqnaService.qnalist(map);
			model.addAttribute("pu", pu);
			model.addAttribute("list", list);
			model.addAttribute("code","success");
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("code", "fail");
		}
		return "user/hjy/qna/qnaMain";
	}
	

}
