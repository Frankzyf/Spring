package com.qdu.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.order.bean.ComOrderBean;
import com.qdu.order.bean.Layui;
import com.qdu.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
        @Autowired
        
        OrderService orderService;
        
	   //增加
		@RequestMapping("/insert")
		@ResponseBody
		public void insertOrder(ComOrderBean comOrder) {
			orderService.insert(comOrder);
		}
		
		//删除
		@RequestMapping("/delete")
		@ResponseBody
		public void deleteOrder(String orderNum) {
			orderService.delecteRole(orderNum);
			System.out.println("删除："+orderNum);
		}
		
		//修改
		@RequestMapping("/update")
		@ResponseBody
		public void update(ComOrderBean comOrder) {
			System.out.println("comOrder"+comOrder);
			orderService.update(comOrder);
		}
		
		//查找
		@RequestMapping(value="/select")
		@ResponseBody
		public Layui selectOrder(@RequestParam("page")int page,@RequestParam("limit")int limit,String orderNum,String comCode) {
			ComOrderBean order = new ComOrderBean();
			order.setOrderNum(orderNum);
			order.setComCode(comCode);
			
			int before = limit * (page-1);
			int after = page * limit;

			List<ComOrderBean> eilist = orderService.selectAll(order,before,after);
			int count = orderService.count();
			return Layui.data(count, eilist);
		}
		
		//按照编号查找
		@RequestMapping("/selectByCode")
		@ResponseBody
		public ComOrderBean selectByCode(String orderNum) {
			ComOrderBean cb = orderService.selectByCode(orderNum);
			return cb;
		}
		
}
