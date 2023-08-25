package com.gdj68.mapblog.member.naver;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj68.mapblog.member.MemberDTO;

@Repository
public class NaverDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.gdj68.mapblog.member.naver.NaverDAO.";

	public MemberDTO getEmailCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getEmailCheck", memberDTO);
	}

}
