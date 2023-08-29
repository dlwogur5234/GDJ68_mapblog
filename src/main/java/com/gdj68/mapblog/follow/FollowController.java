package com.gdj68.mapblog.follow;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/follow/*")
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@GetMapping("list")
	public String selectFollow(FollowDTO followDTO,Model model,HttpSession session) throws Exception{
		long followerCnt=followService.selectFollowerTotal(followDTO, session);
		model.addAttribute("followerCnt",followerCnt);
		long followCnt = followService.selectFollowTotal(followDTO, session);
		model.addAttribute("followCnt", followCnt);
		List<FollowDTO> followList=followService.selectFollowList(followDTO, session);
		model.addAttribute("followList", followList);
		List<FollowDTO> followerList = followService.selectFollowerList(followDTO, session);
		model.addAttribute("followerList", followerList);
		return "follow/list";
	}
	@PostMapping("add")
	public String insertFollowAdd(FollowDTO followDTO, HttpSession session,Model model)throws Exception{
		int followAdd=followService.insertFollowAdd(followDTO, session);
		model.addAttribute("followAdd", followAdd);
		return "redirect:follow/list";
	}
	@PostMapping("deleteFollow")
	public String deleteFollow(FollowDTO followDTO , HttpSession session , Model model)throws Exception{
		int followDel = followService.deleteFollow(followDTO, session);
		model.addAttribute("followDel", followDel);
		
		return "redirect:follow/list";
	}
}
