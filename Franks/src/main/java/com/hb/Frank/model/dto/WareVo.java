package com.hb.Frank.model.dto;

//물품 
public class WareVo {

 // 물건번호 
 private Integer wnum;

 // 물건이름 
 private String wname;

 // 물건타입 
 private String wtype;

 public Integer getWnum() {
     return wnum;
 }

 public void setWnum(Integer wnum) {
     this.wnum = wnum;
 }

 public String getWname() {
     return wname;
 }

 public void setWname(String wname) {
     this.wname = wname;
 }

 public String getWtype() {
     return wtype;
 }

 public void setWtype(String wtype) {
     this.wtype = wtype;
 }

 // Ware 모델 복사
 public void CopyData(WareVo param)
 {
     this.wnum = param.getWnum();
     this.wname = param.getWname();
     this.wtype = param.getWtype();
 }
}