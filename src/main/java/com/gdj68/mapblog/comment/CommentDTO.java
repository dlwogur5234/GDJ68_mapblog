package com.gdj68.mapblog.comment;

import java.sql.Date;

public class CommentDTO {
	
	private Long commentNum;
	private String id;
	private String contents;
	private Date commentDate;
	private Long likes;
	private Long cGroup;
	private Long cDepth;
	
	public Long getcGroup() {
		return cGroup;
	}
	public void setcGroup(Long cGroup) {
		this.cGroup = cGroup;
	}
	public Long getcDepth() {
		return cDepth;
	}
	public void setcDepth(Long cDepth) {
		this.cDepth = cDepth;
	}
	public Long getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(Long commentNum) {
		this.commentNum = commentNum;
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

	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	
	

}
