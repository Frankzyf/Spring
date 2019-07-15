package com.qdu.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qdu.order.bean.CartsBean;
import com.qdu.order.bean.ComOrderBean;
import com.qdu.order.bean.OrderInfoBean;

public interface ICartsDao {

	List<CartsBean> selectComByAccount(String account);

	void updateCarts(@Param("comNum")Integer comNum ,@Param("comCode")String comCode);

	List<CartsBean> selectComByComCode(@Param("comCodes")List<String> comCodes);

	void insertComOrder(@Param("coms")List<ComOrderBean> coms);

	List<ComOrderBean> selectOrderNumByComCode(@Param("comCodes")List<String> comCodes);

	void insertOrderInfo(@Param("orderInfo")List<OrderInfoBean> orderInfo);

	void deleteCartsByCode(@Param("comCodes")List<String> comCodes);

	List<OrderInfoBean> selectAllComInfo();

	void insert(CartsBean car);

}
