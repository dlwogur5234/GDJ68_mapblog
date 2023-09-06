package com.gdj68.mapblog.admin.calendar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.meeting.MeetingDTO;
import com.gdj68.mapblog.meeting.MeetingService;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	@Autowired
	private MeetingService meetingService;
	
	@GetMapping("fullcalendar")
	public String fullcalendar(HttpSession session, MeetingDTO meetingDTO, Model model)throws Exception{
		List<MeetingDTO> ar = meetingService.getMyList(session);
		model.addAttribute("myList", ar);
		return "temp/fullcalendar";
	}
}
