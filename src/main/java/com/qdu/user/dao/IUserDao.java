package com.qdu.user.dao;

import org.apache.ibatis.annotations.Param;

import com.qdu.user.bean.UserBean;

public interface IUserDao {

	UserBean checkLogin(@Param("account")String account, @Param("password")String password);

}
