package com.qdu.order.bean;

public class OrderInfoBean {

	private Integer id;
	private String orderNum;
	private String  account;
	private String  time;
	private String deliveryAddr;
	private String status;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String  getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String  orderNum) {
		this.orderNum = orderNum;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDeliveryAddr() {
		return deliveryAddr;
	}
	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "OrderInfoBean [id=" + id + ", orderNum=" + orderNum + ", account=" + account + ", time=" + time
				+ ", deliveryAddr=" + deliveryAddr + ", status=" + status + "]";
	}
	
	
}
