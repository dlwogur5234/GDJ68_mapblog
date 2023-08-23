package com.gdj68.mapblog.admin.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/*")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	

	//Login  -> AdminHomeController에서 작업
//	@GetMapping("adminLogin")
//	public String getAdminLogin()throws Exception{
//		return "/admin/adminMember/adminLogin";
//	}
	
	//login
	@PostMapping("admin/adminLogin")
	public String getAdminLogin(AdminMemberDTO adminMemberDTO, HttpSession session)throws Exception{
		adminMemberDTO = adminMemberService.getAdminLogin(adminMemberDTO);
		
		if(adminMemberDTO != null) {
			session.setAttribute("adminMember", adminMemberDTO);
		}
		
		return "redirect:/admin/main";
	}
	
	//logout
	@GetMapping("admin/adminLogout")
	public String getLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/admin";
	}
	
	
	
}
