package com.gdj68.mapblog.follow;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDAO {
	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE="com.gdj68.mapblog.follow.FollowDAO.";
	
	public List<FollowDTO> selectFollowList(FollowDTO followDTO) throws Exception{
		return session.selectList(NAMESPACE+"selectFollowList", followDTO);
	}
	public long selectfFollowTotal(FollowDTO followDTO) throws Exception{
		return session.selectOne(NAMESPACE+"selectFollowTotal", followDTO);
	}
	public long selectFollowerTotal(FollowDTO followDTO) throws Exception{
		return session.selectOne(NAMESPACE+"selectFollowerTotal", followDTO);
	}
	public List<FollowDTO> selectFollowerList(FollowDTO followDTO) throws Exception{
		return session.selectList(NAMESPACE+"selectFollowerList", followDTO);
	}
	public int insertFollowAdd(FollowDTO followDTO) throws Exception{
		return session.insert(NAMESPACE+"insertFollowAdd", followDTO);
	}
	public int deleteFollow(FollowDTO followDTO) throws Exception {
		return session.delete(NAMESPACE+"deleteFollow", followDTO);
	}
}
