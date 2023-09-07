package com.gdj68.mapblog.follow;

import com.gdj68.mapblog.member.MemberDTO;

public class FollowDTO {
	private Long followNum;
	private String fromUser;
	private String toUser;
//	private MemberDTO memberDTO;
	private String id;
	private String fromUserUrl;
	private String toUserUrl;
	
	public String getToUserUrl() {
		return toUserUrl;
	}
	public void setToUserUrl(String toUserUrl) {
		this.toUserUrl = toUserUrl;
	}
	public String getFromUserUrl() {
		return fromUserUrl;
	}
	public void setFromUserUrl(String fromUserUrl) {
		this.fromUserUrl = fromUserUrl;
	}
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
//	public MemberDTO getMemberDTO() {
//		return memberDTO;
//	}
//	public void setMemberDTO(MemberDTO memberDTO) {
//		this.memberDTO = memberDTO;
//	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
