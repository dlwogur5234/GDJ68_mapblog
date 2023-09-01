package com.gdj68.mapblog.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gdj68.mapblog.admin.member.AdminMemberDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.qna.qnaComment.QnaCommentDTO;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	@Autowired
	private QnaService qnaService;
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
		/*
		 * AdminMemberDTO adminMemberDTO =
		 * (AdminMemberDTO)session.getAttribute("adminMember");
		 * qnaCommentDTO.setAdminId(adminMemberDTO.getAdminId());
		 */
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
	public void setCommentUp(QnaCommentDTO qnaCommentDTO) throws Exception{
		
		/*
		 * Map<String, Object> map = new HashMap<String, Object>(); QnaCommentDTO
		 * qnaCommentDTO = new QnaCommentDTO(); qnaCommentDTO.setCommentNum(commentNum);
		 * qnaCommentDTO.setContents(contents); qnaService.setCommentUp(qnaCommentDTO);
		 * 
		 * map.put(contents, qnaCommentDTO);
		 * 
		 * return map;
		 */
	}

// qna	
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
	@PostMapping("add")
	public String setAdd(QnaDTO qnaDTO,MultipartFile[] photos, HttpSession session) throws Exception{
		
		int result = qnaService.setAdd(qnaDTO,photos,session);
		
		return "redirect:./list";
		
	}
	@GetMapping("detail")
	public String getDetail(QnaDTO qnaDTO,Model model,HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		AdminMemberDTO adminMemberDTO = (AdminMemberDTO)session.getAttribute("adminMember");
		qnaDTO=qnaService.getDetail(qnaDTO,memberDTO,adminMemberDTO);	
		model.addAttribute("dto", qnaDTO);
	
		if(qnaDTO == null) {
			String message ="비공개 글 입니다";
			model.addAttribute("message", message);
			model.addAttribute("url", "./list");
			return "commons/result";
		}
		
		return "qna/detail";
	}
	@GetMapping("update")
	public String setUp(QnaDTO qnaDTO,Model model,HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		AdminMemberDTO adminMemberDTO = (AdminMemberDTO)session.getAttribute("adminMember");
		qnaDTO= qnaService.getDetail(qnaDTO, memberDTO,adminMemberDTO);
		model.addAttribute("dto", qnaDTO);
		System.out.println(qnaDTO.getMemberId());
		return "qna/update";
	}
	@PostMapping("update")
	public String setUp(QnaDTO qnaDTO, MultipartFile [] photos , HttpSession session) throws Exception{
		int result =qnaService.setUp(qnaDTO,photos,session);
		return "redirect:./list";
	}
	@PostMapping("delete")
	public String setDel(QnaDTO qnaDTO) throws Exception{
		int result= qnaService.setDel(qnaDTO);
		return "redirect:./list";
	}
}
