package com.qdu.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qdu.user.bean.UserBean;
import com.qdu.user.dao.IUserDao;

@Service
public class UserService {

	@Autowired 
	IUserDao userDao;

	public UserBean checkLogin(String account, String password) {
		UserBean user = new UserBean();
		user = userDao.checkLogin(account,password);
		return user;
	}
}
