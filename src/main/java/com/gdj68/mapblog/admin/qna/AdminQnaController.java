package com.gdj68.mapblog.admin.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.admin.member.AdminMemberDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.qna.QnaDTO;
import com.gdj68.mapblog.qna.QnaService;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/admin/adminQna/*")
public class AdminQnaController {

	@Autowired
	private QnaService qnaService;
	
	@GetMapping("list")
	public String getList(Pager pager, Model model)throws Exception{
		List<QnaDTO> ar = qnaService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "admin/adminQna/adminQnaList";
	}
	
	@GetMapping("detail")
	public String getDetail(QnaDTO qnaDTO , Model model, HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		AdminMemberDTO adminMemberDTO = (AdminMemberDTO)session.getAttribute("adminMember");
		qnaDTO = qnaService.getDetail(qnaDTO, memberDTO, adminMemberDTO);
		model.addAttribute("dto", qnaDTO);
		return "admin/adminQna/adminQnaDetail";
	}
}
