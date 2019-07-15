package com.qdu.coms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qdu.coms.bean.ComClassifyBean;
import com.qdu.coms.bean.ComImgBean;
import com.qdu.coms.bean.ComInfoBean;

/**
 * 
 * 商品信息持久层
 * @author Administrator
 *
 */
public interface IComInfoDao {
    
	List<ComInfoBean> findAllComs();

	List<ComClassifyBean> getGoodsCode();

	void insertComInfo(ComInfoBean comInfoBean);

	List<ComInfoBean> getComCode();

	ComInfoBean getComInfoById(String comCode);

	void updateComInfo(ComInfoBean comInfoBean);

	void deleteByCode(String comCode);

	void deleteByCodes(@Param(value="comCodes") List<String> comCodes);

	List<ComInfoBean> findComAndImg(@Param("searchName")String searchName);

	ComInfoBean findComByCode(String comCode);

	ComImgBean findImgByCode(String comCode);
}
