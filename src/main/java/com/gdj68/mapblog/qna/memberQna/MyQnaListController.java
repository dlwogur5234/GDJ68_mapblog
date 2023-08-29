package com.gdj68.mapblog.qna.memberQna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.qna.QnaDTO;
import com.gdj68.mapblog.qna.QnaService;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class MyQnaListController {

	@Autowired
	private MyQnaListService myQnaListService;
	
//	자기가 쓴 qna만 보기
	@GetMapping("myQnaList")
	public ModelAndView getMyQnaList(HttpSession session,Pager pager) throws Exception{
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		List<QnaDTO> ar = myQnaListService.getMyQnaList(memberDTO, pager);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		return mv;
	}
}
