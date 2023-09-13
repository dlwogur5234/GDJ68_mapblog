package com.gdj68.mapblog.admin.banner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.util.FileManager;

@Service
public class AdminBannerService {
	
	@Autowired
	private AdminBannerDAO adminBannerDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public List<AdminBannerDTO> getList()throws Exception{
		return adminBannerDAO.getList();
	}
	
	public int setAdd(AdminBannerDTO adminBannerDTO)throws Exception{
		return adminBannerDAO.setAdd(adminBannerDTO);
	}
	
	public int setDelete(AdminBannerDTO adminBannerDTO)throws Exception{
		return adminBannerDAO.setDelete(adminBannerDTO);
	}
	
	public int setUpdate(AdminBannerDTO adminBannerDTO)throws Exception{
		return adminBannerDAO.setUpdate(adminBannerDTO);
	}
	
	public AdminBannerDTO getSelect(AdminBannerDTO adminBannerDTO)throws Exception{
		return adminBannerDAO.getSelect(adminBannerDTO);
	}
	
}
