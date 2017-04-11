package com.dongnao.workbench.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.excel.ExcelExpUtils;
import com.dongnao.workbench.common.excel.ExpParamBean;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.finance.model.AccountOperaTotal;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.OperaDate;
import com.dongnao.workbench.finance.service.AccountOperaTotalService;
import com.dongnao.workbench.finance.service.OperaDateService;
import com.dongnao.workbench.store.model.Store;
import com.dongnao.workbench.store.service.StoreService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：运营日明细模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-03-28
 */
 
@Controller
@RequestMapping("operaDate")
public class OperaDateController{
    @Resource
	private OperaDateService operaDateService;
    @Resource
 	private AccountOperaTotalService accountOperaTotalService;
    @Resource
	private StoreService storeService;

	/**
	 * 进入运营数据菜品分析
	 * @return ModelAndView
	 */
	@RequestMapping("/toListGoods")
	public ModelAndView toListByDate(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/listGoods");
		 Store store = new Store();
	 		if(!Utils.isSuperAdmin(request)){
	 			store.setOwnerUserId(Utils.getLoginUserInfoId(request));
			}
			mv.addObject("store",storeService.listByCondition(store));
		 return mv;
	}
	/**
	 * 进入运营明细列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAccountOperateIncome")
	public ModelAndView toList(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/listAccountOperateIncome");
		 Store store = new Store();
	 		if(!Utils.isSuperAdmin(request)){
	 			store.setOwnerUserId(Utils.getLoginUserInfoId(request));
			}
			mv.addObject("store",storeService.listByCondition(store));
		 return mv;
	}
	/**
	 * 进入运营汇总数据
	 * @return ModelAndView
	 */
	@RequestMapping("/toListOperateIncomeByTotal")
	public ModelAndView toListAllFromOrderDetail(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/listAccountOperateIncomeByTotal");
		 Store store = new Store();
	 		if(!Utils.isSuperAdmin(request)){
	 			store.setOwnerUserId(Utils.getLoginUserInfoId(request));
			}
			mv.addObject("store",storeService.listByCondition(store));
		 return mv;
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteOperaDate")
	public void deleteByKey(AccountOrderDetail accountOrderDetail,String type,HttpServletResponse response){
		switch (type) {
		case "basePrice":
			operaDateService.deleteBasePriceByOrderDetail(accountOrderDetail);
			break;
		case "deepOpera":
			operaDateService.deleteDeepOperaByOrderDetail(accountOrderDetail);
			break;
		case "saleRate":
			operaDateService.deleteSaleRateByOrderDetail(accountOrderDetail);
			break;
		case "platformAccount":
			operaDateService.deletePlatformAccountByOrderDetail(accountOrderDetail);
			break;
		default:
			break;
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	
	/**
	 * 根据条件查找列表方法
	 * @param operaDate OperaDate：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listOperaDate")
	public void listByCondition(OperaDate operaDate,String type,HttpServletRequest request,
			HttpServletResponse response, Page page){
		operaDate.setPage(page);
		List<OperaDate> list = null;
		switch (type) {
		case "basePrice":
			list = operaDateService.listBasePriceByCondition(operaDate);
			break;
		case "deepOpera":
			list = operaDateService.listDeepOperaByCondition(operaDate);
			break;
		case "saleRate":
			list = operaDateService.listSaleRateByCondition(operaDate);
			break;
		case "platformAccount":
			list = operaDateService.listPlatformAccountByCondition(operaDate);
			break;
		default:
			break;
		}
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 修改方法
	 * @param operaDate OperaDate：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateOperaDate")
	public void update(OperaDate operaDate,String type,HttpServletRequest request,HttpServletResponse response){
		switch (type) {
		case "basePrice":
			AjaxUtils.sendAjaxForObjectStr(response,operaDateService.updateBasePrice(operaDate));	
			break;
		case "deepOpera":
			AjaxUtils.sendAjaxForObjectStr(response,operaDateService.updateDeepOpera(operaDate));	
			break;
		case "saleRate":
			AjaxUtils.sendAjaxForObjectStr(response,operaDateService.updateSaleRate(operaDate));	
			break;
		case "platformAccount":
			AjaxUtils.sendAjaxForObjectStr(response,operaDateService.updatePlatformAccount(operaDate));	
			break;
		default:
			break;
		}
		
	}
	
	/**
	 * 批量新增方法
	 * @param response HttpServletResponse
	 * @param accountOperaTotal AccountOperaTotal:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addByOrderDetail")
	public void addByOperaDetail(AccountOrderDetail accountOrderDetail,String type,HttpServletRequest request,HttpServletResponse response){
		if(accountOrderDetail.getStoreName()==null)accountOrderDetail.setStoreName("");
		OperaDate operaDate = new OperaDate();
		operaDate.setStoreName(accountOrderDetail.getStoreName());
		ResultMessage rs = new ResultMessage();
		switch (type) {
		case "basePrice":
			try
			{
			operaDateService.deleteBasePriceByOrderDetail(accountOrderDetail);
			operaDateService.deleteDeepOperaByOrderDetail(accountOrderDetail);
			operaDateService.deleteSaleRateByOrderDetail(accountOrderDetail);
			operaDateService.deletePlatformAccountByOrderDetail(accountOrderDetail);
			if(operaDateService.addBasePriceByOrderDetail(accountOrderDetail)>0) {
				rs.setMessage("生成运营表成功");
				accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
				accountOperaTotalService.deleteDeepTotalByOperaDate(operaDate);
				accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
				}
			}catch(Exception e){
				rs.setMessage("生成运营表或对账表时出错");
				AjaxUtils.sendAjaxForObjectStr(response,rs);
			}
			break;
		case "deepOpera":
			try
			{
			operaDateService.deleteBasePriceByOrderDetail(accountOrderDetail);
			operaDateService.deleteDeepOperaByOrderDetail(accountOrderDetail);
			operaDateService.deleteSaleRateByOrderDetail(accountOrderDetail);
			operaDateService.deletePlatformAccountByOrderDetail(accountOrderDetail);
			if(operaDateService.addDeepOperaByOrderDetail(accountOrderDetail)>0){
				rs.setMessage("生成运营表成功");
				accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
				accountOperaTotalService.deleteDeepTotalByOperaDate(operaDate);
				accountOperaTotalService.addDeepTotalByOperaDate(operaDate);
				}
			}catch(Exception e){
				rs.setMessage("生成运营表或对账表时出错");
				AjaxUtils.sendAjaxForObjectStr(response,rs);
			}
			break;
		case "saleRate":
			try
			{
			operaDateService.deleteBasePriceByOrderDetail(accountOrderDetail);
			operaDateService.deleteDeepOperaByOrderDetail(accountOrderDetail);
			operaDateService.deleteSaleRateByOrderDetail(accountOrderDetail);
			operaDateService.deletePlatformAccountByOrderDetail(accountOrderDetail);
			if(operaDateService.addSaleRateByOrderDetail(accountOrderDetail)>0){
				rs.setMessage("生成运营表成功");
				accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
				accountOperaTotalService.deleteDeepTotalByOperaDate(operaDate);
				accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
				}
			}catch(Exception e){
				rs.setMessage("生成运营表或对账表时出错");
				AjaxUtils.sendAjaxForObjectStr(response,rs);
			}
			break;
		case "platformAccount":
			try
			{
			operaDateService.deleteBasePriceByOrderDetail(accountOrderDetail);
			operaDateService.deleteDeepOperaByOrderDetail(accountOrderDetail);
			operaDateService.deleteSaleRateByOrderDetail(accountOrderDetail);
			operaDateService.deletePlatformAccountByOrderDetail(accountOrderDetail);
			if(operaDateService.addPlatformAccountByOrderDetail(accountOrderDetail)>0){
				rs.setMessage("生成运营表成功");
				accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
				accountOperaTotalService.deleteDeepTotalByOperaDate(operaDate);
				accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
				}
			}catch(Exception e){
				rs.setMessage("生成运营表或对账表时出错");
				AjaxUtils.sendAjaxForObjectStr(response,rs);
			}
			break;
		default:
			break;
		}
		AjaxUtils.sendAjaxForObjectStr(response,rs);
	}
	//导出数据方法
	@RequestMapping("/exportExcel")
	public void exportExcel(OperaDate operaDate, ExpParamBean epb,
			HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {		
		int expType = Integer.parseInt(request.getParameter("expType"));
		if (expType == 1) {
			operaDate.setPage(page);
		}
		List<OperaDate> list = null;
		try{
			String gridId = request.getParameter("gridId");
			String filename = "";
			String title = "";
				switch (gridId) {
				case "#deepOpera":
					list = operaDateService.listDeepOperaByCondition(operaDate);
					filename = "深运营表";
					title = "深运营表";
					break;
				case "#basePrice":
					list = operaDateService.listBasePriceByCondition(operaDate);
					filename = "底价运营表";
					title = "底价运营表";
					break;
				case "#saleRate":
					list = operaDateService.listSaleRateByCondition(operaDate);
					filename = "销售额比例抽佣运营表";
					title = "销售额比例抽佣运营表";
					break;
				case "#platformAccount":
					list = operaDateService.listPlatformAccountByCondition(operaDate);	
					filename = "平台到账抽佣运营表";
					title = "平台到账抽佣运营表";
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