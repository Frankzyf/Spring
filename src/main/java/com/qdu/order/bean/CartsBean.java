package com.qdu.order.bean;


public class CartsBean {
     private Integer id;
     private String account;
     private String comCode;
     private Integer comNum;
     private double totalPrice;
     private String comName;
     
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public Integer getComNum() {
		return comNum;
	}
	public void setComNum(Integer comNum) {
		this.comNum = comNum;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	
	@Override
	public String toString() {
		return "CartsBean [id=" + id + ", account=" + account + ", comCode=" + comCode + ", comNum=" + comNum
				+ ", totalPrice=" + totalPrice + ", comName=" + comName + "]";
	}
     
     
     
}
