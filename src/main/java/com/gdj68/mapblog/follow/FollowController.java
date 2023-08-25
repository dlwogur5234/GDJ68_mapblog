package com.gdj68.mapblog.follow;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/follow/*")
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@GetMapping("list")
	public String selectFollowerTotal(FollowDTO followDTO,Model model,HttpSession session) throws Exception{
		long followerCnt=followService.selectFollowerTotal(followDTO, session);
		model.addAttribute("followerCnt",followerCnt);
		long followCnt = followService.selectFollowTotal(followDTO, session);
		model.addAttribute("followCnt", followCnt);
		List<FollowDTO> ar=followService.selectFollowList(followDTO, session);
		model.addAttribute("followList", ar);
		return "follow/list";
	}
}
