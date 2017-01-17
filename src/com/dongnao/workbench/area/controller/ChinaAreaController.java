package com.dongnao.workbench.area.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongnao.workbench.area.model.ChinaArea;
import com.dongnao.workbench.area.service.ChinaAreaService;


/**
 * 描述：省市区地域模块controller类，负责页面分发与跳转
 * 
 * @author fan.yang
 * @version 1.0 2016-05-10
 */
 
@Controller
@RequestMapping("chinaArea")
public class ChinaAreaController{
         @Resource
	private ChinaAreaService chinaAreaService;
	 
	
	/**
	 * 
	 * @param pid String：父级区域的id
	 * @return List<ChinaArea>根据pid查询出来的结果，最终以json格式相应客户端
	 */	
	@RequestMapping("/loadAreaByParent")
	public @ResponseBody List<ChinaArea> loadAreaByParent(Integer pid){
		if(pid==null){
			pid = 0;
		}
		return chinaAreaService.loadAreaByParent(pid);
	}	
}