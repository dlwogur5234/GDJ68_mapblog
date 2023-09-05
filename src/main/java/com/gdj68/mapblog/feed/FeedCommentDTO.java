package com.gdj68.mapblog.feed;

import java.sql.Date;

import com.gdj68.mapblog.comment.CommentDTO;

public class FeedCommentDTO extends CommentDTO {

	private Long feedNum;		// 게시글 번호
	private String nickName;	// 닉네임


	public Long getFeedNum() {
		return feedNum;
	}
	public void setFeedNum(Long feedNum) {
		this.feedNum = feedNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
}