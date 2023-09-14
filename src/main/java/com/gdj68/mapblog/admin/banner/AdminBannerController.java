package com.gdj68.mapblog.admin.banner;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/adminBanner/*")
public class AdminBannerController {

	@Autowired
	private AdminBannerService adminBannerService;
	
	@GetMapping("list")
	public String getList(Model model)throws Exception{
		List<AdminBannerDTO> ar = adminBannerService.getList();
		model.addAttribute("list", ar);
		return "admin/adminBanner/adminBannerList";
	}
	
	@GetMapping("add")
	public String setAdd()throws Exception{
		return "admin/adminBanner/adminBannerAdd";
	}
	
	@PostMapping("add")
	public String setAdd(AdminBannerDTO adminBannerDTO)throws Exception{
		int result = adminBannerService.setAdd(adminBannerDTO);
		return "redirect:./list";
	}
	
	@GetMapping("delete")
	public String setDelete(AdminBannerDTO adminBannerDTO)throws Exception{
		
		int result = adminBannerService.setDelete(adminBannerDTO);
		return "redirect:./list";
	}
	
	@GetMapping("select")
	public String setSelect(AdminBannerDTO adminBannerDTO,Model model, HttpSession session)throws Exception{
		adminBannerDTO = adminBannerService.getSelect(adminBannerDTO);
		model.addAttribute("adminBannerDTO", adminBannerDTO);
		session.setAttribute("adminBannerDTO2", adminBannerDTO);
		return "redirect:./list";
	}
	
}
