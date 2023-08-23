package com.gdj68.mapblog.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminUserService {
	
	@Autowired
	private AdminUserDAO adminUserDAO;
	
	//list
	public List<AdminUserDTO> getUserList()throws Exception{
		

		return adminUserDAO.getUserList();
	}
	

	//detail
	public AdminUserDTO getUserDetail(AdminUserDTO adminUserDTO)throws Exception{
		return adminUserDAO.getUserDetail(adminUserDTO);
	}

}
