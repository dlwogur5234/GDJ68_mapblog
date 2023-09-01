package com.gdj68.mapblog.admin.member;

import java.sql.Date;
import java.util.List;



public class AdminMemberDTO {
	private String adminId;
	private String adminPw;
	private String adminName;
	private String adminGrade;
	private Date adminCreateDate;
	private List<RoleDTO> roles;

	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminGrade() {
		return adminGrade;
	}
	public void setAdminGrade(String adminGrade) {
		this.adminGrade = adminGrade;
	}
	public Date getAdminCreateDate() {
		return adminCreateDate;
	}
	public void setAdminCreateDate(Date adminCreateDate) {
		this.adminCreateDate = adminCreateDate;
	}
	public List<RoleDTO> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}
	
	
	

}
