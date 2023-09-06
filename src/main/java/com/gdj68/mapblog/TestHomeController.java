package com.gdj68.mapblog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class TestHomeController {

	@GetMapping("test")
	public String testHome()throws Exception{
		return "homeTest";
	}
	
	@GetMapping("sample")
	public String testSample()throws Exception{
		return "homeSample";
	}
}
