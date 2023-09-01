package com.gdj68.mapblog.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.admin.user.AdminUserDTO;
import com.gdj68.mapblog.util.Pager;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	//login
	public AdminMemberDTO getAdminLogin(AdminMemberDTO adminMemberDTO)throws Exception{
		
		return adminMemberDAO.getAdminLogin(adminMemberDTO);
	}
	
	//join
	public int setAdminJoin(AdminMemberDTO adminMemberDTO)throws Exception{
		
		return adminMemberDAO.setAdminJoin(adminMemberDTO);
	}
	
	//list
	public List<AdminMemberDTO> getAdminMemberList(Pager pager)throws Exception{
		pager.makeRowNum();
		Long total = adminMemberDAO.getAdminMemberTotal(pager);
		pager.makePageNum(total);

		return adminMemberDAO.getAdminMemberList(pager);
	}
	
	//detail
	public AdminMemberDTO getAdminMemberDetail(AdminMemberDTO adminMemberDTO)throws Exception{
		return adminMemberDAO.getAdminMemberDetail(adminMemberDTO);
	}
		
	//delete
	public int setAdminDelete(AdminMemberDTO adminMemberDTO)throws Exception{
		return adminMemberDAO.setAdminDelete(adminMemberDTO);
	}
	
	//update
	public int setAdminUpdate(AdminMemberDTO adminMemberDTO)throws Exception{
		return adminMemberDAO.setAdminUpdate(adminMemberDTO);
	}
	
	
}
