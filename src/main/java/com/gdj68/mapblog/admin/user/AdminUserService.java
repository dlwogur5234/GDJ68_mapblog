package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.FileManager;
import com.gdj68.mapblog.util.Pager;

@Service
public class AdminUserService {
	
	@Autowired
	private AdminUserDAO adminUserDAO;
	
	@Autowired
	private FileManager fileManager;
	
	//list
	public List<MemberDTO> getUserList(Pager pager)throws Exception{
		pager.makeRowNum();
		Long total = adminUserDAO.getUserTotal(pager);
		pager.makePageNum(total);

		return adminUserDAO.getUserList(pager);
	}
	
	//detail
	public MemberDTO getUserDetail(MemberDTO memberDTO)throws Exception{
		return adminUserDAO.getUserDetail(memberDTO);
	}
	
	//update 비밀번호초기화
	public int setMemberUpdate(MemberDTO memberDTO)throws Exception {
		return adminUserDAO.setMemberUpdate(memberDTO);
	}
	
	

}
