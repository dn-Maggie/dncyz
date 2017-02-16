package com.dongnao.workbench.staticAnalysis.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.staticAnalysis.model.BidStaticAnalysis;
import com.dongnao.workbench.staticAnalysis.model.DemandAnalysis;
import com.dongnao.workbench.staticAnalysis.model.StoreActiveAnalysis;
import com.dongnao.workbench.staticAnalysis.service.AnalysisService;



/**
 * 描述：数据分析模块controller类，负责数据分析页面分发与方法跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("staticAnalysis")
public class StaticAnalysisController{
	@Resource
	private AnalysisService analysisService;
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
	 * 总览数据分析
	 * @return ModelAndView
	 */
	@RequestMapping("/allStatic")
	public void allStatic(BidStaticAnalysis bidStaticAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		bidStaticAnalysis.setPage(page);	
		List<BidStaticAnalysis> list = analysisService.allStatic(null);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
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
	 * 竞价分析
	 * @return ModelAndView
	 */
	@RequestMapping("/bidAnalysis")
	public void bidAnalysis(BidStaticAnalysis bidStaticAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		bidStaticAnalysis.setPage(page);	
		List<BidStaticAnalysis> list = analysisService.bidStaticAnalysis(bidStaticAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
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
	 * 活动数据分析
	 * @return ModelAndView
	 */
	@RequestMapping("/listStoreActivity")
	public void listStoreActivity(StoreActiveAnalysis storeActiveAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		storeActiveAnalysis.setPage(page);	
		List<StoreActiveAnalysis> list = analysisService.storeActiveAnalysis(storeActiveAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
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
 	/**
	 * 精准客户需求分析
	 * @return ModelAndView
	 */
	@RequestMapping("/demandAnalysis")
	public void demandAnalysis(DemandAnalysis demandAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		demandAnalysis.setPage(page);	
		List<DemandAnalysis> list = analysisService.demandAnalysis(demandAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	/**
 	* 进入商户产品销售统计页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toProductSale")
	public ModelAndView toProductSale(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/productSale");
		return mv;
	}
 	/**
	 * 商户产品销售统计页面
	 * @return ModelAndView
	 */
	@RequestMapping("/productSale")
	public void productSale(DemandAnalysis demandAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		demandAnalysis.setPage(page);	
		List<DemandAnalysis> list = analysisService.demandAnalysis(demandAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
}