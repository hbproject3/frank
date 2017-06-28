package com.hb.Frank.model.dto;

//가맹점 
public class FranchiseVo {

 // 가맹점번호 
 private Integer fnum;

 // 가맹점이름 
 private String fname;

 // 가맹점전화번호 
 private String fphone;

 // 가맹점주소 
 private String faddress;

 public Integer getFnum() {
     return fnum;
 }

 public void setFnum(Integer fnum) {
     this.fnum = fnum;
 }

 public String getFname() {
     return fname;
 }

 public void setFname(String fname) {
     this.fname = fname;
 }

 public String getFphone() {
     return fphone;
 }

 public void setFphone(String fphone) {
     this.fphone = fphone;
 }

 public String getFaddress() {
     return faddress;
 }

 public void setFaddress(String faddress) {
     this.faddress = faddress;
 }

 // Franchise 모델 복사
 public void CopyData(FranchiseVo param)
 {
     this.fnum = param.getFnum();
     this.fname = param.getFname();
     this.fphone = param.getFphone();
     this.faddress = param.getFaddress();
 }
}