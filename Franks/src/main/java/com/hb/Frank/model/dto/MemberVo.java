package com.hb.Frank.model.dto;

import javax.validation.constraints.NotNull;

//회원테이블 
public class MemberVo {
	
	public MemberVo(Integer unum, String uname, String fid, String upw, Integer utype, Integer fnum, String phone,
			String email) {
		super();
		this.unum = unum;
		this.uname = uname;
		this.fid = fid;
		this.upw = upw;
		this.utype = utype;
		this.fnum = fnum;
		this.phone = phone;
		this.email = email;
	}

	// 유저번호
	private Integer unum;

	// 유저이름
	private String uname;

	// 유저아이디
	@NotNull
	private String fid;

	// 유저비밀번호
	private String upw;

	// 유저타입
	private Integer utype;

	// 가맹점번호
	private Integer fnum;
	
	// 연락처
	private String phone;
	
	// 이메일
	private String email;
	
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}

	public Integer getUnum() {
		return unum;
	}

	public void setUnum(Integer unum) {
		this.unum = unum;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public Integer getUtype() {
		return utype;
	}

	public void setUtype(Integer utype) {
		this.utype = utype;
	}

	public Integer getFnum() {
		return fnum;
	}

	public void setFnum(Integer fnum) {
		this.fnum = fnum;
	}

	// Member 모델 복사
	public void CopyData(MemberVo param) {
		this.unum = param.getUnum();
		this.uname = param.getUname();
		this.fid = param.getFid();
		this.upw = param.getUpw();
		this.utype = param.getUtype();
		this.fnum = param.getFnum();
	}

	public MemberVo(Integer unum, String uname, String fid, String upw, Integer utype, Integer fnum) {
		super();
		this.unum = unum;
		this.uname = uname;
		this.fid = fid;
		this.upw = upw;
		this.utype = utype;
		this.fnum = fnum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberVo [unum=" + unum + ", uname=" + uname + ", fid=" + fid + ", upw=" + upw + ", utype=" + utype
				+ ", fnum=" + fnum + ", phone=" + phone + ", email=" + email + "]";
	}
	

	
}