package com.dongnao.workbench.system.controller;

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
import com.dongnao.workbench.system.model.InvokeFlow;
import com.dongnao.workbench.system.service.InvokeFlowService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：调用流程模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("invokeFlow")
public class InvokeFlowController{
    @Resource
	private InvokeFlowService invokeFlowService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddInvokeFlow")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/system/invokeFlow/addInvokeFlow");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowInvokeFlow")
	public ModelAndView toShow(String key){
		InvokeFlow entity = invokeFlowService.getByPrimaryKey(key);
		Map<String,String> invokeFlow = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/system/invokeFlow/showInvokeFlow","invokeFlow",invokeFlow );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param invokeFlow InvokeFlow:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addInvokeFlow")
	public void add(InvokeFlow invokeFlow,HttpServletRequest request,HttpServletResponse response){
	invokeFlow.setFlowId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,invokeFlowService.add(invokeFlow));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteInvokeFlow")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			invokeFlowService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListInvokeFlow")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/system/invokeFlow/listInvokeFlow");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param invokeFlow InvokeFlow：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listInvokeFlow")
	public void listByCondition(InvokeFlow invokeFlow,HttpServletRequest request,
			HttpServletResponse response, Page page){
		invokeFlow.setPage(page);	
		List<InvokeFlow> list = invokeFlowService.listByCondition(invokeFlow);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditInvokeFlow")
	public ModelAndView toEdit(String key){
		InvokeFlow entity = invokeFlowService.getByPrimaryKey(key);
		Map<String,String> invokeFlow = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/system/invokeFlow/editInvokeFlow","invokeFlow",invokeFlow );
	}
	
	/**
	 * 修改方法
	 * @param invokeFlow InvokeFlow：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateInvokeFlow")
	public void update(InvokeFlow invokeFlow,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,invokeFlowService.update(invokeFlow));	
	}
	
}