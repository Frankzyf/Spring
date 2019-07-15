package com.qdu.coms.controller;

import java.text.Format;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qdu.coms.bean.ComClassifyBean;
import com.qdu.coms.bean.ComImgBean;
import com.qdu.coms.bean.ComInfoBean;
import com.qdu.coms.bean.Msg;
import com.qdu.coms.service.ComInfoService;

@Controller
@RequestMapping(value="/coms")
public class ComController {
	
	@Autowired
	ComInfoService comInfoService;
	
	/**
	 * 跳转到搜索到的商品页面
	 */
	@RequestMapping(value="/comInfo",method=RequestMethod.GET)
//	@ResponseBody
	public String ComInfo(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model,@RequestParam("searchName")String searchName) {
		System.out.println(searchName);
		PageHelper.startPage(pn, 6);
		List<ComInfoBean>emps =  comInfoService.findComAndImg(searchName);
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("PageInfo",page);
		model.addAttribute("msg", searchName);
		return "coms";
	}
	
	/**
	 * 商品详情
	 * @return
	 */
	@RequestMapping("/details")
	public String ComInfoByCode(@RequestParam("comCode")String comCode,Model model) {
		
		ComInfoBean info = comInfoService.findComByCode(comCode);
		ComImgBean  img = comInfoService.findImgByCode(comCode);
		model.addAttribute("com",info);
		model.addAttribute("img",img);
		return "details";
	}
	
	/**
	 * 查询所有商品信息
	 */
	@RequestMapping(value="/findAllComs")
	@ResponseBody
	public Msg getComInfoJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		//引入分页插件
		//在查詢之前只需要調用,传入页码，以及每页的大小
		PageHelper.startPage(pn,5);
		//此查询在分页后就会自动成为分页查询
		List<ComInfoBean> com = comInfoService.findAllComs();
		//使用pageinfo包装查询后的结果，只需要将pageinfo交给页面就好
		//封装了详细的分页信息，包括查询出的数据,连续显示的页数为5
		PageInfo page = new PageInfo(com,5);
		
		return Msg.success().add("PageInfo",page);
		
	}
	
	/**
	 * 返回所有的商品分类信息
	 */
	@RequestMapping("/getGoodsCode")
	@ResponseBody
	public Msg getGoodsCode() {
		List<ComClassifyBean> list = comInfoService.getGoodsCode();
//		List<ComClassifyBean> com = new ArrayList<>();
//		for(ComClassifyBean rel:list) {
//			if(StringUtils.isEmpty(rel.getParentCode())) {
//				ComClassifyBean ccc = new ComClassifyBean();
//				if(StringUtils.isEmpty(rel.getParentCode())) {
//					ccc.setCode(rel.getCode());
//					com.add(ccc);
//				}else {
//					ComClassifyBean bbb = new ComClassifyBean();
//					List<ComClassifyBean> com2 = new ArrayList<>();
//					bbb.setCode(rel.getCode());
//					com2.add(bbb);
//					com.add(bbb);
//				}
//			}
//		}
		return Msg.success().add("goodsCode", list);
	}
	
	
	/**
	 * 保存商品信息
	 * @return
	 */
	@RequestMapping(value="/saveComsInfo",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveComsInfo(ComInfoBean comInfoBean) {
		comInfoService.saveComInfo(comInfoBean);
		return Msg.success();
	}
	
	/**
	 * 校验商品编号是否重复
	 */
	@RequestMapping("/checkCode")
	@ResponseBody
	public Msg checkCode(@RequestParam("comCode")String comCode) {
		boolean b = comInfoService.checkComCode(comCode);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	/**
	 * 根据comcode查询商品信息
	 */
	@RequestMapping(value="/getComInfo/{comCode}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getComImfo(@PathVariable("comCode")String comCode) {
		
		ComInfoBean comInfo =  comInfoService.getComInfo(comCode);
		return Msg.success().add("coms",comInfo);
	}
	
	/**根据comcode更改商品信息
	 * 
	 * 要能直接发送PUT请求，需要配置过滤器
	 * HttpPutFormContentFilter
	 * 它的作用：将请求体中的数据解析包装成一个map
	 * request也被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
	 * 
	 */
	@RequestMapping(value="/updateComInfo/{comCode}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateComInfo(ComInfoBean comInfoBean) {
		comInfoService.updateComInfo(comInfoBean);
		return Msg.success();
	}

	
	/**
	 * 单个批量二合一
	 * 
	 * @param comCode
	 * @return
	 */
	@RequestMapping(value="/delete/{comCodes}" ,method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteComByCode(@PathVariable("comCodes")String comCode) {
		if(comCode.contains(",")) {
			List<String> comCodes = new ArrayList<String>();
			String[] str_comCode = comCode.split(",");
			for(String str:str_comCode) {
				comCodes.add(str);
			}
			System.out.println(comCodes);
			comInfoService.deleteBatch(comCodes);
		}else {
			comInfoService.deleteComByCode(comCode);
		}
		return Msg.success();
	}
}
