package com.gdj68.mapblog.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String setAdd() throws Exception{
		return "qna/add";
	}
}
