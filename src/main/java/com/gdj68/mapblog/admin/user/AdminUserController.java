package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/adminUser/*")
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	//list
	@GetMapping("userList")
	public String getUserList(Model model, Pager pager)throws Exception{
		List<AdminUserDTO> ar = adminUserService.getUserList(pager);
		model.addAttribute("userList", ar);
		model.addAttribute("pager", pager);
		return "admin/adminUser/userList";
	}
	
	//detail
	@GetMapping("userDetail")
	public String getUserDetail(AdminUserDTO adminUserDTO, Model model)throws Exception{
		adminUserDTO = adminUserService.getUserDetail(adminUserDTO);
		model.addAttribute("dto", adminUserDTO);
		return "admin/adminUser/userDetail";
	}
}
