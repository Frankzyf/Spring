package com.qdu.coms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qdu.coms.bean.ComImgBean;
import com.qdu.coms.dao.IComImgDao;
import com.qdu.order.bean.CartsBean;

@Service
public class ComImgService {
	
	@Autowired
	IComImgDao comImgDao;
	
	public void saveImg(ComImgBean comImgBean) {
		System.out.println("存储图片信息！"+
				comImgBean.getComCode()+
				comImgBean.getImgUrl()+
				comImgBean.getImgType());
		comImgDao.saveImg(comImgBean);
	}
    /**
     * 按照code查询图片
     * @param comCode
     * @return
     */
	public List<ComImgBean> selectImgByCode(String comCode) {
		
		return comImgDao.selectImgByCode(comCode);
	}
	/**
	 * 查询图片按照comCode和Type
	 * @param comCode
	 * @return
	 */
	public List<ComImgBean> selectImgByCodeAndType(List<String> comCode) {
		return comImgDao.selectImgByCodeAndType(comCode);
	}
	/**
	 * 删除图片
	 * @param comCode
	 * @param imgType
	 */
	public void deleteImg(String comCode, String imgType) {
		comImgDao.deleteImg(comCode,imgType);
	}

}
