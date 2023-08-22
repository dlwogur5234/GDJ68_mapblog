package com.gdj68.mapblog.meeting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MeetingService {

	@Autowired
	private MeetingDAO meetingDAO;
	
	
	public int setAdd(MeetingDTO meetingDTO) throws Exception {
		int result = meetingDAO.setAdd(meetingDTO);
		
		return result; 
	}
	
	public List<MeetingDTO> getList() throws Exception{
		return meetingDAO.getList();
	}
}
