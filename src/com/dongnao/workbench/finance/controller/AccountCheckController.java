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
import com.dongnao.workbench.finance.model.AccountCheck;
import com.dongnao.workbench.finance.service.AccountCheckService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：财务对账模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-23
 */
 
@Controller
@RequestMapping("accountCheck")
public class AccountCheckController{
         @Resource
	private AccountCheckService accountCheckService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddAccountCheck")
	public ModelAndView toAdd(){
		return new ModelAndView("WEB-INF/jsp/finance/accountCheck/addAccountCheck");
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowAccountCheck")
	public ModelAndView toShow(String key){
		AccountCheck entity = accountCheckService.getByPrimaryKey(key);
		Map<String,String> accountCheck = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/finance/accountCheck/showAccountCheck","accountCheck",accountCheck );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param accountCheck AccountCheck:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addAccountCheck")
	public void add(AccountCheck accountCheck,HttpServletRequest request,HttpServletResponse response){
	accountCheck.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,accountCheckService.add(accountCheck));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteAccountCheck")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			accountCheckService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAccountCheck")
	public ModelAndView toList(){
		return new ModelAndView("WEB-INF/jsp/finance/accountCheck/listAccountCheck");
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param accountCheck AccountCheck：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listAccountCheck")
	public void listByCondition(AccountCheck accountCheck,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountCheck.setPage(page);	
		List<AccountCheck> list = accountCheckService.listByCondition(accountCheck);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditAccountCheck")
	public ModelAndView toEdit(String key){
		AccountCheck entity = accountCheckService.getByPrimaryKey(key);
		Map<String,String> accountCheck = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/finance/accountCheck/editAccountCheck","accountCheck",accountCheck );
	}
	
	/**
	 * 修改方法
	 * @param accountCheck AccountCheck：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateAccountCheck")
	public void update(AccountCheck accountCheck,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,accountCheckService.update(accountCheck));	
	}
	
}