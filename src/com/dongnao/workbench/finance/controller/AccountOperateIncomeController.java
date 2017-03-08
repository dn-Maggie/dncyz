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
import com.dongnao.workbench.finance.model.AccountOperateIncome;
import com.dongnao.workbench.finance.service.AccountOperateIncomeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：运营数据模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-03-05
 */
 
@Controller
@RequestMapping("accountOperateIncome")
public class AccountOperateIncomeController{
         @Resource
	private AccountOperateIncomeService accountOperateIncomeService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddAccountOperateIncome")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/addAccountOperateIncome");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowAccountOperateIncome")
	public ModelAndView toShow(String key){
		AccountOperateIncome entity = accountOperateIncomeService.getByPrimaryKey(key);
		Map<String,String> accountOperateIncome = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/showAccountOperateIncome","accountOperateIncome",accountOperateIncome );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param accountOperateIncome AccountOperateIncome:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addAccountOperateIncome")
	public void add(AccountOperateIncome accountOperateIncome,HttpServletRequest request,HttpServletResponse response){
	accountOperateIncome.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,accountOperateIncomeService.add(accountOperateIncome));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteAccountOperateIncome")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			accountOperateIncomeService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAccountOperateIncome")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/listAccountOperateIncome");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param accountOperateIncome AccountOperateIncome：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listAccountOperateIncome")
	public void listByCondition(AccountOperateIncome accountOperateIncome,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountOperateIncome.setPage(page);	
		List<AccountOperateIncome> list = accountOperateIncomeService.listByCondition(accountOperateIncome);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditAccountOperateIncome")
	public ModelAndView toEdit(String key){
		AccountOperateIncome entity = accountOperateIncomeService.getByPrimaryKey(key);
		Map<String,String> accountOperateIncome = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/editAccountOperateIncome","accountOperateIncome",accountOperateIncome );
	}
	
	/**
	 * 修改方法
	 * @param accountOperateIncome AccountOperateIncome：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateAccountOperateIncome")
	public void update(AccountOperateIncome accountOperateIncome,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,accountOperateIncomeService.update(accountOperateIncome));	
	}
	
}