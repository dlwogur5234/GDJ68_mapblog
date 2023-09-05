package com.gdj68.mapblog.feed;

public class FeedCommentLikesDTO {
		
	
	private Integer likesNum;
	private Long commentNum;
	private String id;
	private Integer feedNum;

	

	public Integer getLikesNum() {
		return likesNum;
	}



	public void setLikesNum(Integer likesNum) {
		this.likesNum = likesNum;
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



	public Integer getFeedNum() {
		return feedNum;
	}



	public void setFeedNum(Integer feedNum) {
		this.feedNum = feedNum;
	}



	@Override
	public String toString() {
		return "FeedCommentLikesDTO [likesNum=" + likesNum + ", commentNum =" + commentNum + " id=" + id + ", feedNum=" + feedNum + "]";
	}

}
