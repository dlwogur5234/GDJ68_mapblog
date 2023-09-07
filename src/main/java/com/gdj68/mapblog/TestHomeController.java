package com.gdj68.mapblog;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.meeting.MeetingDTO;

@Controller
@RequestMapping("/")
public class TestHomeController {

//	@GetMapping("test")
//	public String testHome()throws Exception{
//		return "homeTest";
//	}
	
	@GetMapping("sample")
	public String testSample()throws Exception{
		return "homeSample";
	}
	

}
