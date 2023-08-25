package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.util.Pager;

@Service
public class AdminUserService {
	
	@Autowired
	private AdminUserDAO adminUserDAO;
	
	//list
	public List<AdminUserDTO> getUserList(Pager pager)throws Exception{
		pager.makeRowNum();
		Long total = adminUserDAO.getUserTotal(pager);
		pager.makePageNum(total);

		return adminUserDAO.getUserList(pager);
	}
	
	//detail
	public AdminUserDTO getUserDetail(AdminUserDTO adminUserDTO)throws Exception{
		return adminUserDAO.getUserDetail(adminUserDTO);
	}

}
