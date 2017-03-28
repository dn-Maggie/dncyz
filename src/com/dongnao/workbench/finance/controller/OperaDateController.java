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
import com.dongnao.workbench.finance.model.OperaDate;
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
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			operaDateService.deleteByKey(str[i]);
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
	public void listByCondition(OperaDate operaDate,HttpServletRequest request,
			HttpServletResponse response, Page page){
		operaDate.setPage(page);	
		List<OperaDate> list = operaDateService.listByCondition(operaDate);
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
	public void update(OperaDate operaDate,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,operaDateService.update(operaDate));	
	}
	
}