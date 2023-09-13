package com.gdj68.mapblog.feed;

import java.sql.Date;
import java.util.List;

public class FeedDTO {

	private int rnum;
	private Long feedNum;
	private String id;
	private String title;
	private String contents;
	private String fileName;
	private Date createDate;
	private Date tripDate;

	private Long hit; 			// 조회수
	private Long likes;			// 좋아요
	private Long publics; 		// 공개여부

	
	private String thumbnail;	// 리스트 썸네일 사진

	/* 지도 관련 */
	private Double lat; // 위도
	private Double lng; // 경도

	private String url; // url

	private List<FeedFileDTO> dtos;
	
	

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<FeedFileDTO> getDtos() {
		return dtos;
	}

	public void setDtos(List<FeedFileDTO> dtos) {
		this.dtos = dtos;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		return "FeedDTO [rnum=" + rnum + ", feedNum=" + feedNum + ", id=" + id + ", title=" + title + ", contents="
				+ contents + ", createDate=" + createDate + ", tripDate=" + tripDate + ", hit=" + hit + ", likes="
				+ likes + ", publics=" + publics + ", lat=" + lat + ", lng=" + lng + ", url=" + url + ", dtos=" + dtos
				+ "]";
	}

}
