package com.gdj68.mapblog.admin.banner;

import java.util.List;

public class AdminBannerDTO {

	private Long bannerNum;
	private String mainTitle;
	private String subTitle;
	private List<AdminBannerFileDTO> fileDTO;
	
	public Long getBannerNum() {
		return bannerNum;
	}
	public void setBannerNum(Long bannerNum) {
		this.bannerNum = bannerNum;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public List<AdminBannerFileDTO> getFileDTO() {
		return fileDTO;
	}
	public void setFileDTO(List<AdminBannerFileDTO> fileDTO) {
		this.fileDTO = fileDTO;
	}
	
	
	
	
	
}
