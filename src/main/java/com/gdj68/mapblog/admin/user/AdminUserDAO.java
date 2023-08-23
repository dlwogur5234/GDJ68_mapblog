package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminUserDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.gdj68.mapblog.admin.user.AdminUserDAO.";
	
	
	//total
	public Long getUserTotal()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getUserTotal");
	}
	
	//list
	public List<AdminUserDTO> getUserList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getUserList");
	}
	
	//detail
	public AdminUserDTO getUserDetail(AdminUserDTO adminUserDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getUserDetail", adminUserDTO);
	}
	
}
