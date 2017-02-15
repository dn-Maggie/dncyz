package com.dongnao.workbench.activity.controller;

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
import com.dongnao.workbench.activity.model.Activity;
import com.dongnao.workbench.activity.service.ActivityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：近期活动模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-14
 */
 
@Controller
@RequestMapping("activity")
public class ActivityController{
         @Resource
	private ActivityService activityService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddActivity")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/activity/activity/addActivity");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowActivity")
	public ModelAndView toShow(String key){
		Activity entity = activityService.getByPrimaryKey(key);
		Map<String,String> activity = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/activity/activity/showActivity","activity",activity );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param activity Activity:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addActivity")
	public void add(Activity activity,HttpServletRequest request,HttpServletResponse response){
	activity.setActivityId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,activityService.add(activity));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteActivity")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			activityService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListActivity")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/activity/activity/listActivity");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param activity Activity：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listActivity")
	public void listByCondition(Activity activity,HttpServletRequest request,
			HttpServletResponse response, Page page){
		activity.setPage(page);	
		List<Activity> list = activityService.listByCondition(activity);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditActivity")
	public ModelAndView toEdit(String key){
		Activity entity = activityService.getByPrimaryKey(key);
		Map<String,String> activity = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/activity/activity/editActivity","activity",activity );
	}
	
	/**
	 * 修改方法
	 * @param activity Activity：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateActivity")
	public void update(Activity activity,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,activityService.update(activity));	
	}
	
}