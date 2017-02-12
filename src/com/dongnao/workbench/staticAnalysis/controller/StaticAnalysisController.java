package com.dongnao.workbench.staticAnalysis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



/**
 * 描述：数据分析模块controller类，负责数据分析页面分发与方法跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("staticAnalysis")
public class StaticAnalysisController{
	 
 	/**
 	* 进入总览页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAllStatic")
	public ModelAndView toAllStatic(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/allStatic");
		return mv;
	}
	
 	/**
 	* 进入竞价分析页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toBidAnalysis")
	public ModelAndView toBidAnalysis(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/bidAnalysis");
		return mv;
	}
	
	/**
	 * 进入活动数据分析页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toStoreActivity")
	public ModelAndView toStoreActivity(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/storeActivity");
		 return mv;
	}
	
	/**
 	* 进入精准客户需求分析页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toDemandAnalysis")
	public ModelAndView toDemandAnalysis(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/demandAnalysis");
		return mv;
	}
	
	
}