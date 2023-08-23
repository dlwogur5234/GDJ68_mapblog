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
	
	private final String NAMESPACE="com.gdj68.mapblog.feed.FeedDAO.";
	
	
	/* -------------------------------------------------------------- */
	
	
	// getList
	public List<FeedDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}
	
	// getTotal
	public Long getTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotal", pager);
	}
	
	// setAdd
	public int setAdd(FeedDTO feedDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAdd", feedDTO);
	}
	
	// setFileAdd
	public int setFileAdd(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setFileAdd", feedFileDTO);
	}
	
}
