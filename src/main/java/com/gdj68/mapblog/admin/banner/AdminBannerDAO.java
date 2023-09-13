package com.gdj68.mapblog.admin.banner;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminBannerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.gdj68.mapblog.admin.banner.AdminBannerDAO.";
	
	public int setFileAdd(AdminBannerFileDTO adminBannerFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setFileAdd", adminBannerFileDTO);
	}
	
	public int setAdd(AdminBannerDTO adminBannerDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdd", adminBannerDTO);
	}
	
	public int setUpdate(AdminBannerDTO adminBannerDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate", adminBannerDTO);
	}
	
	public int setDelete(AdminBannerDTO adminBannerDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", adminBannerDTO);
	}
	
	public List<AdminBannerDTO> getList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}

	public AdminBannerDTO getSelect(AdminBannerDTO adminBannerDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", adminBannerDTO);
	}
	
}
