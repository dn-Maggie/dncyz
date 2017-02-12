package com.dongnao.workbench.order.controller;

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
import com.dongnao.workbench.order.model.ProductList;
import com.dongnao.workbench.order.service.ProductListService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：订单产品详细模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("productList")
public class ProductListController{
         @Resource
	private ProductListService productListService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddProductList")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/order/productList/addProductList");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowProductList")
	public ModelAndView toShow(String key){
		ProductList entity = productListService.getByPrimaryKey(key);
		Map<String,String> productList = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/order/productList/showProductList","productList",productList );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param productList ProductList:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addProductList")
	public void add(ProductList productList,HttpServletRequest request,HttpServletResponse response){
	productList.setProductListId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,productListService.add(productList));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteProductList")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			productListService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListProductList")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/order/productList/listProductList");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param productList ProductList：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listProductList")
	public void listByCondition(ProductList productList,HttpServletRequest request,
			HttpServletResponse response, Page page){
		productList.setPage(page);	
		List<ProductList> list = productListService.listByCondition(productList);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditProductList")
	public ModelAndView toEdit(String key){
		ProductList entity = productListService.getByPrimaryKey(key);
		Map<String,String> productList = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/order/productList/editProductList","productList",productList );
	}
	
	/**
	 * 修改方法
	 * @param productList ProductList：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateProductList")
	public void update(ProductList productList,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,productListService.update(productList));	
	}
	
}