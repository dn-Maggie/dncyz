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
import com.dongnao.workbench.system.model.Option;
import com.dongnao.workbench.system.service.OptionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：功能操作模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("option")
public class OptionController{
         @Resource
	private OptionService optionService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddOption")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/system/option/addOption");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowOption")
	public ModelAndView toShow(String key){
		Option entity = optionService.getByPrimaryKey(key);
		Map<String,String> option = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/system/option/showOption","option",option );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param option Option:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addOption")
	public void add(Option option,HttpServletRequest request,HttpServletResponse response){
	option.setOpId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,optionService.add(option));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteOption")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			optionService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListOption")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/system/option/listOption");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param option Option：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listOption")
	public void listByCondition(Option option,HttpServletRequest request,
			HttpServletResponse response, Page page){
		option.setPage(page);	
		List<Option> list = optionService.listByCondition(option);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditOption")
	public ModelAndView toEdit(String key){
		Option entity = optionService.getByPrimaryKey(key);
		Map<String,String> option = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/system/option/editOption","option",option );
	}
	
	/**
	 * 修改方法
	 * @param option Option：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateOption")
	public void update(Option option,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,optionService.update(option));	
	}
	
}