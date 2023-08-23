package com.gdj68.mapblog.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list")
	public String getList(Pager pager , Model model) throws Exception{
		List<NoticeDTO> ar= noticeService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "notice/list";
	}
	@GetMapping("add")
	public String setAdd(NoticeDTO noticeDTO) throws Exception {
		return "notice/add";
	}
	@PostMapping("add")
	public String setAdd(NoticeDTO noticeDTO , MultipartFile[] photos,HttpSession session) throws Exception{
		int result = noticeService.setAdd(noticeDTO, photos, session);
		
		return "redirect:./list";
	}
}
