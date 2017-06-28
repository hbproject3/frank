package com.hb.Frank.model.dto;

import java.sql.Date;

//재고 
public class StockVo {

 // 가맹점번호 
 private Integer fnum;

 // 물건번호 
 private Integer wnum;

 // 현재수량 
 private Integer nowstock;

 // 입고수량 
 private Integer instock;

 // 출고수량 
 private Integer outstock;

 // 업데이트 날짜 
 private Date udate;

 public Integer getFnum() {
     return fnum;
 }

 public void setFnum(Integer fnum) {
     this.fnum = fnum;
 }

 public Integer getWnum() {
     return wnum;
 }

 public void setWnum(Integer wnum) {
     this.wnum = wnum;
 }

 public Integer getNowstock() {
     return nowstock;
 }

 public void setNowstock(Integer nowstock) {
     this.nowstock = nowstock;
 }

 public Integer getInstock() {
     return instock;
 }

 public void setInstock(Integer instock) {
     this.instock = instock;
 }

 public Integer getOutstock() {
     return outstock;
 }

 public void setOutstock(Integer outstock) {
     this.outstock = outstock;
 }

 public Date getUdate() {
     return udate;
 }

 public void setUdate(Date udate) {
     this.udate = udate;
 }

 // Stock 모델 복사
 public void CopyData(StockVo param)
 {
     this.fnum = param.getFnum();
     this.wnum = param.getWnum();
     this.nowstock = param.getNowstock();
     this.instock = param.getInstock();
     this.outstock = param.getOutstock();
     this.udate = param.getUdate();
 }
}