package com.gdj68.mapblog.meeting;

import java.sql.Date;

public class MeetingDTO {
	
	private Long meetingNum;
	private String id;
	private String title;
	private String contents;
	private Date createDate;
	private String meetingDate;
	private Double lat;
	private Double lng;
	private Long hit;
	private Long likes;
	private Long personnel;
	private String nickName;

	

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Long getPersonnel() {
		return personnel;
	}
	public void setPersonnel(Long personnel) {
		this.personnel = personnel;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Long getMeetingNum() {
		return meetingNum;
	}
	public void setMeetingNum(Long meetingNum) {
		this.meetingNum = meetingNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String getMeetingDate() {
		return meetingDate;
	}
	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	

	
}
