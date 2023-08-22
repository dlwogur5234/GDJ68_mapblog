package com.gdj68.mapblog.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminMainController {
	//main
	@GetMapping("/admin/main")
	public String AdminMain() {
		return "admin/adminMain";
	}
}
