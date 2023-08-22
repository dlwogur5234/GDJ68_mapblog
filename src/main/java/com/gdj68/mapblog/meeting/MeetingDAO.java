package com.gdj68.mapblog.meeting;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MeetingDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.gdj68.mapblog.meeting.MeetingDAO."; 
	
	public int setAdd(MeetingDTO meetingDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setAdd", meetingDTO);
	}
	
	public List<MeetingDTO> getList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	
	
	
	
}
