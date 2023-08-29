package com.gdj68.mapblog.qna.memberQna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj68.mapblog.qna.QnaDTO;
import com.gdj68.mapblog.util.Pager;
@Repository
public class MyQnaListDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.gdj68.mapblog.qna.memberQna.MyQnaListDAO.";
	//내가 쓴 qna만 보기
	public List<QnaDTO> getMyQnaList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMyQnaList", map);
	}
	
	public Long getTotal(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotal");
	}
}
