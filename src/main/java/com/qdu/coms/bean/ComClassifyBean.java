package com.qdu.coms.bean;

import java.util.List;

public class ComClassifyBean {

	private int id;
	private String code;
	private String name;
	private String descr;
	private String parentCode;
	
	private List<ComClassifyBean> comClassify;
	
	
	
	
	public List<ComClassifyBean> getComClassify() {
		return comClassify;
	}
	public void setComClassify(List<ComClassifyBean> comClassify) {
		this.comClassify = comClassify;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	
	
}
