package com.qdu.user.bean;

public class UserBean {
    private int id;
    private String account;
    private String password;
    private String username;
    private String gender;
    private int admin;
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPsssword() {
		return password;
	}
	public void setPsssword(String psssword) {
		this.password = psssword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	
	@Override
	public String toString() {
		return "UserBean [id=" + id + ", account=" + account + ", psssword=" + password + ", username=" + username
				+ ", gender=" + gender + ", admin=" + admin + "]";
	}
    
    
    
    
}
