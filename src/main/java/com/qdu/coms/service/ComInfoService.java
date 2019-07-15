package com.qdu.coms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qdu.coms.bean.ComClassifyBean;
import com.qdu.coms.bean.ComImgBean;
import com.qdu.coms.bean.ComInfoBean;
import com.qdu.coms.dao.IComInfoDao;

/**
 * 商品信息Service
 * @author Administrator
 *
 */
@Service
public class ComInfoService {

	@Autowired
	IComInfoDao comInfoDao;
	
	//查询所有商品信息
	public List<ComInfoBean> findAllComs(){
		
		return comInfoDao.findAllComs();
	}

	
	//查询商品分类
	public List<ComClassifyBean> getGoodsCode() {
      return comInfoDao.getGoodsCode();
	}
    
	//商品信息保存
	public void saveComInfo(ComInfoBean comInfoBean) {
		comInfoDao.insertComInfo(comInfoBean);
		
	}

    //检查商品编号是否重复
	
	public boolean checkComCode(String comCode) {
		List<ComInfoBean> list = comInfoDao.getComCode();
		int a = 0;
		for(ComInfoBean coms:list) {
			if(coms.getComCode().equals(comCode)) {
				a=a+1;
			}
		}
		
		return a==0;
	}

    //按照商品ID查询商品信息（为更改信息）
	public ComInfoBean getComInfo(String comCode) {
		ComInfoBean comInfo=comInfoDao.getComInfoById(comCode);
		return comInfo;
	}

   /**
            *  按照comcode更新商品信息
    * @param comInfoBean
    */
	public void updateComInfo(ComInfoBean comInfoBean) {
		comInfoDao.updateComInfo(comInfoBean);
	}

/**
 * 单个删除
 * @param comCode
 */
public void deleteComByCode(String comCode) {
	comInfoDao.deleteByCode(comCode);
}

/**
 * 
 * @param str_comCode
 */
public void deleteBatch(List<String> comCodes) {
	comInfoDao.deleteByCodes(comCodes);
}


public List<ComInfoBean> findComAndImg(String searchName) {
	System.out.println("Serv:"+searchName);
	return comInfoDao.findComAndImg(searchName);
}


public ComInfoBean findComByCode(String comCode) {
	
	return comInfoDao.findComByCode(comCode);
}


public ComImgBean findImgByCode(String comCode) {
	
	return comInfoDao.findImgByCode(comCode);
}

}
