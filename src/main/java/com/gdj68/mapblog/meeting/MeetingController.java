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
	
	@GetMapping("myList")
	public void getMyList(Model model,HttpSession session) throws Exception {
		List<MeetingDTO> ar = meetingService.getMyList(session);
		model.addAttribute("myList", ar);
	}
	
	@GetMapping("detail")
	public void getDetail(MeetingDTO meetingDTO, Model model,HttpSession session)throws Exception {
		System.out.println(meetingDTO.getMeetingNum());
		Map<String, Object> map = new HashMap<String, Object>();
		map = meetingService.getDetail(meetingDTO,session);
		long result = (Long)map.get("result");
		long personnel = (Long)map.get("personnel");
		System.out.println("result 값 : "+result);
		System.out.println("personnel 값 : "+personnel);
		meetingDTO = (MeetingDTO)map.get("meetingDTO");
		model.addAttribute("dto",meetingDTO);
		model.addAttribute("result", result);
		model.addAttribute("personnel", personnel);
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
	
	@GetMapping("update")
	public void setUpdate(MeetingDTO meetingDTO,HttpSession session,Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map = meetingService.getDetail(meetingDTO,session);
		meetingDTO = (MeetingDTO)map.get("meetingDTO");
		model.addAttribute("dto", meetingDTO);
	}
	
	@PostMapping("update")
	public String setUpdate(MeetingDTO meetingDTO) throws Exception {
		meetingService.setUpdate(meetingDTO);
		return "redirect:./list";
	}
	
	@PostMapping("addComment")
	public String setAddComment(MeetingCommentDTO commentDTO) throws Exception {
		System.out.println("controller 진입");
		System.out.println(commentDTO.getContents());
		System.out.println(commentDTO.getId());
		long ms = commentDTO.getMeetingNum();
		int result = meetingService.setAddComment(commentDTO);
		return "redirect:./getComment?meetingNum="+ms;
	}
	
	@GetMapping("getComment")
	public String getCommentList(MeetingCommentDTO commentDTO,Model model) throws Exception {
		List<MeetingCommentDTO> ar = meetingService.getCommentList(commentDTO);
		model.addAttribute("commentList", ar);
		return "meeting/commentList";
	}
	
	
	  @GetMapping("deleteComment") 
	  public String setDeleteComment(MeetingCommentDTO commentDTO) throws Exception {
		  int result = meetingService.setDeleteComment(commentDTO);
		  long cn = commentDTO.getCommentNum();
		  return "meeting/commentList";
	  }
	
	  @PostMapping("updateComment")
	  public String setUpdateComment(MeetingCommentDTO commentDTO) throws Exception {
		  meetingService.setUpdateComment(commentDTO);
		  return "meeting/commentList";
	  }
	
	
}
