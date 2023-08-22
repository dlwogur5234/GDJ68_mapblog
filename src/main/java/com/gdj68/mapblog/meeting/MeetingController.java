package com.gdj68.mapblog.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/meeting/*")
public class MeetingController {

	@Autowired
	private MeetingService meetingService;
	
	@GetMapping("add")
	public void setAdd() throws Exception {
		
	}
	
	@PostMapping("add")
	public String setAdd(MeetingDTO meetingDTO) throws Exception {
		System.out.println(meetingDTO.getId());
		System.out.println(meetingDTO.getTitle());
		int result = meetingService.setAdd(meetingDTO);
		return "redirect:../";
	}
	
	@GetMapping("list")
	public void getList(Model model) throws Exception {
		List<MeetingDTO> ar = meetingService.getList();
		model.addAttribute("list", ar);
	}
	
}
