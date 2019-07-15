package com.qdu.coms.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.qdu.coms.bean.ComImgBean;
import com.qdu.coms.bean.Msg;
import com.qdu.coms.service.ComImgService;

@Controller
@RequestMapping("/img")
public class ComImgController {
	
	@Autowired
	ComImgService comImgService;
	
	
	/**
	 * 上传图片
	 * @param file
	 * @return
	 * @throws Exception
	 */
	//参数名称必须要和文件上传框的Name相同
	@RequestMapping("/upload")
	@ResponseBody
    public void upload(@RequestParam("file")MultipartFile file,@RequestParam("type")String type) throws Exception {
		System.out.println(type);
    	//获得完整文件名
    	String fileName = file.getOriginalFilename();
    	//获得文件名前缀
//    	String prefix = fileName.substring(0, fileName.lastIndexOf("."));
    	//获得文件后缀
    	String suffix = fileName.substring(fileName.lastIndexOf("."));
    	
    	String name = UUID.randomUUID().toString();
    	String path = "/b2cimg/"+name+suffix;
    	FileUtils.copyInputStreamToFile(file.getInputStream(),new File("C:\\Users\\Administrator\\Desktop\\img\\"+name+suffix));
    	
    	//调用ComInfoService中的方法将文件名和路径存入到数据库中
    	ComImgBean comImg = new ComImgBean();
    	comImg.setComCode("A102");
    	comImg.setImgUrl(path);
    	comImg.setImgType("页面展示");
    	comImgService.saveImg(comImg);	
    
    }
	
	
	/**
	 * 查询图片
	 * @return
	 */
	@RequestMapping("/selectImg/{comCode}")
	@ResponseBody
	public Msg selectImgByCode(@PathVariable(value="comCode")String comCode) {
		List<ComImgBean> img = comImgService.selectImgByCode(comCode);
		return Msg.success().add("img",img);
	}
	
	/**
	 * 删除图片
	 * @param comCode
	 * @param imgType
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteImg/{comCode}/{imgType}",method=RequestMethod.DELETE)
	public Msg deleteImg(@PathVariable("comCode")String comCode,@PathVariable("imgType")String imgType) {
		System.out.println("comCode"+comCode+"imgType"+imgType);
		//删除图片
		comImgService.deleteImg(comCode,imgType);
		return Msg.success();
	}
}
