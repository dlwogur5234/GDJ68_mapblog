package com.gdj68.mapblog.comments;

import java.sql.Date;

public class CommentsDTO {
	
	private Long commentNum;
	private Long feedNum;
	private String id;
	private String contents;
	private Date commentsDate;
	private Long likes;
	public Long getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(Long commentNum) {
		this.commentNum = commentNum;
	}
	public Long getFeedNum() {
		return feedNum;
	}
	public void setFeedNum(Long feedNum) {
		this.feedNum = feedNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCommentsDate() {
		return commentsDate;
	}
	public void setCommentsDate(Date commentsDate) {
		this.commentsDate = commentsDate;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	
	

}
