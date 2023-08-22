package com.gdj68.mapblog.member;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.gdj68.mapblog.member.MemberDTO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// ȸ������
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String setJoin() throws Exception{
		return "member/join";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String setJoin(MemberDTO memberDTO) throws Exception{
		
		System.out.println(memberDTO.toString());	
		memberService.setJoin(memberDTO);
			
		return "redirect:./login";
	}
	
	// �α���
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String getLogin(HttpSession session) throws Exception{
		return "member/login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String getLogin(MemberDTO memberDTO, HttpSession session, Model model)throws Exception{
		memberDTO = memberService.getLogin(memberDTO);
		
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
		}
		return "redirect:../";	
	}
	
	// �α׾ƿ�
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String getLogout(HttpSession session)throws Exception{
		session.invalidate();
		
		return "redirect:../";
	}
	
	// ����������
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String MyPage()throws Exception{
		return "member/mypage";
	}
	
	// ȸ������ ������Ʈ
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String setMemberUpdate()throws Exception{
		return "member/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setMemberUpdate(MemberDTO memberDTO, HttpSession session)throws Exception{
		MemberDTO sessionMember = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(sessionMember.getId());
		int result = memberService.setMemberUpdate(memberDTO);
		if(result>0) {
			session.setAttribute("member", memberDTO);
		}	 
		return "redirect:./mypage";
	}
	
	// ȸ�� Ż��
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteMember(HttpSession session)throws Exception{
		MemberDTO sessionMember = (MemberDTO)session.getAttribute("member");
		int result = memberService.deleteMember(sessionMember);
		session.invalidate();		
		return "redirect:../";
	}
	
	// ID �ߺ�üũ
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	public String getIdCheck(MemberDTO memberDTO, Model model)throws Exception{
		memberDTO = memberService.getIdCheck(memberDTO);
		
		// �⺻��: �ߺ�O
		int result=0;
		if(memberDTO == null) {
			// �ߺ�X
			result=1;
		}		
		model.addAttribute("result", result);	
		return "commons/ajaxResult";
	}
	
	// URL �ߺ�üũ
	@RequestMapping(value = "urlCheck", method = RequestMethod.GET)
	public String getUrlCheck(MemberDTO memberDTO, Model model)throws Exception{
		memberDTO = memberService.getUrlCheck(memberDTO);
		
		// �⺻��: �ߺ�O
		int result=0;	
		if(memberDTO == null) {
			// �ߺ�X
			result=1;
		}		
		model.addAttribute("result", result);		
		return "commons/ajaxResult";
	}
	
}
