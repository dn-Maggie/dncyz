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
import com.dongnao.workbench.store.model.StoreFlux;
import com.dongnao.workbench.store.service.StoreFluxService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：店铺流量模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("storeFlux")
public class StoreFluxController{
         @Resource
	private StoreFluxService storeFluxService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddStoreFlux")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeFlux/addStoreFlux");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowStoreFlux")
	public ModelAndView toShow(String key){
		StoreFlux entity = storeFluxService.getByPrimaryKey(key);
		Map<String,String> storeFlux = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/store/storeFlux/showStoreFlux","storeFlux",storeFlux );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param storeFlux StoreFlux:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addStoreFlux")
	public void add(StoreFlux storeFlux,HttpServletRequest request,HttpServletResponse response){
	storeFlux.setFluxId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,storeFluxService.add(storeFlux));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteStoreFlux")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			storeFluxService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListStoreFlux")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeFlux/listStoreFlux");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param storeFlux StoreFlux：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listStoreFlux")
	public void listByCondition(StoreFlux storeFlux,HttpServletRequest request,
			HttpServletResponse response, Page page){
		storeFlux.setPage(page);	
		List<StoreFlux> list = storeFluxService.listByCondition(storeFlux);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditStoreFlux")
	public ModelAndView toEdit(String key){
		StoreFlux entity = storeFluxService.getByPrimaryKey(key);
		Map<String,String> storeFlux = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/store/storeFlux/editStoreFlux","storeFlux",storeFlux );
	}
	
	/**
	 * 修改方法
	 * @param storeFlux StoreFlux：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateStoreFlux")
	public void update(StoreFlux storeFlux,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,storeFluxService.update(storeFlux));	
	}
	
}