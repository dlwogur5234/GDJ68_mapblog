package com.gdj68.mapblog.meeting;

import com.gdj68.mapblog.comment.CommentDTO;

public class MeetingReplyDTO extends CommentDTO{

	private Long replyNum;
	private Long meetingNum;
	private String nickName;

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Long getMeetingNum() {
		return meetingNum;
	}

	public void setMeetingNum(Long meetingNum) {
		this.meetingNum = meetingNum;
	}

	public Long getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}
	
}
