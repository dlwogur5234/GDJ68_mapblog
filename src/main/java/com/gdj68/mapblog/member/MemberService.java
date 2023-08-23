package com.gdj68.mapblog.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public int setJoin(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.setJoin(memberDTO);
		return result;
	}

	public MemberDTO getLogin(MemberDTO memberDTO) {
		return memberDAO.getLogin(memberDTO);
	}

	public int setMemberUpdate(MemberDTO memberDTO) {
		return memberDAO.setMemberUpdate(memberDTO);
	}

	public int deleteMember(MemberDTO memberDTO) {
		return memberDAO.deleteMember(memberDTO); 
	}

	public MemberDTO getIdCheck(MemberDTO memberDTO) {
		return memberDAO.getIdCheck(memberDTO);
	}

	public MemberDTO getUrlCheck(MemberDTO memberDTO) {
		return memberDAO.getUrlCheck(memberDTO);
	}
	

	
}
