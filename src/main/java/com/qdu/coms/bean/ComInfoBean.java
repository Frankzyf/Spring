package com.qdu.coms.bean;

public class ComInfoBean {
    private Integer id;
    private String comCode;
    private String comName;
    private Double unitPrice;
    private String comDescr;
    private Integer stock;
    private String type;
    private String goodsCode;
    
    private ComImgBean comImg;
    private ComClassifyBean comClassify;
    
    
    
    
	public ComImgBean getComImg() {
		return comImg;
	}
	public void setComImg(ComImgBean comImg) {
		this.comImg = comImg;
	}
	
	public ComClassifyBean getComClassify() {
		return comClassify;
	}
	public void setComClassify(ComClassifyBean comClassify) {
		this.comClassify = comClassify;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getComDescr() {
		return comDescr;
	}
	public void setComDescr(String comDescr) {
		this.comDescr = comDescr;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	@Override
	public String toString() {
		return "ComInfoBean [id=" + id + ", comCode=" + comCode + ", comName=" + comName + ", unitPrice=" + unitPrice
				+ ", comDescr=" + comDescr + ", stock=" + stock + ", type=" + type + ", goodsCode=" + goodsCode
				+ ", comClassify=" + comClassify + "]";
	}
    
    
}
