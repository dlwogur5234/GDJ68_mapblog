package com.gdj68.mapblog.feed;

import com.gdj68.mapblog.comment.CommentDTO;

public class FeedReplyDTO extends CommentDTO{

	private Long replyNum;
	private Long feedNum;
	private String nickName;

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Long setFeedNum() {
		return feedNum;
	}

	public void setFeedNum(Long feedNum) {
		this.feedNum = feedNum;
	}

	public Long getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}
	
}
