package com.dongnao.workbench.finance.controller;

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
	public ModelAndView toConfigGridTitle(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/config/configGridTitle");
		return mv;
	}	 
	
}