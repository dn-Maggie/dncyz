package com.dongnao.workbench.store.controller;

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
import com.dongnao.workbench.store.model.StorePlatformRel;
import com.dongnao.workbench.store.service.StorePlatformRelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：商铺外卖平台关系模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("storePlatformRel")
public class StorePlatformRelController{
         @Resource
	private StorePlatformRelService storePlatformRelService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddStorePlatformRel")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storePlatformRel/addStorePlatformRel");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowStorePlatformRel")
	public ModelAndView toShow(String key){
		StorePlatformRel entity = storePlatformRelService.getByPrimaryKey(key);
		Map<String,String> storePlatformRel = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/store/storePlatformRel/showStorePlatformRel","storePlatformRel",storePlatformRel );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param storePlatformRel StorePlatformRel:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addStorePlatformRel")
	public void add(StorePlatformRel storePlatformRel,HttpServletRequest request,HttpServletResponse response){
	storePlatformRel.setPlatformId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,storePlatformRelService.add(storePlatformRel));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteStorePlatformRel")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			storePlatformRelService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListStorePlatformRel")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storePlatformRel/listStorePlatformRel");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param storePlatformRel StorePlatformRel：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listStorePlatformRel")
	public void listByCondition(StorePlatformRel storePlatformRel,HttpServletRequest request,
			HttpServletResponse response, Page page){
		storePlatformRel.setPage(page);	
		List<StorePlatformRel> list = storePlatformRelService.listByCondition(storePlatformRel);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditStorePlatformRel")
	public ModelAndView toEdit(String key){
		StorePlatformRel entity = storePlatformRelService.getByPrimaryKey(key);
		Map<String,String> storePlatformRel = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/store/storePlatformRel/editStorePlatformRel","storePlatformRel",storePlatformRel );
	}
	
	/**
	 * 修改方法
	 * @param storePlatformRel StorePlatformRel：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateStorePlatformRel")
	public void update(StorePlatformRel storePlatformRel,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,storePlatformRelService.update(storePlatformRel));	
	}
	
}