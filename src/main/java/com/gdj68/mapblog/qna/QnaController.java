package com.gdj68.mapblog.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		List<QnaDTO> ar=qnaService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "qna/list";
	}
	@GetMapping("add")
	public void setAdd() throws Exception{
		
	}
	@PostMapping("add")
	public String setAdd(QnaDTO qnaDTO,MultipartFile[] photos, HttpSession session) throws Exception{
		qnaService.setAdd(qnaDTO,photos,session);
		return "redirect:./list";
		
	}
	@GetMapping("detail")
	public ModelAndView getDetail(QnaDTO qnaDTO,ModelAndView mv) throws Exception{
		qnaDTO=qnaService.getDetail(qnaDTO);
		mv.addObject("dto", qnaDTO);
		mv.setViewName("qna/detail");
		return mv;
	}
	@GetMapping("update")
	public String setUp(QnaDTO qnaDTO,Model model) throws Exception{
		qnaDTO= qnaService.getDetail(qnaDTO);
		model.addAttribute("dto", qnaDTO);
		return "qna/update";
	}
	@PostMapping("update")
	public String setUp(QnaDTO qnaDTO) throws Exception{
		int result =qnaService.setUp(qnaDTO);
		return "redirect:./list";
	}
	@PostMapping("delete")
	public String setDel(QnaDTO qnaDTO) throws Exception{
		int result= qnaService.setDel(qnaDTO);
		return "redirect:./list";
	}
}
