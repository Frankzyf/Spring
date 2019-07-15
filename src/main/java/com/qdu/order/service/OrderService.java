package com.qdu.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qdu.order.bean.ComOrderBean;
import com.qdu.order.dao.OrderMapper;

@Service
public class OrderService {

	@Autowired
	OrderMapper orderMapper;
	
	public void insert(ComOrderBean comOrder) {
		orderMapper.insert(comOrder);
	}

	public void delecteRole(String orderNum) {
		
		orderMapper.deleteByCode(orderNum);
	}

	public void update(ComOrderBean comOrder) {
		orderMapper.updateOrder(comOrder);
	}

	public List<ComOrderBean> selectAll(@Param("order")ComOrderBean order,@Param("before")int before, @Param("after")int after) {
		
		return orderMapper.selectAllss(order, before, after);
	}

	public int count() {
		
		return orderMapper.count();
	}

	public ComOrderBean selectByCode(String orderNum) {
		
		return orderMapper.selectByCode(orderNum);
	}

}
