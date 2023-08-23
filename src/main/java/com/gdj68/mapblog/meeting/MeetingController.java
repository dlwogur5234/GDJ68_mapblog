package com.gdj68.mapblog.meeting;

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

import com.gdj68.mapblog.member.MemberDTO;

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
		int result = meetingService.setAdd(meetingDTO);
		return "redirect:../";
	}
	
	@GetMapping("list")
	public void getList(Model model) throws Exception {
		List<MeetingDTO> ar = meetingService.getList();
		model.addAttribute("list", ar);
	}
	
	@GetMapping("detail")
	public void getDetail(MeetingDTO meetingDTO, Model model,HttpSession session)throws Exception {
		System.out.println(meetingDTO.getMeetingNum());
		Map<String, Object> map = new HashMap<String, Object>();
		map = meetingService.getDetail(meetingDTO,session);
		long result = (Long)map.get("result");
		System.out.println("result 값 : "+result);
		meetingDTO = (MeetingDTO)map.get("meetingDTO");
		model.addAttribute("dto",meetingDTO);
		model.addAttribute("result", result);
	}
	
	@PostMapping("meetingJoin")
	public String setMeetingJoin(MeetingMemberDTO meetingMemberDTO,HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		meetingMemberDTO.setId(memberDTO.getId());
		int result = meetingService.setMeetingJoin(meetingMemberDTO);
		return "redirect:./list";
	}
	
	@PostMapping("meetingQuit")
	public String setMeetingQuit(MeetingMemberDTO meetingMemberDTO) throws Exception {
		meetingService.setMeetingQuit(meetingMemberDTO);
		return "redirect:./list";
	}
	
	@GetMapping("delete")
	public String setMeetingDelete(MeetingDTO meetingDTO) throws Exception {
		meetingService.setMeetingDelete(meetingDTO);
		return "redirect:./list";
	}
	
	
}
