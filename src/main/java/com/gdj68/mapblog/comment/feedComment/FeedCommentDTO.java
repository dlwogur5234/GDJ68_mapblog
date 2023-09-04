package com.gdj68.mapblog.comment.feedComment;

import java.sql.Date;

import com.gdj68.mapblog.comment.CommentDTO;

public class FeedCommentDTO {


	private Long commentNum;	// 댓글 번호
	private Long feedNum;		// 게시글 번호
	private String id;			// 아이디
	private String contents;	// 댓글 내용
	private String commentDate;	// 댓글 작성일
	private Long likes;			// 댓글 좋아요
	private Long cGroup;		// 그룹(REF)
	private Long cDepth;		// 같은 그룹 내의 순서
	private Integer cStep;		// (들여쓰기) 모댓글0 / 답글1
	private String nickName;	// 닉네임
	
	
	
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
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
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
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
	public Integer getcStep() {
		return cStep;
	}
	public void setcStep(Integer cStep) {
		this.cStep = cStep;
	}

	
	
}

