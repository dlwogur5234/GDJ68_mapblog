package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.member.MemberService;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/admin/adminUser/*")
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private MemberService memberService;
	
	//list
	@GetMapping("userList")
	public String getUserList(Model model, Pager pager)throws Exception{
		List<MemberDTO> ar = adminUserService.getUserList(pager);
		model.addAttribute("userList", ar);
		model.addAttribute("pager", pager);
		return "admin/adminUser/userList";
	}
	
	//detail
	@GetMapping("userDetail")
	public String getUserDetail(MemberDTO memberDTO, Model model)throws Exception{
		memberDTO = adminUserService.getUserDetail(memberDTO);
		model.addAttribute("dto", memberDTO);
		return "admin/adminUser/userDetail";
	}
	
	//update 비밀번호 초기화
	@GetMapping("userUpdate")
	public String setUserUpdate(MemberDTO memberDTO, Model model)throws Exception{
		int result = adminUserService.setMemberUpdate(memberDTO);
		if(result>0) {
			model.addAttribute("dto", memberDTO);
		}
		return "redirect: /admin/adminUser/userList";
	}
	
	//delete
		@GetMapping("userDelete")
		public String setUserDelete(MemberDTO memberDTO, Model model)throws Exception{
			int result = memberService.deleteMember(memberDTO);
			
			return "redirect: /admin/adminUser/userList";
		}
	
	
	
	
	
	
	
	
	
	
}
