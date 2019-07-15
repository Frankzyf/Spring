package com.qdu.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qdu.order.bean.ComOrderBean;

public interface OrderMapper {

	int count();
	
	List<ComOrderBean> selecMenu(@Param("userCode")String userCode);

	List<ComOrderBean> selectAllss(@Param("oo")ComOrderBean oo,@Param("before")int before,@Param("after") int after);

	ComOrderBean selectByCode(String orderNum);

	void insert(ComOrderBean comOrder);

	void deleteByCode(String orderNum);

	void updateOrder(ComOrderBean comOrder);
}
