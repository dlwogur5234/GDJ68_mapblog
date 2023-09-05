package com.gdj68.mapblog.feed;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj68.mapblog.feed.FeedCommentLikesDTO;
import com.gdj68.mapblog.file.FileDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.Pager;

@Repository
public class FeedDAO {

	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE = "com.gdj68.mapblog.feed.FeedDAO.";

	/* -------------------------------------------------------------- */

	// 리스트
	public List<FeedDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}
	
	public List<FeedDTO> getList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList2", memberDTO);
	}
	
	public FeedDTO getUrl(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getUrl", feedDTO);
	}
	
	public MemberDTO getUser(FeedDTO feedDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getUser", feedDTO);
	}
	

	// 글 작성
	public int setAdd(FeedDTO feedDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAdd", feedDTO);
	}

	// 글 디테일
	public FeedDTO getDetail(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getDetail", feedDTO);
	}

	// 글 삭제
	public int setDelete(FeedDTO feedDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDelete", feedDTO);
	}

	// 글 수정
	public int setUpdate(FeedDTO feedDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setUpdate", feedDTO);
	}

	// getTotal
	public Long getTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotal", pager);
	}

	/* -------- FILE -------- */
	
	// 파일 리스트
	public List<FeedFileDTO> getFileList(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFileList", feedDTO);
	}

	// 파일 추가
	public int setFileAdd(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setFileAdd", feedFileDTO);
	}

	// 파일 디테일
	public FeedFileDTO getFileDetail(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFileDetail", feedFileDTO);
	}

	// 글 수정 시 파일 삭제
	public int setFileDelete(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setFileDelete", feedFileDTO);
	}

	/* -------- 조회수 -------- */

	// 조회수 추가
	public int setHitUpdate(FeedDTO feedDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setHitUpdate", feedDTO);
	}

	/* -------- 좋아요 -------- */

	// 좋아요 눌렀는지 확인
	public Long getFindLikes(LikesDTO likesDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFindLikes", likesDTO);
	}
	
	// 좋아요 체크
	public int checkLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "checkLikes", likesDto);
	}

	// 좋아요 등록
	public int addLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.insert(NAMESPACE + "addLikes", likesDto);
	}

	// 좋아요 카운트
	public int countLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "countLikes", likesDto);
	}

	// 좋아요 삭제
	public int deleteLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.delete(NAMESPACE + "deleteLikes", likesDto);
	}
	
	// 좋아요 게시글 리스트
	public List<FeedDTO> getLikesList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getLikesList", pager);
	}
	
	// 좋아요 게시글 카운트
	public Long getLikesCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getLikesCount", pager);
	}
	
		
	/* -------- 댓글 -------- */
	
	// 코멘트 목록
	public List<FeedCommentDTO> getCommentList(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getCommentList", feedCommentDTO);
	}

	// 코멘트 추가
	public int setAddComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAddComment", feedCommentDTO);
	}
	
	// 코멘트 삭제
	public int setDeleteComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDeleteComment", feedCommentDTO);
	}
	
	// 코멘트 수정
	public int setUpdateComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setUpdateComment", feedCommentDTO);
	}


		
	
	/* -------- 댓글 좋아요 -------- */
	
//	// 좋아요 눌렀는지 확인
//	public Long getFindCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) throws Exception {
//		return sqlSession.selectOne(NAMESPACE + "getFindLikes", feedCommentLikesDTO);
//	}
//	
//	// 좋아요 체크
//	public int checkCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) {
//		return sqlSession.selectOne(NAMESPACE + "checkLikes", feedCommentLikesDTO);
//	}
//
//	// 좋아요 등록
//	public int addCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) {
//		return sqlSession.insert(NAMESPACE + "addLikes", feedCommentLikesDTO);
//	}
//
//	// 좋아요 카운트
//	public int countCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) {
//		return sqlSession.selectOne(NAMESPACE + "countLikes", feedCommentLikesDTO);
//	}
//
//	// 좋아요 삭제
//	public int deleteCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) {
//		return sqlSession.delete(NAMESPACE + "deleteLikes", feedCommentLikesDTO);
//	}
	
	
	
	// ---------------------------------------------------------------------------------------
	
	


}



