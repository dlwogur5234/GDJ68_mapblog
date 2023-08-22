package com.gdj68.mapblog.admin.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.gdj68.mapblog.admin.member.AdminMemberDAO.";
	
	public int setAdminJoin(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdminJoin", adminMemberDTO);
	}
	
	public AdminMemberDTO getAdminLogin(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAdminLogin", adminMemberDTO);
	}
}
