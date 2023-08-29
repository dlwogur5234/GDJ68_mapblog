package com.gdj68.mapblog.feed;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	// 파일 추가
	public int setFileAdd(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setFileAdd", feedFileDTO);
	}

	// 파일 디테일
	public FeedFileDTO getFileDetail(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFileDetail", feedFileDTO);
	}

	// 파일 삭제
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
	public int checkLikes(LikesDTO likesDto) {
		return sqlSession.selectOne(NAMESPACE + "checkLikes", likesDto);
	}

	// 좋아요 등록
	public int addLikes(LikesDTO likesDto) {
		return sqlSession.insert(NAMESPACE + "addLikes", likesDto);
	}

	// 좋아요 카운트
	public int countLikes(LikesDTO likesDto) {
		return sqlSession.selectOne(NAMESPACE + "countLikes", likesDto);
	}

	// 좋아요 삭제
	public int deleteLikes(LikesDTO likesDto) {
		return sqlSession.delete(NAMESPACE + "deleteLikes", likesDto);
	}
}
