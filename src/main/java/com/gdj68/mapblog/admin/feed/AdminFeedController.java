package com.gdj68.mapblog.admin.feed;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.feed.FeedCommentDTO;
import com.gdj68.mapblog.feed.FeedDTO;
import com.gdj68.mapblog.feed.FeedService;
import com.gdj68.mapblog.feed.LikesDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("admin/adminFeed/*")
public class AdminFeedController {

	@Autowired
	private FeedService feedService;
	
	// List
	@GetMapping("list")
	public String getList(Pager pager, Model model) throws Exception {

		List<FeedDTO> ar = feedService.getList3(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);

		return "admin/adminFeed/adminFeedList";
	}
	
	
	// Detail
		@GetMapping("detail")
		public String getDetail(FeedDTO feedDTO, Model model, LikesDTO likesDTO) throws Exception {
			feedDTO = feedService.getDetail(feedDTO);
			
			FeedDTO getFeedUrl = feedService.getFeedUrl(feedDTO);
			String feedUrl = getFeedUrl.getUrl();
			feedDTO.setUrl(feedUrl);

			
			if (feedDTO != null) {
				model.addAttribute("dto", feedDTO);
				
				FeedCommentDTO feedCommentDTO = new FeedCommentDTO();
				feedCommentDTO.setFeedNum(feedDTO.getFeedNum());
				List<FeedCommentDTO> commentList = feedService.getCommentList(feedCommentDTO);
				model.addAttribute("commentList", commentList);

				return "admin/adminFeed/adminFeedDetail";
				
			} else {
				
				model.addAttribute("message", "글을 불러올 수 없습니다.");
				
				model.addAttribute("url", "list");
				
				return "commons/result";
			}
		}
	
		// Delete
		@PostMapping("delete")
		public String setDelete(FeedDTO feedDTO, HttpSession session) throws Exception {
		      int result = feedService.setDelete(feedDTO);
		      MemberDTO m = (MemberDTO)session.getAttribute("member");
		      
		      
		      return "redirect:./list/";
		}
	
	
	
}
