package com.dongnao.workbench.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.activity.service.ActivityService;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.store.model.Store;
import com.dongnao.workbench.store.model.StoreActivity;
import com.dongnao.workbench.store.service.StoreActivityService;
import com.dongnao.workbench.store.service.StoreService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：店铺活动模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("storeActivity")
public class StoreActivityController{
    @Resource
	private StoreActivityService storeActivityService;
    @Resource
	private StoreService storeService;
    @Resource
	private ActivityService activityService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddStoreActivity")
	public ModelAndView toAdd(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeActivity/addStoreActivity");
		Store store = new Store();
		if(!Utils.isSuperAdmin(request))
 		{store.setOwnerUserId(Utils.getLoginUserInfoId(request));}
		mv.addObject("store", storeService.listByCondition(store));
		mv.addObject("activity", activityService.listByCondition(null));
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowStoreActivity")
	public ModelAndView toShow(String key){
		StoreActivity entity = storeActivityService.getByPrimaryKey(key);
		Map<String,String> storeActivity = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/store/storeActivity/showStoreActivity","storeActivity",storeActivity );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param storeActivity StoreActivity:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addStoreActivity")
	public void add(StoreActivity storeActivity,HttpServletRequest request,HttpServletResponse response){
	storeActivity.setStoreActivityId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,storeActivityService.add(storeActivity));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteStoreActivity")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			storeActivityService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListStoreActivity")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeActivity/listStoreActivity");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param storeActivity StoreActivity：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listStoreActivity")
	public void listByCondition(StoreActivity storeActivity,HttpServletRequest request,
			HttpServletResponse response, Page page){
		storeActivity.setPage(page);	
		List<StoreActivity> list = storeActivityService.listByCondition(storeActivity);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditStoreActivity")
	public ModelAndView toEdit(String key,HttpServletRequest request){
		StoreActivity entity = storeActivityService.getByPrimaryKey(key);
		Map<String,String> storeActivity = FormatEntity.getObjectValue(entity);
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeActivity/editStoreActivity","storeActivity",storeActivity);
		Store store = new Store();
		if(!Utils.isSuperAdmin(request))
 		{store.setOwnerUserId(Utils.getLoginUserInfoId(request));}
		mv.addObject("store", storeService.listByCondition(store));
		mv.addObject("activity", activityService.listByCondition(null));
		return mv;
	}
	
	/**
	 * 修改方法
	 * @param storeActivity StoreActivity：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateStoreActivity")
	public void update(StoreActivity storeActivity,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,storeActivityService.update(storeActivity));	
	}
	
}