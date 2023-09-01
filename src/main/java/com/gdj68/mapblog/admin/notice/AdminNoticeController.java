package com.gdj68.mapblog.admin.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.notice.NoticeDTO;
import com.gdj68.mapblog.notice.NoticeService;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/adminNotice/*")
public class AdminNoticeController {
	@Autowired
	private NoticeService noticeService;
	
	//list
	@GetMapping("list")
	public String getList(Pager pager , Model model) throws Exception{
		List<NoticeDTO> ar= noticeService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "notice/list";
	}
	
	//add
	@GetMapping("add")
	public String setAdd(NoticeDTO noticeDTO) throws Exception {
		return "notice/add";
	}
	@PostMapping("add")
	public String setAdd(NoticeDTO noticeDTO , MultipartFile[] photos,HttpSession session) throws Exception{
		int result = noticeService.setAdd(noticeDTO, photos, session);
		
		return "redirect:./list";
	}
	
	//detail
	@GetMapping("detail")
	public String getDetail(NoticeDTO noticeDTO, Model model) throws Exception{
		noticeDTO=noticeService.getDetail(noticeDTO);
		model.addAttribute("dto", noticeDTO);
		
		return "notice/detail";
	}
	
	//delete
	@PostMapping("delete")
	public String setDelete(NoticeDTO noticeDTO) throws Exception {
		noticeService.setDelete(noticeDTO);
		return "redirect:./list";
	}
	
	//update
	@GetMapping("update")
	public String setUpdate(NoticeDTO noticeDTO , Model model) throws Exception{
		noticeDTO=noticeService.getDetail(noticeDTO);
		model.addAttribute("dto", noticeDTO);
		return "notice/update";
	}
	@PostMapping("update")
	public String setUpdate(NoticeDTO noticeDTO,MultipartFile [] photos,HttpSession session)throws Exception {
		int result=noticeService.setUpdate(noticeDTO,photos,session);
		return "redirect:./detail?noticeNum="+noticeDTO.getNoticeNum();
	}
}
