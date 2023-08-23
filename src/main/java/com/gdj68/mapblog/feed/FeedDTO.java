package com.gdj68.mapblog.feed;

import java.sql.Date;
import java.util.List;

public class FeedDTO {

	private Long feedNum;
	private String id;
	private String title;
	private String contents;
	private Date createDate;
	private Date tripDate;
	private Long hit;			// 조회수
	private Long likes;			// 좋아요
	private Long publics;		// 공개여부
	
	// detail에 사진 여러개 나오게 하려구 추가
	private List<FeedFileDTO> fileDTOs;
	
	
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
	public Date getTripDate() {
		return tripDate;
	}
	public void setTripDate(Date tripDate) {
		this.tripDate = tripDate;
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
	public Long getPublics() {
		return publics;
	}
	public void setPublics(Long publics) {
		this.publics = publics;
	}
	public List<FeedFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<FeedFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	
	
}
