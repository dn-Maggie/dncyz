package com.dongnao.workbench.basic.controller;

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
import com.dongnao.workbench.basic.model.Brand;
import com.dongnao.workbench.basic.service.BrandService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：餐饮品牌模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("brand")
public class BrandController{
         @Resource
	private BrandService brandService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddBrand")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/basic/brand/addBrand");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowBrand")
	public ModelAndView toShow(String key){
		Brand entity = brandService.getByPrimaryKey(key);
		Map<String,String> brand = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/basic/brand/showBrand","brand",brand );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param brand Brand:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addBrand")
	public void add(Brand brand,HttpServletRequest request,HttpServletResponse response){
	brand.setBrandId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,brandService.add(brand));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteBrand")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			brandService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListBrand")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/basic/brand/listBrand");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param brand Brand：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listBrand")
	public void listByCondition(Brand brand,HttpServletRequest request,
			HttpServletResponse response, Page page){
		brand.setPage(page);	
		List<Brand> list = brandService.listByCondition(brand);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditBrand")
	public ModelAndView toEdit(String key){
		Brand entity = brandService.getByPrimaryKey(key);
		Map<String,String> brand = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/basic/brand/editBrand","brand",brand );
	}
	
	/**
	 * 修改方法
	 * @param brand Brand：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateBrand")
	public void update(Brand brand,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,brandService.update(brand));	
	}
	
}