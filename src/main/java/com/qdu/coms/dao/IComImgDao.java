package com.qdu.coms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qdu.coms.bean.ComImgBean;
import com.qdu.order.bean.CartsBean;

/**
 * 图片信息持久层
 * @author Administrator
 *
 */
public interface IComImgDao {

	/**
	 * 保存商品图片信息
	 * @param comImgBean
	 */
	void saveImg(ComImgBean comImgBean);
    
	/**
	 * 按照code查询商品图片
	 * @param comCode
	 * @return
	 */
	List<ComImgBean> selectImgByCode(String comCode);

	
	
   /**
    * 查找类型为购物车的图片按照comCode
    * @param comCode
    * @return
    */
	List<ComImgBean> selectImgByCodeAndType(List<String> comCode);
	

	/**
	 * 删除图片
	 * @param comCode
	 * @param imgType
	 */
    void deleteImg(@Param("comCode")String comCode,@Param("imgType") String imgType);
	
	
}
