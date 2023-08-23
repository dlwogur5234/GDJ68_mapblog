package com.gdj68.mapblog.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.gdj68.mapblog.member.MemberDAO.";
	
	public int setJoin(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setJoin", memberDTO);
	}

	public MemberDTO getLogin(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberDTO);
	}

	public int setMemberUpdate(MemberDTO memberDTO) {
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}

	public int deleteMember(MemberDTO memberDTO) {
		return sqlSession.delete(NAMESPACE+"deleteMember", memberDTO);
	}

	public MemberDTO getIdCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getIdCheck", memberDTO);
	}

	public MemberDTO getUrlCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getUrlCheck", memberDTO);
	}
	
}
