package com.jhta.project.controller.hjy;

import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.hjy.BoardServiceHjy;
import com.jhta.project.service.hjy.CommentsServiceHjy;
import com.jhta.project.service.phj.BoardService_phj;
import com.jhta.project.vo.hjy.BoardVo;
import com.jhta.project.vo.hjy.CommentsVo;
import com.jhta.project.vo.phj.BoardVo_phj;
import com.jhta.util.PageUtil;

@Controller
public class BoardControllerHjy {
	@Autowired
	BoardServiceHjy boardService;
	@Autowired
	BoardService_phj boardService_phj;
	@Autowired
	CommentsServiceHjy commentsService;

	@GetMapping("hjy/all")
	public ModelAndView boardAll(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String field, String keyword,BoardVo_phj vo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("bcate", "all");
		
		PageUtil pu = new PageUtil(pageNum, 10, 5, boardService.count(map));
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BoardVo> list = boardService.list(map);
		System.out.println(list);
		ModelAndView mv=new ModelAndView("user/hjy/board/board_all");
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		mv.addObject("bcate","all");
		return mv;
	}
	@GetMapping("hjy/review")
	public ModelAndView boardReview(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String field, String keyword,BoardVo_phj vo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("bcate", "review");
		
		PageUtil pu = new PageUtil(pageNum, 10, 5, boardService.count(map));
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BoardVo> list = boardService.list(map);
		System.out.println(list);
		ModelAndView mv=new ModelAndView("user/hjy/board/board_review");
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		mv.addObject("bcate","review");
		return mv;
	}
	@GetMapping("hjy/matching")
	public ModelAndView boardMatching(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String field, String keyword,BoardVo_phj vo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("bcate", "matching");
		
		PageUtil pu = new PageUtil(pageNum, 10, 5, boardService.count(map));
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<BoardVo> list = boardService.list(map);
		System.out.println(list);
		ModelAndView mv=new ModelAndView("user/hjy/board/board_matching");
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword", keyword);
		mv.addObject("bcate","matching");
		return mv;
	}
	
	
	@GetMapping("hjy/boardMain")
	public String boardmain() {
		return "user/hjy/board/boardMain";
	}
	@GetMapping("hjy/detail")
	public String boardDeatailForm(int bid, Model model) {
		BoardVo vo = boardService.detail(bid);
		List<CommentsVo> commList = commentsService.list(bid);
		BoardVo nextVo = boardService.nextDetail(bid);
		BoardVo prevVo =boardService.prevDetail(bid);
		Integer cnt = commentsService.commcnt(bid);
		if(cnt==null) {
			cnt=0;
		}
		model.addAttribute("vo", vo);
		model.addAttribute("commList", commList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("nextVo", nextVo);
		model.addAttribute("prevVo", prevVo);
		return "user/hjy/board/boardDetail";
	}
	
	@GetMapping("hjy/newPost")
	public ModelAndView newPost(HttpServletRequest req,String bcate) {
		HttpSession session=req.getSession();
		String mid=(String)session.getAttribute("mid");
		ModelAndView mv=new ModelAndView("user/hjy/board/boardinsert");
		mv.addObject("bcate",bcate);
		System.out.println("카테고리:"+bcate);
		mv.addObject("mid",mid);
		return mv;
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
	
	@PostMapping("hjy/login")
	public String loginTest2(String id, HttpSession session) {
		session.getAttribute("mid");
		return "redirect:/hjy/boardMain";
	}
}
