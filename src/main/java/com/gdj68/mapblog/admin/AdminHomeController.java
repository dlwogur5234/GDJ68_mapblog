package com.gdj68.mapblog.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomeController {

	//Home
	@GetMapping("/admin")
	public String AdminHome() {
		return "admin/adminMember/adminLogin";
	}	
		
}
