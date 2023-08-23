package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminUser/*")
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	//list
	@GetMapping("userList")
	public String getUserList(Model model)throws Exception{
		List<AdminUserDTO> ar = adminUserService.getUserList();
		model.addAttribute("userList", ar);
		
		return "admin/adminUser/userList";
	}
	
	//detail
}
