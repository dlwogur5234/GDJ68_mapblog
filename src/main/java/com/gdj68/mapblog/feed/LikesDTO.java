package com.gdj68.mapblog.feed;

public class LikesDTO {

	private Integer likesNum;
	private String id;
	private Integer feedNum;

	public int getLikesNum() {
		return likesNum;
	}

	public void setLikesNum(int likesNum) {
		this.likesNum = likesNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFeedNum() {
		return feedNum;
	}

	public void setFeedNum(int feedNum) {
		this.feedNum = feedNum;
	}

	@Override
	public String toString() {
		return "LikesDTO [likesNum=" + likesNum + ", id=" + id + ", feedNum=" + feedNum + "]";
	}

}
