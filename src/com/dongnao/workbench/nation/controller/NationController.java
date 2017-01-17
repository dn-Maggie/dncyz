package com.dongnao.workbench.nation.controller;

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
import com.dongnao.workbench.nation.model.Nation;
import com.dongnao.workbench.nation.service.NationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：民族模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2016-07-17
 */
 
@Controller
@RequestMapping("nation")
public class NationController{
         @Resource
	private NationService nationService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddNation")
	public ModelAndView toAdd(){
		return new ModelAndView("WEB-INF/jsp/nation/nation/addNation");
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowNation")
	public ModelAndView toShow(String key){
		Nation entity = nationService.getByPrimaryKey(key);
		Map<String,String> nation = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/nation/nation/showNation","nation",nation );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param nation Nation:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addNation")
	public void add(Nation nation,HttpServletRequest request,HttpServletResponse response){
	nation.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,nationService.add(nation));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteNation")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			nationService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListNation")
	public ModelAndView toList(){
		return new ModelAndView("WEB-INF/jsp/nation/nation/listNation");
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param nation Nation：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listNation")
	public void listByCondition(Nation nation,HttpServletRequest request,
			HttpServletResponse response, Page page){
		nation.setPage(page);	
		List<Nation> list = nationService.listByCondition(nation);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditNation")
	public ModelAndView toEdit(String key){
		Nation entity = nationService.getByPrimaryKey(key);
		Map<String,String> nation = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/nation/nation/editNation","nation",nation );
	}
	
	/**
	 * 修改方法
	 * @param nation Nation：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateNation")
	public void update(Nation nation,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,nationService.update(nation));	
	}
	
}