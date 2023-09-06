package com.gdj68.mapblog.feed;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
//import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.follow.FollowDTO;
import com.gdj68.mapblog.meeting.MeetingCommentDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/feed/*")
public class FeedController {
	
	@Autowired
	private FeedService feedService;
	
	@ModelAttribute("board")
	public String getBoardName() {
		return "feed";
	}

	/* ---------------------------------------------- */

	// List
//	@GetMapping("list")
//	public String getList(Pager pager, Model model, HttpSession session) throws Exception {
//
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//
//	      if (memberDTO != null) {
//	         pager.setId(memberDTO.getId());
//	      }
//
//		List<FeedDTO> ar = feedService.getList(pager);
//		model.addAttribute("list", ar);
//		model.addAttribute("pager", pager);
//
//		return "feed/list";
//	}

	// 개인 url 
	@RequestMapping(value = "list/*", method = RequestMethod.GET)
	public String getUrl (HttpServletRequest request, FeedDTO feedDTO, Model model, Pager pager,HttpSession session) throws Exception{

		StringBuffer userUrl1 = request.getRequestURL();
		String userUrl2 = userUrl1.toString();
		String[] userUrl3 = userUrl2.split("/");
		String userUrl4 = userUrl3[userUrl3.length-1];
		
		System.out.println(userUrl4);
		
		feedDTO.setUrl(userUrl4);
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO = feedService.getUser(feedDTO);
	
//		System.out.println(memberDTO.getId());
		
		List<FeedDTO> li = feedService.getList(memberDTO);
		
		model.addAttribute("list", li);
		
		pager.setId(memberDTO.getId());
		pager = feedService.getPage(pager);
		model.addAttribute("pager", pager);
		//url만 따기
		FollowDTO followDTO = new FollowDTO();
		String urlString = request.getRequestURL().toString();
	    Pattern pattern = Pattern.compile("/feed/list/(\\w+)");
	    Matcher matcher = pattern.matcher(urlString);

	    if (matcher.find()) {
	        String username = matcher.group(1);
	        System.out.println("Username: " + username);

	        // 추출한 username 값을 followDTO의 toUser 속성에 설정
	        followDTO.setToUser(username);
	    }
		//팔로우 여부 체크
	    followDTO.setFromUser(memberDTO.getNickName());
		int followStatus = feedService.checkFollow(followDTO, session);
		memberDTO=(MemberDTO)session.getAttribute("member");
		followDTO.setFromUser(memberDTO.getNickName());
		System.out.println("id :" + followDTO.getFromUser());
		model.addAttribute("followStatus", followStatus);

		return "feed/list";
		
	}

	// Add Form
	@GetMapping("add")
	public String setAdd() throws Exception {
		return "feed/add";
	}

	// Add Insert
	@PostMapping("add")
	public String setAdd(FeedDTO feedDTO, MultipartFile[] photos, HttpSession session, Model model) throws Exception {

		int result = feedService.setAdd(feedDTO, photos, session);

		String message = "등록 실패";

		if (result > 0) {
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

		if (feedDTO != null) {
			String message = "등록성공";
			model.addAttribute("dto", feedDTO);
			
			FeedCommentDTO feedCommentDTO = new FeedCommentDTO();
			feedCommentDTO.setFeedNum(feedDTO.getFeedNum());
			List<FeedCommentDTO> commentList = feedService.getCommentList(feedCommentDTO);
			model.addAttribute("commentList", commentList);

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
		int result = feedService.setDelete(feedDTO);

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
	public String setUpdate(FeedDTO feedDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		int result = feedService.setUpdate(feedDTO, photos, session);

		return ("redirect:./detail?feedNum=" + feedDTO.getFeedNum());
	}

	// 첨부파일 입력란 삭제
	@GetMapping("fileDelete")
	public String setFileDelete(FeedFileDTO feedFileDTO, HttpSession session, Model model) throws Exception {

		int result = feedService.setFileDelete(feedFileDTO, session);
		model.addAttribute("result", result);

		return "commons/ajaxResult";
	}
	
	@GetMapping("fileDown")
	public String getFileDown(FeedFileDTO feedFileDTO, Model model)throws Exception{
		feedFileDTO = feedService.getFileDown(feedFileDTO);
		model.addAttribute("file", feedFileDTO);
		
		return "fileManager";
	}

	// setContentsImgDelete
	@PostMapping("setContentsImgDelete")
	public String setContentsImgDelete(String path, HttpSession session, Model model) throws Exception {

		boolean check = feedService.setContentsImgDelete(path, session);

		model.addAttribute("result", check);

		return "commons/ajaxResult";
	}

	// setContentsImg
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile files, HttpSession session, Model model) throws Exception {

		System.out.println("setContentsImg");
		System.out.println(files.getOriginalFilename());

		String path = feedService.setContentsImg(files, session);

		model.addAttribute("result", path);

		return "commons/ajaxResult";
	}

	
	// 좋아요
	@PostMapping("addLikes")
	@ResponseBody
	public Map<String, Integer> addLikes(LikesDTO likesDTO, HttpSession session, Model model) throws Exception {

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		likesDTO.setId(memberDTO.getId());
		
		model.addAttribute("memberDTO", memberDTO);
		

		Map<String, Integer> resultMap = new HashMap<String, Integer>();

		int check = feedService.checkLikes(likesDTO);
		
		model.addAttribute("check", check);

		if (check == 0) {
			resultMap.put("result", feedService.addLikes(likesDTO));
		} else {
			resultMap.put("result", feedService.deleteLikes(likesDTO));
		}

		resultMap.put("count", feedService.countLikes(likesDTO));

		model.addAttribute("resultMap", resultMap);

		return resultMap;
	}
	
	
	// 좋아요 리스트	
	@GetMapping("likesList")
	public String getLikesList(Model model, HttpSession session, Pager pager) throws Exception {

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		if (memberDTO == null) {
			model.addAttribute("memberDTO", memberDTO);
			return "redirect:/member/login";
		}

		pager.setId(memberDTO.getId());
		
		List<FeedDTO> getLikesList = feedService.getLikesList(pager);

		model.addAttribute("getLikesList", getLikesList);
		model.addAttribute("pager", pager);

		return "feed/likesList";
	}

	


	@PostMapping("addComment")
	public String setAddComment(FeedCommentDTO feedCommentDTO) throws Exception {

		System.out.println("controller 진입");
		System.out.println(feedCommentDTO.getContents());
		System.out.println(feedCommentDTO.getId());
		long ms = feedCommentDTO.getFeedNum();
		int result = feedService.setAddComment(feedCommentDTO);
		return "redirect:./getComment?feedNum="+ms;
	}
	
	@GetMapping("getComment")
	public String getCommentList(FeedCommentDTO feedCommentDTO, Model model) throws Exception {
		List<FeedCommentDTO> ar = feedService.getCommentList(feedCommentDTO);
		model.addAttribute("commentList", ar);
		return "feed/commentList";
		
	}
	
	@PostMapping("deleteComment")
	public String setDeleteComment(FeedCommentDTO feedCommentDTO) throws Exception {
		  int result = feedService.setDeleteComment(feedCommentDTO);
		  long cn = feedCommentDTO.getCommentNum();
		  return "feed/commentList";
	}
	
	
	  @PostMapping("updateComment")
	  public String setUpdateComment(FeedCommentDTO feedCommentDTO) throws Exception {
		  feedService.setUpdateComment(feedCommentDTO);
		  return "feed/commentList";
	  }
	  
	 
	
}
