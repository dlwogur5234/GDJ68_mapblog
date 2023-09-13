package com.gdj68.mapblog;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gdj68.mapblog.feed.FeedDTO;
import com.gdj68.mapblog.feed.FeedService;
import com.gdj68.mapblog.member.MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private FeedService feedService;
	
	String url = "";
	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String home(Locale locale, Model model, HttpSession session) throws Exception {

		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		session.removeAttribute("loginFailed");
		session.removeAttribute("updateResult");
		

		// Rank 
		List<FeedDTO> hitRank = feedService.getHitRank();
		List<FeedDTO> likesRank = feedService.getLikesRank();
		List<FeedDTO> newRank = feedService.getNewRank();
		List<MemberDTO> hitMember = feedService.getHitMember();
		List<MemberDTO> likesMember = feedService.getLikesMember();
		
		model.addAttribute("hitRank", hitRank);
		model.addAttribute("likesRank", likesRank);
		model.addAttribute("newRank", newRank);
		model.addAttribute("hitMember", hitMember);
		model.addAttribute("likesMember", likesMember);
		
		return "home";
	}
	
}

