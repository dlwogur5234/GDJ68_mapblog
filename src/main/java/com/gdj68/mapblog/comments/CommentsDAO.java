package com.gdj68.mapblog.comments;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.gdj68.mapblog.comments.CommentsDAO.";
	
}
