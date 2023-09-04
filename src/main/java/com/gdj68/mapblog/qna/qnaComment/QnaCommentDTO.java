package com.gdj68.mapblog.qna.qnaComment;

import com.gdj68.mapblog.comment.CommentDTO;

public class QnaCommentDTO extends CommentDTO{
	private Long qnaNum;
	private String adminId;

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public Long getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(Long qnaNum) {
		this.qnaNum = qnaNum;
	}
}
