package com.dongnao.workbench.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.finance.model.AccountOperaTotal;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.OperaDate;
import com.dongnao.workbench.finance.service.AccountOperaTotalService;
import com.dongnao.workbench.finance.service.OperaDateService;

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
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddOperaDate")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/operaDate/addOperaDate");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowOperaDate")
	public ModelAndView toShow(String key){
		OperaDate entity = operaDateService.getByPrimaryKey(key);
		Map<String,String> operaDate = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/finance/operaDate/showOperaDate","operaDate",operaDate );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param operaDate OperaDate:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addOperaDate")
	public void add(OperaDate operaDate,HttpServletRequest request,HttpServletResponse response){
	operaDate.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,operaDateService.add(operaDate));		
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
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListOperaDate")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/operaDate/listOperaDate");
		 return mv;
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
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditOperaDate")
	public ModelAndView toEdit(String key){
		OperaDate entity = operaDateService.getByPrimaryKey(key);
		Map<String,String> operaDate = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/finance/operaDate/editOperaDate","operaDate",operaDate );
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
		switch (type) {
		case "basePrice":
			operaDateService.deleteBasePriceByOrderDetail(accountOrderDetail);
			operaDateService.addBasePriceByOrderDetail(accountOrderDetail);
			accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
			accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
			break;
		case "deepOpera":
			operaDateService.deleteDeepOperaByOrderDetail(accountOrderDetail);
			operaDateService.addDeepOperaByOrderDetail(accountOrderDetail);
			accountOperaTotalService.deleteDeepTotalByOperaDate(operaDate);
			accountOperaTotalService.addDeepTotalByOperaDate(operaDate);
			break;
		case "saleRate":
			operaDateService.deleteSaleRateByOrderDetail(accountOrderDetail);
			operaDateService.addSaleRateByOrderDetail(accountOrderDetail);
			accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
			accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
			break;
		case "platformAccount":
			operaDateService.deletePlatformAccountByOrderDetail(accountOrderDetail);
			operaDateService.addPlatformAccountByOrderDetail(accountOrderDetail);
			accountOperaTotalService.deleteSimpleTotalByOperaDate(operaDate);
			accountOperaTotalService.addSimpleTotalByOperaDate(operaDate);
			break;
		default:
			break;
		}
	}
}