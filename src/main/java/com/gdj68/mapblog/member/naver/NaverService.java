package com.gdj68.mapblog.member.naver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.member.MemberDTO;

@Service
public class NaverService {
	
	@Autowired
	private NaverDAO naverDAO;

	public MemberDTO getEmailCheck(MemberDTO memberDTO) {
		return naverDAO.getEmailCheck(memberDTO);
	}
	
	
}
