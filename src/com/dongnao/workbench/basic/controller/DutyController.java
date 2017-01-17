package com.dongnao.workbench.basic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dongnao.workbench.basic.model.Duty;
import com.dongnao.workbench.basic.service.DutyService;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.common.util.Utils;



/**
 * 描述：duty模块controller类，负责页面分发与跳转
 * 
 * @author yao.su
 * @version 1.0 2016-03-13
 */
 
@Controller
@RequestMapping("duty")
public class DutyController{

	private DutyService dutyService;
	
	/**
	 * 设置service
	 * @param dutyService DutyService
	 */
	@Autowired
	public void setDutyService(DutyService dutyService) {
		this.dutyService = dutyService;
	}
 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddDuty")
	public ModelAndView toAdd(String pid){
		return new ModelAndView("WEB-INF/jsp/basic/duty/addDuty").addObject("pid", pid);
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowDuty")
	public ModelAndView toShow(String key){
		Duty entity = dutyService.getByPrimaryKey(key);
		Map<String,String> duty = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/basic/duty/showDuty","duty",duty );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param duty Duty:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addDuty")
	public void add(Duty duty,HttpServletResponse response){
		duty.setId(Utils.generateUniqueID());
		dutyService.add(duty);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteDuty")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			dutyService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListDuty")
	public ModelAndView toList(){
		return new ModelAndView("WEB-INF/jsp/basic/duty/listDuty");
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param duty Duty：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listDuty")
	public void listByCondition(Duty duty,HttpServletRequest request,
			HttpServletResponse response, Page page){
		duty.setPage(page);	
		List<Duty> list = dutyService.listByCondition(duty);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param duty Duty：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/list")
	public void list(Duty duty,HttpServletRequest request,
			HttpServletResponse response){
		List<Duty> list = dutyService.listByCondition(new Duty());
		AjaxUtils.sendAjaxForListStr(response, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditDuty")
	public ModelAndView toEdit(String key){
		Duty entity = dutyService.getByPrimaryKey(key);
		Map<String,String> duty = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/basic/duty/editDuty","duty",duty );
	}
	
	/**
	 * 修改方法
	 * @param duty Duty：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateDuty")
	public void update(Duty duty,HttpServletResponse response){
		dutyService.update(duty);
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	/**
	 * 初始化岗位树
	 * @param duty
	 * @return
	 */
	@RequestMapping("/initDutyTree")
	public void initDutyTree(Duty duty,HttpServletResponse response){
		AjaxUtils.sendAjaxForObject(response, dutyService.initDutyTree(duty));
	}
	
}