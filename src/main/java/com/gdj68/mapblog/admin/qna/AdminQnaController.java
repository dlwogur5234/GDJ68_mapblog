package com.gdj68.mapblog.admin.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj68.mapblog.admin.member.AdminMemberDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.qna.QnaDTO;
import com.gdj68.mapblog.qna.QnaService;
import com.gdj68.mapblog.qna.qnaComment.QnaCommentDTO;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/admin/adminQna/*")
public class AdminQnaController {

	@Autowired
	private QnaService qnaService;
	
	//list
	@GetMapping("list")
	public String getList(Pager pager, Model model)throws Exception{
		List<QnaDTO> ar = qnaService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "admin/adminQna/adminQnaList";
	}
	
	//detail
	@GetMapping("detail")
	public String getDetail(QnaDTO qnaDTO , Model model, HttpSession session)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		AdminMemberDTO adminMemberDTO = (AdminMemberDTO)session.getAttribute("adminMember");
		qnaDTO = qnaService.getDetail(qnaDTO, memberDTO, adminMemberDTO);
		model.addAttribute("dto", qnaDTO);
		return "admin/adminQna/adminQnaDetail";
	}
	
	@PostMapping("delete")
	public String setDel(QnaDTO qnaDTO) throws Exception{
		int result= qnaService.setDel(qnaDTO);
		return "redirect:./list";
	}
	
	
	
	//qnaComment
		@GetMapping("commentList")
		public void getCommentList(QnaCommentDTO qnaCommentDTO,Pager pager,Model model)throws Exception {
			pager.setPerPage(10L);
			List<QnaCommentDTO> ar = qnaService.getCommentList(pager, qnaCommentDTO);
			model.addAttribute("comment", ar);
			
		}
		@PostMapping("commentAdd")
		public String setCommentAdd(QnaCommentDTO qnaCommentDTO,HttpSession session, Model model) throws Exception{
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			qnaCommentDTO.setId(memberDTO.getId());
			qnaCommentDTO.setNickName(memberDTO.getNickName());
			
			int result = qnaService.setCommentAdd(qnaCommentDTO);
			model.addAttribute("result",result);
			return "commons/ajaxResult";
		}
		@PostMapping("deleteComment")
		public String setCommentDel(@RequestParam Long commentNum,QnaCommentDTO qnaCommentDTO,QnaDTO qnaDTO) throws Exception{
			qnaService.setCommentDelete(qnaCommentDTO);
			/* return "redirect:./detail?qnaNum="+qnaDTO.getQnaNum(); */
			return "redirect:./list";
		}
		
		@PostMapping("commentUp")
		public String setCommentUp(QnaCommentDTO qnaCommentDTO) throws Exception {
		
			qnaService.setCommentUp(qnaCommentDTO);
			
			return "redirect:./list";
		}
	
	
}
