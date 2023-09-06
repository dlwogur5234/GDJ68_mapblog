package com.gdj68.mapblog.meeting;

public class MeetingMemberDTO {
	
	private Long meetingMemberNum;
	private Long meetingNum;
	private String id;
	private String nickName;
	
	
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Long getMeetingMemberNum() {
		return meetingMemberNum;
	}
	public void setMeetingMemberNum(Long meetingMemberNum) {
		this.meetingMemberNum = meetingMemberNum;
	}
	public Long getMeetingNum() {
		return meetingNum;
	}
	public void setMeetingNum(Long meetingNum) {
		this.meetingNum = meetingNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
