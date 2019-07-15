package com.qdu.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.coms.bean.ComImgBean;
import com.qdu.coms.bean.Msg;
import com.qdu.coms.service.ComImgService;
import com.qdu.order.bean.CartsBean;
import com.qdu.order.bean.OrderInfoBean;
import com.qdu.order.service.CartsService;
import com.qdu.user.bean.UserBean;
import com.qdu.user.service.UserService;

@Controller
@RequestMapping("/carts")
public class CartsController {
	
	@Autowired
	ComImgService comImgService;
	@Autowired
	CartsService cartsService;
	@Autowired  
	UserService userService;

	@RequestMapping("/into")
	@ResponseBody
	public Msg Carts(HttpSession session){

		UserBean user = (UserBean) session.getAttribute("user");
		String account = user.getAccount();
		System.out.println("account:"+account);
		List<CartsBean> carts =cartsService.selectComByAccount(account);
		List<String> comCode = new ArrayList<String>();
		for(CartsBean list:carts) {
			comCode.add(list.getComCode());
			
		}
		List<ComImgBean> img = comImgService.selectImgByCodeAndType(comCode);	
		return Msg.success().add("carts",carts).add("img",img);
	}
	
	@RequestMapping("/intoCarts")
	public String intoCarts(HttpSession session) {
		UserBean user = (UserBean)session.getAttribute("user");
		String bb ="";
		if(user==null) {
           return "login";
		}
	
		UserBean user2 = userService.checkLogin(user.getAccount(), user.getPsssword());
		if(user.getAccount().equals(user2.getAccount())&&user.getPsssword().equals(user2.getPsssword())) {
			bb="carts";
		}
		return bb;	
	}
	
	//更新购物车商品数量
	@RequestMapping("/upcarts")
	@ResponseBody
	public Msg upCarts(@RequestParam("comNum")Integer comNum,@RequestParam("comCode")String comCode) {
		cartsService.updateCarts(comNum,comCode);		
		return Msg.success();
		
	}
	
	//商品订单
	@RequestMapping(value="/order/{comCode}")
	public String order(Model model,@PathVariable("comCode")String comCode) {
		String[] sl = comCode.split(",");
		List<String> comCodes = new ArrayList<String>();
		for(String aa:sl) {
			comCodes.add(aa);
		}
       List<CartsBean> list = cartsService.selectComByComCode(comCodes);
       List<ComImgBean> img = comImgService.selectImgByCodeAndType(comCodes);
       model.addAttribute("img",img);
       model.addAttribute("list",list);
		return "order";
	}
	//插入商品订单表，订单信息表，保存地址
	@RequestMapping("/insertOrder/{comCode}")
	@ResponseBody
	public Msg insertOrder(@PathVariable("comCode")String comCode) {
		String[] list = comCode.split(",");
		List<String> comCodes = new ArrayList<String>();
		for(String ss:list) {
			comCodes.add(ss);
		}
		System.out.println(comCodes);
		
	//模拟用户已登录
	UserBean user = new UserBean();
	user.setAccount("abc");
		//1.将商品信息添加到订单商品表。
		cartsService.insertComOrder(comCodes);
        //2.将商品信息添加到订单商品表。
		cartsService.insertOrderInfo(comCodes,user);
		//3.删除购物车中，对并编号的物品。
        cartsService.deleteFromCarts(comCodes);
		return Msg.success();
	}
	
	
	
	@RequestMapping("/orderInfo")
	@ResponseBody
	public Msg orderInfo(Model model) {
		List<OrderInfoBean> info =cartsService.selectAllComInfo();
		return Msg.success().add("info",info);
	}
	
	@RequestMapping("/orderInfo2")
	public String orderInfo() {
		return "orderM";
	}
	
	/**
	 * 将商品添加到购物车
	 * @param comCode
	 */
	@RequestMapping("/join")
	@ResponseBody
	public void joinCarts(String comCode,String unitPrice,String comName ,HttpSession session) {
		double uu = Double.parseDouble(unitPrice);
        CartsBean car = new CartsBean();
        car.setComCode(comCode);
        car.setTotalPrice(uu);
        car.setComName(comName);
        car.setComNum(1);
        UserBean user = (UserBean) session.getAttribute("user");
        car.setAccount(user.getAccount());
        System.out.println("car:"+car);
        cartsService.insert(car);
        
	}
}
