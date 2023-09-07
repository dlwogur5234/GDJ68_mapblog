package com.gdj68.mapblog.admin.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdj68.mapblog.feed.FeedDTO;
import com.gdj68.mapblog.feed.FeedService;
import com.gdj68.mapblog.meeting.MeetingDTO;
import com.gdj68.mapblog.meeting.MeetingService;
@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	@Autowired
	private MeetingService meetingService;
	
	@Autowired
	private FeedService feedService;
	
	@GetMapping("fullcalendar")
	public String fullcalendar()throws Exception{
		return "temp/fullcalendar";
	}
	
	@PostMapping("fullcalendar")
	@ResponseBody
	public List<MeetingDTO> fullcalendar(HttpSession session, MeetingDTO meetingDTO, Model model)throws Exception{
		List<MeetingDTO> ar = meetingService.getMyList(session);
		
		return ar;
	}
	
	@PostMapping("fullcalendar2")
	@ResponseBody
	public List<FeedDTO> fullcalendar2(HttpSession session, MeetingDTO meetingDTO, Model model)throws Exception{
		List<FeedDTO> ar = feedService.getList(session);
		
		return ar;
	}
}
