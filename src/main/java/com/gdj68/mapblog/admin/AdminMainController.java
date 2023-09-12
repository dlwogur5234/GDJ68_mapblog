package com.gdj68.mapblog.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdj68.mapblog.admin.member.AdminMemberDTO;

@Controller
public class AdminMainController {
	//main
	@GetMapping("/admin/main")
	public String AdminMain(HttpSession session) {
		AdminMemberDTO adminMemberDTO=(AdminMemberDTO)session.getAttribute("adminMember");
		adminMemberDTO.getAdminId();
		adminMemberDTO.getAdminPw();
		return "redirect: /admin/adminUser/userList";
	}

	
	//sample페이지 테스트
	@GetMapping("/admin/sample")
	public String SampleTest() {
		return "admin/adminSamplePage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
