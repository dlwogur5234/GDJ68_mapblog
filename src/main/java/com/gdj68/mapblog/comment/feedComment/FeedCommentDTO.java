package com.gdj68.mapblog.comment.feedComment;

import com.gdj68.mapblog.comment.CommentDTO;

public class FeedCommentDTO extends CommentDTO{

	private Long feedNum;

	public Long getFeedNum() {
		return feedNum;
	}

	public void setFeedNum(Long feedNum) {
		this.feedNum = feedNum;
	}
}
