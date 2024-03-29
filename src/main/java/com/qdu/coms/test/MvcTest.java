package com.qdu.coms.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.qdu.coms.bean.ComInfoBean;


/**
 * 使用spring测试功能，测试请求功能
 * @author Administrator
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class MvcTest {
	
	//傳入Springmvc的IOC
	@Autowired
	WebApplicationContext context;
	//虚拟mvc请求，获取处理结果
	MockMvc mockMvc;
	
	@Before
	public void innitMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testPage() throws Exception {
		//模拟请求拿到返回值
		MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get("/coms/findAllComs").param("pn", "1"))
		.andReturn();
		
		//请求成功以后，请求域中会有pageInfo;
		MockHttpServletRequest request=result.getRequest();
		PageInfo<ComInfoBean> pi = (PageInfo<ComInfoBean>)request.getAttribute("PageInfo");
		System.out.println("当前页码"+pi.getPageNum());
		System.out.println("总页码"+pi.getPages());
		System.out.println("总记录数"+pi.getTotal());
		System.out.println("在页面连续显示的页码");
		int[] nums = pi.getNavigatepageNums();
		for(int i:nums) {
			System.out.println(""+i);
		}
		
		//获取商品数据
		List<ComInfoBean> list = pi.getList();
		for(ComInfoBean coms:list) {
			System.out.println("name:"+coms.getComName()+"code:"+coms.getComCode());
		}
		
	}

}
