package com.ssafy.happyhouse.model.dto;

public class MemberDto {
	private int unum;
	private String userid;
	private String userpwd;
	private String username;
	private String address;
	private String phone;
	
	public MemberDto(int unum, String userid, String userpwd, String username, String address, String phone) {
		super();
		this.unum = unum;
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.address = address;
		this.phone = phone;
	}
	
	public MemberDto(String userid, String userpwd, String username, String address, String phone) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.address = address;
		this.phone = phone;
	}

	public MemberDto() {
		super();
	}
	
	
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "MemberDto [unum=" + unum + ", userid=" + userid + ", userpwd=" + userpwd + ", username=" + username
				+ ", address=" + address + ", phone=" + phone + "]";
	}
	
	
}
