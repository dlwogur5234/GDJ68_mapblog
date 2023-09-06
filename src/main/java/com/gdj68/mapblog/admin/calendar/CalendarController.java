package com.gdj68.mapblog.admin.calendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.meeting.MeetingDTO;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	
	@GetMapping("fullcalendar")
	public String fullcalendar(HttpSession session, MeetingDTO meetingDTO, Model model)throws Exception{
		
		return "temp/fullcalendar";
	}
}
