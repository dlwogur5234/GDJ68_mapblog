package com.gdj68.mapblog.qna;

import java.sql.Date;
import java.util.List;

import com.gdj68.mapblog.util.Pager;

public class QnaDTO{
	

	private String memberId;
	private String qnaTitle;
	private String qnaContents;
	private Date qnaDate;
	private List<QnaFileDTO> fileDTOs;
	private Long qnaNum;
	private int privateContents;
	
	public int getPrivateContents() {
		return privateContents;
	}
	public void setPrivateContents(int privateContents) {
		this.privateContents = privateContents;
	}
	public Long getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(Long qnaNum) {
		this.qnaNum = qnaNum;
	}
	public List<QnaFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<QnaFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	
	
}
