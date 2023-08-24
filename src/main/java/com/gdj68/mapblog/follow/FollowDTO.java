package com.gdj68.mapblog.follow;

public class FollowDTO {
	private Long followNum;
	private String fromUser;
	private String toUser;
	public Long getFollowNum() {
		return followNum;
	}
	public void setFollowNum(Long followNum) {
		this.followNum = followNum;
	}
	public String getFromUser() {
		return fromUser;
	}
	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}
	public String getToUser() {
		return toUser;
	}
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	
	
}
