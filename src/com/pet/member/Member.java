package com.pet.member;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private int num, penalty;
	private String userId, userName ,pwd;
	private String phone;
	private String birth, email, profile, created;
	
	private String themeprofile;
	
	private MultipartFile themeUpload;
	
	public MultipartFile getThemeUpload() {
		return themeUpload;
	}

	public void setThemeUpload(MultipartFile themeUpload) {
		this.themeUpload = themeUpload;
	}

	private MultipartFile upload;
	
	
	public String getThemeprofile() {
		return themeprofile;
	}

	public void setThemeprofile(String themeprofile) {
		this.themeprofile = themeprofile;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPenalty() {
		return penalty;
	}

	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
	
	
}
