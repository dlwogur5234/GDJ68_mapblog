package com.gdj68.mapblog.member;

import java.util.Date;
import java.util.List;



public class MemberDTO {
	
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String email;
	private String phone;
	private String birth;
	private String url;
	private int publics;
	private String createDate;
	private List<MemberFileDTO> fileDTOs;
	
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getBirth() {
		return birth;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public int getPublics() {
		return publics;
	}

	public void setPublics(int publics) {
		this.publics = publics;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", nickName=" + nickName + ", email=" + email
				+ ", phone=" + phone + ", birth=" + birth + ", url=" + url + "]";
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public List<MemberFileDTO> getFileDTOs() {
		return fileDTOs;
	}

	public void setFileDTOs(List<MemberFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	
	
}
