package com.gdj68.mapblog.admin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	//로그인
	public AdminMemberDTO getAdminLogin(AdminMemberDTO adminMemberDTO)throws Exception{
		return adminMemberDAO.getAdminLogin(adminMemberDTO);
	}
	
}
