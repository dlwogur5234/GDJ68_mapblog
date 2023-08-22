package com.gdj68.mapblog.meeting;

import com.gdj68.mapblog.comment.CommentDTO;

public class MeetingCommentDTO extends CommentDTO {

	private Long meetingNum;

	public Long getMeetingNum() {
		return meetingNum;
	}

	public void setMeetingNum(Long meetingNum) {
		this.meetingNum = meetingNum;
	}
}
