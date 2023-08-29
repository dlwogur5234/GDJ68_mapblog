package com.gdj68.mapblog.meeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.member.MemberDTO;

@Service
public class MeetingService {

	@Autowired
	private MeetingDAO meetingDAO;
	
	
	public int setAdd(MeetingDTO meetingDTO) throws Exception {
		int result = meetingDAO.setAdd(meetingDTO);
		MeetingMemberDTO meetingMemberDTO = new MeetingMemberDTO();
		meetingMemberDTO.setMeetingNum(meetingDTO.getMeetingNum());
		meetingMemberDTO.setId(meetingDTO.getId());
		int result2 = meetingDAO.setMeetingJoin(meetingMemberDTO);
		return result; 
	}
	
	public List<MeetingDTO> getList() throws Exception{
		return meetingDAO.getList();
	}
	
	public List<MeetingDTO> getMyList(HttpSession session) throws Exception{
		MeetingMemberDTO meetingMemberDTO = new MeetingMemberDTO();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		meetingMemberDTO.setId(memberDTO.getId());
		return meetingDAO.getMyList(meetingMemberDTO);
	}
	
	public Map<String,Object> getDetail(MeetingDTO meetingDTO,HttpSession session) throws Exception {
		MeetingMemberDTO meetingMemberDTO = new MeetingMemberDTO();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		meetingMemberDTO.setId(memberDTO.getId());
		meetingMemberDTO.setMeetingNum(meetingDTO.getMeetingNum());
		long result = meetingDAO.getJoinCheck(meetingMemberDTO);
		meetingDTO = meetingDAO.getDetail(meetingDTO);
		long personnel = meetingDAO.getPersonnelCheck(meetingMemberDTO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("meetingDTO", meetingDTO);
		map.put("personnel", personnel);
		return map;
	}
	
	public int setMeetingJoin(MeetingMemberDTO meetingMemberDTO) throws Exception{
		
		return meetingDAO.setMeetingJoin(meetingMemberDTO);
	}
	
	public int setMeetingQuit(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return meetingDAO.setMeetingQuit(meetingMemberDTO);
	}
	
	public int setMeetingDelete(MeetingDTO meetingDTO) throws Exception {
		
		return meetingDAO.setMeetingDelete(meetingDTO);
	}
	
	public int setUpdate(MeetingDTO meetingDTO) throws Exception {
		int result = meetingDAO.setUpdate(meetingDTO);
		return result;
	}
	
}
