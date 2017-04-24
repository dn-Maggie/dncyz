package com.dongnao.workbench.finance.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dongnao.workbench.finance.service.OperaDateService;


/**
 * 描述：财务配置类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-03-26
 */
 
@Controller
@RequestMapping("config")
public class ConfigController{
	 @Resource
	private OperaDateService operaDateService;
	/**
	 * 配置表头
	 */
	@RequestMapping("/toConfigGridTitle")
	public ModelAndView toConfigGridTitle(String storeName){
		try {
			storeName = new String(storeName.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/config/configGridTitle");
		mv.addObject("storeName",storeName);
		return mv;
	}	 
	
}