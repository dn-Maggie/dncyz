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
import com.dongnao.workbench.store.model.StoreHealth;
import com.dongnao.workbench.store.service.StoreHealthService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：店铺健康率模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("storeHealth")
public class StoreHealthController{
         @Resource
	private StoreHealthService storeHealthService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddStoreHealth")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeHealth/addStoreHealth");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowStoreHealth")
	public ModelAndView toShow(String key){
		StoreHealth entity = storeHealthService.getByPrimaryKey(key);
		Map<String,String> storeHealth = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/store/storeHealth/showStoreHealth","storeHealth",storeHealth );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param storeHealth StoreHealth:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addStoreHealth")
	public void add(StoreHealth storeHealth,HttpServletRequest request,HttpServletResponse response){
	storeHealth.setHealthId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,storeHealthService.add(storeHealth));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteStoreHealth")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			storeHealthService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListStoreHealth")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeHealth/listStoreHealth");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param storeHealth StoreHealth：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listStoreHealth")
	public void listByCondition(StoreHealth storeHealth,HttpServletRequest request,
			HttpServletResponse response, Page page){
		storeHealth.setPage(page);	
		List<StoreHealth> list = storeHealthService.listByCondition(storeHealth);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditStoreHealth")
	public ModelAndView toEdit(String key){
		StoreHealth entity = storeHealthService.getByPrimaryKey(key);
		Map<String,String> storeHealth = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/store/storeHealth/editStoreHealth","storeHealth",storeHealth );
	}
	
	/**
	 * 修改方法
	 * @param storeHealth StoreHealth：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateStoreHealth")
	public void update(StoreHealth storeHealth,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,storeHealthService.update(storeHealth));	
	}
	
}