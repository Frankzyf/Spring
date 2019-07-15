package com.qdu.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.coms.bean.Msg;
import com.qdu.user.bean.UserBean;
import com.qdu.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
    
	@Autowired
	UserService userService;
	//用户注册
	/**
	 * 跳转到用户注册页面
	 * @return
	 */
	@RequestMapping("/register")
	public String register() {
		
		return "register";
	}
	
	
	/**
	 * 用户注册
	 * @return
	 */
	@RequestMapping("/userReg")
	public String UserResister() {
		
		return "success";
	}
	
	//用户登录
	@RequestMapping("/userLogin")
	public String UserLogin(@RequestParam("account")String account,@RequestParam("password")String password,HttpSession session) {
		UserBean user = userService.checkLogin(account,password);
		session.setAttribute("user",user);
		int ad = user.getAdmin();
		System.out.println(user);
		System.out.println(ad);
		String aa = "";
		if(ad==1) {
			aa = "index";
		}
		if(ad==2) {
			aa = "all";
		}
		return aa;
	}
	
}
