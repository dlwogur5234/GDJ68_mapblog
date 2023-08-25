package com.gdj68.mapblog.comment.tripComment;

import com.gdj68.mapblog.comment.CommentDTO;

public class TripCommentDTO extends CommentDTO{

	private Long tripNum;

	public Long getTripNum() {
		return tripNum;
	}

	public void setTripNum(Long tripNum) {
		this.tripNum = tripNum;
	}
}
