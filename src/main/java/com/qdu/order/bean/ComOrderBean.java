package com.qdu.order.bean;

public class ComOrderBean {

	private Integer id;
	private String  orderNum;
	private String comCode;
	private Integer comNum;
	private double total_prices;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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
	public double getTotal_prices() {
		return total_prices;
	}
	public void setTotal_prices(double total_prices) {
		this.total_prices = total_prices;
	}
	@Override
	public String toString() {
		return "ComOrderBean [id=" + id + ", orderNum=" + orderNum + ", comCode=" + comCode + ", comNum=" + comNum
				+ ", total_prices=" + total_prices + "]";
	}
	
	
}
