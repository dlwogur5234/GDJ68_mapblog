package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.Pager;

@Repository
public class AdminUserDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.gdj68.mapblog.admin.user.AdminUserDAO.";
	
	
	//total
	public Long getUserTotal(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getUserTotal", pager);
	}
	
	//list
	public List<MemberDTO> getUserList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getUserList", pager);
	}
	
	//detail
	public MemberDTO getUserDetail(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getUserDetail", memberDTO);
	}
	
	//update 비밀번호초기화
	public int setMemberUpdate(MemberDTO memberDTO) {
		return sqlSession.update(NAMESPACE+"setUserUpdate", memberDTO);
	}
}
