package com.jhta.project.controller.hjy;

import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.project.service.hjy.BoardServiceHjy;
import com.jhta.project.service.hjy.CommentsServiceHjy;
import com.jhta.project.vo.hjy.BoardVo;
import com.jhta.project.vo.hjy.CommentsVo;
import com.jhta.util.PageUtil;

@Controller
public class BoardControllerHjy {
	@Autowired
	BoardServiceHjy boardService;
	@Autowired
	CommentsServiceHjy commentsService;

	@GetMapping("hjy/boardMain")
	public String boardmainForm(Model model, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String field, String keyword) {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("field", field);
			map.put("keyword", keyword);
			PageUtil pu = new PageUtil(pageNum, 10, 5, boardService.count(map));
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<BoardVo> list = boardService.list(map);
			model.addAttribute("list", list);
			model.addAttribute("pu", pu);
			model.addAttribute("field", field);
			model.addAttribute("keyword", keyword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/hjy/board/board";
	}

	@GetMapping("hjy/boardDetail")
	public String boardDeatailForm(int bid, Model model) {
		BoardVo vo = boardService.detail(bid);
		List<CommentsVo> commList = commentsService.list(bid);
		BoardVo nextVo = boardService.nextDetail(bid);
		BoardVo prevVo =boardService.prevDetail(bid);
		
		model.addAttribute("vo", vo);
		model.addAttribute("commList", commList);
		model.addAttribute("nextVo", nextVo);
		model.addAttribute("prevVo", prevVo);
		return "user/hjy/board/boardDetail";
	}
	
	/**
	 * 로그인 진입시 사용
	 * @param session
	 * @return
	 */
	@GetMapping("hjy/logintest")
	public String loginTest(HttpSession session) {
		return "user/hjy/board/login";
	}
	
	@PostMapping("hjy/loginTest")
	public String loginTest2(String id, HttpSession session) {
		session.setAttribute("id", id);
		return "redirect:/hjy/boardMain";
	}
}
