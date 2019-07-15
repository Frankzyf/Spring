package com.qdu.order.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qdu.order.bean.CartsBean;
import com.qdu.order.bean.ComOrderBean;
import com.qdu.order.bean.OrderInfoBean;
import com.qdu.order.dao.ICartsDao;
import com.qdu.user.bean.UserBean;



@Service
public class CartsService {
	
	@Autowired
	ICartsDao cartsDao;

	/**
	 * 查询购物车商品信息
	 * @param account
	 * @return
	 */
	public List<CartsBean> selectComByAccount(String account) {
		
		return cartsDao.selectComByAccount(account);
	}

	/**
	 * 更新购物车商品数量
	 * @param comCode 
	 * @param comNum 
	 */
	public void updateCarts(Integer comNum, String comCode) {
		cartsDao.updateCarts(comNum,comCode);
	}

	/**
	 * 按照商品编号从购物车批量查询商品编号
	 * @param comCodes
	 * @return
	 */
	public List<CartsBean> selectComByComCode(List<String> comCodes) {
		
		return cartsDao.selectComByComCode(comCodes);
	}

	/**
	 * 从购物车表中取出数据插入信息到订单商品表
	 * @param comCodes
	 */
	public void insertComOrder(List<String> comCodes) {
		List<ComOrderBean> coms = new ArrayList<>();
		List<CartsBean> carts = cartsDao.selectComByComCode(comCodes);
		for(CartsBean cc:carts) {
			String orderNum=UUID.randomUUID().toString();
			ComOrderBean comOrder = new ComOrderBean();
			comOrder.setComCode(cc.getComCode());
			comOrder.setComNum(cc.getComNum());
			comOrder.setOrderNum(orderNum);
			double total_prices=cc.getComNum()*cc.getTotalPrice();
			comOrder.setTotal_prices(total_prices);
			coms.add(comOrder);
		}
		
		//将coms集合存入存入到商品信息表中
		cartsDao.insertComOrder(coms);
		
	}
    /**
     * 从购物车表中取出数据插入到订单信息表中
     * @param comCodes
     * @param user 
     */
	public void insertOrderInfo(List<String> comCodes, UserBean user) {
		String account = user.getAccount();
		Format format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new Date());
		//从商品信息表中获得订单编号
		List<OrderInfoBean> orderInfo = new ArrayList<>();
		List<ComOrderBean> comOrder  = cartsDao.selectOrderNumByComCode(comCodes);
		for(ComOrderBean cc:comOrder) {
			OrderInfoBean order = new OrderInfoBean();
			order.setAccount(account);
			order.setOrderNum(cc.getOrderNum());
			order.setDeliveryAddr("山东省青岛市市南区青岛大学");
			order.setTime(time);
			order.setStatus("待确认");
			orderInfo.add(order);
		}
		//将orderInfo集合存入到订单信息表
		cartsDao.insertOrderInfo(orderInfo);
	}
 
	/**
	 * 批量删除购物车中的数据
	 * @param comCodes
	 */
	public void deleteFromCarts(List<String> comCodes) {
		cartsDao.deleteCartsByCode(comCodes);		
	}

	public List<OrderInfoBean> selectAllComInfo() {
		
		return cartsDao.selectAllComInfo();
	}

	public void jionCarts(String comCode) {
		
	}

	public void insert(CartsBean car) {
	
		cartsDao.insert(car);
	}
	
	

}
