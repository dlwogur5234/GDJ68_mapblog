package com.gdj68.mapblog.follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {
	@Autowired
	private FollowDAO followDAO;
	
	public List<FollowDTO> followList(FollowDTO followDTO) throws Exception{
		return followDAO.followList(followDTO);
	}
}
