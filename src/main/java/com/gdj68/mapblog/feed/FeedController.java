package com.gdj68.mapblog.feed;

import java.util.List;
//import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/feed/*")
public class FeedController {
	
	@Autowired
	private FeedService feedService;
	
	/* ---------------------------------------------- */
	
	// List
	@GetMapping("list")
	public String getList(Pager pager, Model model) throws Exception {
		List<FeedDTO> ar = feedService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "feed/list";
	}
	
	
	// Add Form
	@GetMapping("add")
	public String setAdd() throws Exception {
		return "feed/add";
	}
	
	// Add Insert
	@PostMapping("add")
	public String setAdd(FeedDTO feedDTO, MultipartFile [] photos, HttpSession session, Model model) throws Exception {
		
		int result = feedService.setAdd(feedDTO, photos, session);
		
		String message = "등록 실패";
		
		if(result>0) {
			message = "등록 성공";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("url", "list");
	
		return "commons/result";

	}
	
	
	// Detail
	@GetMapping("detail")
	public String getDetail(FeedDTO feedDTO, Model model, LikesDTO likesDTO) throws Exception {
		feedDTO = feedService.getDetail(feedDTO);
		
		if(feedDTO != null) {
//			String message = "등록성공";
			model.addAttribute("dto", feedDTO);
//			model.addAttribute("dto", feedDTO);
			
			return "feed/detail";
		} else {
			model.addAttribute("message", "글을 불러올 수 없습니다.");
			model.addAttribute("url", "list");
			
			return "commons/result";
		}
	}
	
	
	// Delete
	@PostMapping("delete")
	public String setDelete(FeedDTO feedDTO) throws Exception {
//		int result = feedService.setDelete(feedDTO);
		
		return "redirect:./list";
	}
	
	
	// Update form
	@GetMapping("update")
	public String setUpdate(FeedDTO feedDTO, Model model) throws Exception {
		feedDTO = feedService.getDetail(feedDTO);
		model.addAttribute("dto", feedDTO);
		
		return "feed/update";
	}
	
	
	// Update POST
	@PostMapping("update")
	public String setUpdate(FeedDTO feedDTO, MultipartFile [] photos, HttpSession session) throws Exception {
//	/	int result = feedService.setUpdate(feedDTO, photos, session);
		
		return("redirect:./detail?feedNum=" + feedDTO.getFeedNum());
	}
	
	
	// fileDelete
	@GetMapping("fileDelete")
	public String setFileDelete(FeedFileDTO feedFileDTO, HttpSession session, Model model) throws Exception {
		
		int result = feedService.setFileDelete(feedFileDTO, session);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	
	// setContentsImgDelete
	@PostMapping("setContentsImgDelete")
	public String setContentsImgDelete(String path, HttpSession session, Model model)throws Exception{
		
		boolean check= feedService.setContentsImgDelete(path, session);
		
		model.addAttribute("result", check);
		
		return "commons/ajaxResult";
	}
	
	
	// setContentsImg
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile files, HttpSession session, Model model)throws Exception{
		
//		System.out.println("setContentsImg");
		System.out.println(files.getOriginalFilename());
		
		String path = feedService.setContentsImg(files, session);
		
		model.addAttribute("result", path);
		
		return "commons/ajaxResult";
		
	}
	
}
