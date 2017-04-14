package com.dongnao.workbench.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dongnao.workbench.common.excel.ExcelExpUtils;
import com.dongnao.workbench.common.excel.ExpParamBean;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.finance.model.AccountOperaTotal;
import com.dongnao.workbench.finance.model.OperaDate;
import com.dongnao.workbench.finance.service.AccountOperaTotalService;
import com.dongnao.workbench.store.model.Store;
import com.dongnao.workbench.store.service.StoreService;


/**
 * 描述：运营合计模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-03-26
 */
 
@Controller
@RequestMapping("accountOperaTotal")
public class AccountOperaTotalController{
	@Resource
	private AccountOperaTotalService accountOperaTotalService;
	@Resource
	private StoreService storeService; 
	
	
	
	/**
	 * 批量新增方法
	 * @param response HttpServletResponse
	 * @param accountOperaTotal AccountOperaTotal:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addTotalByOperaDetail")
	public void addByOperaDetail(OperaDate operaDate,String type,HttpServletRequest request,HttpServletResponse response){
		if(operaDate.getStoreName()==null)operaDate.setStoreName("");
		switch (type) {
		case "basePrice":
			accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
			accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
			break;
		case "deepOpera":
			accountOperaTotalService.deleteDeepTotalByOperaDate(operaDate);
			accountOperaTotalService.addDeepTotalByOperaDate(operaDate);
			break;
		case "saleRate":
			accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
			accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
			break;
		case "platformAccount":
			accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
			accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
			break;
		default:
			break;
		}
	}
	
	
	/**
	 * 进入运营数据汇总列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAccountOperaTotal")
	public ModelAndView toList(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperaTotal/listAccountOperaTotal");
		 Store store = new Store();
			boolean isAdmin = true;
	 		if(!Utils.isSuperAdmin(request)){
	 			store.setOwnerUserId(Utils.getLoginUserInfoId(request));
	 			isAdmin = false;
			}
			mv.addObject("store",storeService.listByCondition(store));
			mv.addObject("isAdmin",isAdmin);
	 		return mv;
	}
	
	
	/**
	 * 修改方法
	 * @param accountOperaTotal AccountOperaTotal：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 * */
	@RequestMapping("/updateAccountOperaTotal")
	public void updateTotal(AccountOperaTotal accountOperaTotal,String type,HttpServletRequest request,HttpServletResponse response){
		switch (type) {
		case "simpleTotal":
			AjaxUtils.sendAjaxForObjectStr(
					response,accountOperaTotalService.updateSimpleTotal(accountOperaTotal));	
			break;
		case "deepTotal":
			AjaxUtils.sendAjaxForObjectStr(
					response,accountOperaTotalService.updateDeepTotal(accountOperaTotal));	
			break;
		default:
			break;
		}
	} 
	
	/**
	 * 根据条件查找列表方法
	 * @param operaDate OperaDate：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listAccountOperaTotal")
	public void listByCondition(AccountOperaTotal accountOperaTotal,String type,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountOperaTotal.setPage(page);
		List<AccountOperaTotal> list = null;
		switch (type) {
		case "simpleTotal":
			list = accountOperaTotalService.listSimpleTotalByCondition(accountOperaTotal);
			break;
		case "deepTotal":
			list = accountOperaTotalService.listDeepTotalByCondition(accountOperaTotal);
			break;
		default:
			break;
		}
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	
	//导出数据方法
	@RequestMapping("/exportExcel")
	public void exportExcel(AccountOperaTotal accountOperaTotal, ExpParamBean epb,
			HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {		
		int expType = Integer.parseInt(request.getParameter("expType"));
		if (expType == 1) {
			accountOperaTotal.setPage(page);
		}
		List<AccountOperaTotal> list = null;
		try{
			String gridId = request.getParameter("gridId");
			String filename = "";
			String title = "";
				switch (gridId) {
				case "#deepTotal":
					list = accountOperaTotalService.listDeepTotalByCondition(accountOperaTotal);
					filename = "深运营汇总表";
					title = "深运营汇总表";
					break;
				case "#simpleTotal":
					list = accountOperaTotalService.listSimpleTotalByCondition(accountOperaTotal);
					filename = "浅运营汇总表";
					title = "浅运营汇总表";
					break;
				default:
					break;
				}
				ExcelExpUtils.exportListToExcel(list, response, epb.getFieldlist(),
						filename, title);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}