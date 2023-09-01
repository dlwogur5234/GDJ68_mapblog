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
	
	public List<MeetingDTO> getMyList(MeetingMemberDTO meetingMemberDTO) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getMyList",meetingMemberDTO);
	}
	
	public MeetingDTO getDetail(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getDetail", meetingDTO);
		
	}
	
	public int setMeetingJoin(MeetingMemberDTO meetingMemberDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setMeetingJoin", meetingMemberDTO);
	}
	
	public Long getJoinCheck(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getJoinCheck", meetingMemberDTO);
	}
	
	public int setMeetingQuit(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setMeetingQuit", meetingMemberDTO);
	}
	
	public int setMeetingDelete(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setMeetingDelete",meetingDTO);
	}
	
	public int setUpdate(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate",meetingDTO);
	}
	
	public long getPersonnelCheck(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPersonnelCheck", meetingMemberDTO);
	}
	
	public int setAddComment(MeetingCommentDTO commentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAddComment",commentDTO);
	}
	
	public List<MeetingCommentDTO> getCommentList(MeetingCommentDTO commentDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCommentList", commentDTO);
	}
	
}
