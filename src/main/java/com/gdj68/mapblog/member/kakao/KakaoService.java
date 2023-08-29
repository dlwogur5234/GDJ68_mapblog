package com.gdj68.mapblog.member.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.member.MemberDTO;

@Service
public class KakaoService {
	
	@Autowired
	private KakaoDAO kakaoDAO;

	public MemberDTO getEmailCheck(MemberDTO memberDTO) {
		return kakaoDAO.getEmailCheck(memberDTO);
	}
	
}
