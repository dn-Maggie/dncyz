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
import com.dongnao.workbench.store.model.StoreEvaluate;
import com.dongnao.workbench.store.service.StoreEvaluateService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：店铺评价模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("storeEvaluate")
public class StoreEvaluateController{
    @Resource
	private StoreEvaluateService storeEvaluateService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddStoreEvaluate")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeEvaluate/addStoreEvaluate");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowStoreEvaluate")
	public ModelAndView toShow(String key){
		StoreEvaluate entity = storeEvaluateService.getByPrimaryKey(key);
		Map<String,String> storeEvaluate = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/store/storeEvaluate/showStoreEvaluate","storeEvaluate",storeEvaluate );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param storeEvaluate StoreEvaluate:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addStoreEvaluate")
	public void add(StoreEvaluate storeEvaluate,HttpServletRequest request,HttpServletResponse response){
	storeEvaluate.setEvaluateId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,storeEvaluateService.add(storeEvaluate));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteStoreEvaluate")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			storeEvaluateService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListStoreEvaluate")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/storeEvaluate/listStoreEvaluate");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param storeEvaluate StoreEvaluate：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listStoreEvaluate")
	public void listByCondition(StoreEvaluate storeEvaluate,HttpServletRequest request,
			HttpServletResponse response, Page page){
		storeEvaluate.setPage(page);	
		List<StoreEvaluate> list = storeEvaluateService.listByCondition(storeEvaluate);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditStoreEvaluate")
	public ModelAndView toEdit(String key){
		StoreEvaluate entity = storeEvaluateService.getByPrimaryKey(key);
		Map<String,String> storeEvaluate = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/store/storeEvaluate/editStoreEvaluate","storeEvaluate",storeEvaluate );
	}
	
	/**
	 * 修改方法
	 * @param storeEvaluate StoreEvaluate：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateStoreEvaluate")
	public void update(StoreEvaluate storeEvaluate,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,storeEvaluateService.update(storeEvaluate));	
	}
	
}