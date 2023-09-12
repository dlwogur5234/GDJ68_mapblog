package com.gdj68.mapblog.feed;

import java.sql.Date;
import java.util.List;

public class FeedDTO {

	private int rNum;
	private Long feedNum;
	private String id;
	private String title;
	private String contents;
	private Date createDate;
	private String tripDate;
	private Long hit; 			// 조회수
	private Long likes;			// 좋아요
	private Long publics; 		// 공개여부
	
	
	/* 지도 관련 */
	private Double lat;			// 위도
	private Double lng;			// 경도

	
	private List<FeedFileDTO> dtos;
	
	
	private String url;
	
	

	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
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

	public String getTripDate() {
		return tripDate;
	}

	public void setTripDate(String tripDate) {
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

	public List<FeedFileDTO> getDtos() {
		return dtos;
	}

	public void setDtos(List<FeedFileDTO> dtos) {
		this.dtos = dtos;
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
	
	

}
