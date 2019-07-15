package com.qdu.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
   
	@RequestMapping("/")
	public String pageIndex() {
		return "index";
	} 
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/manage")
	public String menge() {
		
		return "manage";
	}
	@RequestMapping("/orderM")
	public String orderM() {
		
		return "orderM";
	}
}
