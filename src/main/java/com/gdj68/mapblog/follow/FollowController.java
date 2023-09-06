package com.gdj68.mapblog.follow;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj68.mapblog.member.MemberDTO;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/feed/follow/*")
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	
	
	@GetMapping("list")
	public String selectFollow(FollowDTO followDTO,Model model,HttpSession session,HttpServletRequest request,@RequestParam() String nowUrl) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String username = nowUrl.split("feed/list/")[1];
		if(!username.equals("")) {
			followDTO.setToUser(username);
			
		}
		model.addAttribute("member", memberDTO);
        
		long followerCnt=followService.selectFollowerTotal(followDTO, session);
		model.addAttribute("followerCnt",followerCnt);
		
		  long followCnt = followService.selectFollowTotal(followDTO, session);
		  model.addAttribute("followCnt", followCnt); List<FollowDTO>
		  followList=followService.selectFollowList(followDTO, session);
		  model.addAttribute("followList", followList); List<FollowDTO> 
		  followerList = followService.selectFollowerList(followDTO, session);
		  model.addAttribute("followerList", followerList); 
		 
		return "/follow/list";
	}
	@PostMapping("add")
	public String insertFollowAdd(FollowDTO followDTO, HttpSession session,Model model,HttpServletRequest request, @RequestParam() String nowUrl)throws Exception{
		
		
        String username = nowUrl.split("feed/list/")[1];
        if (!username.equals("")) {
            followDTO.setToUser(username);
            System.out.println("Username: " + username); 
            
        } 
        System.out.println("ToUser: " + followDTO.getToUser());
		int followAdd=followService.insertFollowAdd(followDTO, session);
		model.addAttribute("followAdd", followAdd);
		return "redirect:/";
	}
	@PostMapping("deleteFollow")
	public String deleteFollow(FollowDTO followDTO , HttpSession session , Model model,@RequestParam() String nowUrl)throws Exception{
		
		String username = nowUrl.split("feed/list/")[1];
		if(!username.equals("") ) {
			followDTO.setToUser(username);
			System.out.println("Username: " + username);
		}
		
		
		int followDel = followService.deleteFollow(followDTO, session);
		model.addAttribute("followDel", followDel);
		
		return "redirect:/";
	}
}
