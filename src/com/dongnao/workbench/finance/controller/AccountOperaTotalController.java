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

import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.finance.model.AccountOperaTotal;
import com.dongnao.workbench.finance.service.AccountOperaTotalService;


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
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddAccountOperaTotal")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperaTotal/addAccountOperaTotal");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowAccountOperaTotal")
	public ModelAndView toShow(String key){
		AccountOperaTotal entity = accountOperaTotalService.getByPrimaryKey(key);
		Map<String,String> accountOperaTotal = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/finance/accountOperaTotal/showAccountOperaTotal","accountOperaTotal",accountOperaTotal );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param accountOperaTotal AccountOperaTotal:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addAccountOperaTotal")
	public void add(AccountOperaTotal accountOperaTotal,HttpServletRequest request,HttpServletResponse response){
	accountOperaTotal.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,accountOperaTotalService.add(accountOperaTotal));		
	}
	
	/**
	 * 批量新增方法
	 * @param response HttpServletResponse
	 * @param accountOperaTotal AccountOperaTotal:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addByOperaDetail")
	public void addByOperaDetail(AccountOperaTotal accountOperaTotal,HttpServletRequest request,HttpServletResponse response){
		accountOperaTotal.setId(Utils.generateUniqueID());
		accountOperaTotalService.addByOperaDetail(accountOperaTotal);		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteAccountOperaTotal")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			accountOperaTotalService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAccountOperaTotal")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperaTotal/listAccountOperaTotal");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param accountOperaTotal AccountOperaTotal：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listAccountOperaTotal")
	public void listByCondition(AccountOperaTotal accountOperaTotal,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountOperaTotal.setPage(page);	
		List<AccountOperaTotal> list = accountOperaTotalService.listByCondition(accountOperaTotal);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditAccountOperaTotal")
	public ModelAndView toEdit(String key){
		AccountOperaTotal entity = accountOperaTotalService.getByPrimaryKey(key);
		Map<String,String> accountOperaTotal = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/finance/accountOperaTotal/editAccountOperaTotal","accountOperaTotal",accountOperaTotal );
	}
	
	/**
	 * 修改方法
	 * @param accountOperaTotal AccountOperaTotal：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateAccountOperaTotal")
	public void update(AccountOperaTotal accountOperaTotal,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,accountOperaTotalService.update(accountOperaTotal));	
	}
	
}