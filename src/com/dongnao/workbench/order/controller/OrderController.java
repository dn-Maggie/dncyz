package com.dongnao.workbench.order.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.order.model.Order;
import com.dongnao.workbench.order.service.OrderService;

import net.sf.json.JSONObject;


/**
 * 描述：订单模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("order")
public class OrderController{
         @Resource
	private OrderService orderService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddOrder")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/order/order/addOrder");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowOrder")
	public ModelAndView toShow(String key){
		Order entity = orderService.getByPrimaryKey(key);
		Map<String,String> order = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/order/order/showOrder","order",order );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param order Order:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addOrder")
	public void add(Order order,HttpServletRequest request,HttpServletResponse response){
	order.setOrderId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,orderService.add(order));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteOrder")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			orderService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListOrder")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/order/order/listOrder");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param order Order：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listOrder")
	public void listByCondition(Order order,HttpServletRequest request,
			HttpServletResponse response, Page page){
		order.setPage(page);	
		List<Order> list = orderService.listByCondition(order);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditOrder")
	public ModelAndView toEdit(String key){
		Order entity = orderService.getByPrimaryKey(key);
		Map<String,String> order = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/order/order/editOrder","order",order );
	}
	
	/**
	 * 修改方法
	 * @param order Order：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateOrder")
	public void update(Order order,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,orderService.update(order));	
	}
	
	@RequestMapping("/testOrder")
	public void test(HttpServletRequest request,HttpServletResponse response){
		int a = new java.util.Random().nextInt(10);
		if(a%10>5){
			//返回某个订单
			int b = new java.util.Random().nextInt(10);
			//b+".json"
			String fullFileName = "E:/"+b+".json";
			File file = new File(fullFileName);
	        Scanner scanner = null;
	        StringBuilder buffer = new StringBuilder();
	        try {
	            scanner = new Scanner(file, "utf-8");
	            while (scanner.hasNextLine()) {
	                buffer.append(scanner.nextLine());
	            }
	        } catch (FileNotFoundException e) {
	            // TODO Auto-generated catch block  
	        } finally {
	            if (scanner != null) {
	                scanner.close();
	            }
	        }
	        JSONObject jsonObj = JSONObject.fromObject(buffer.toString());
	        AjaxUtils.sendAjaxForObject(response,jsonObj);	
		}else{
			String fullFileName = "E:/null.json";
			File file = new File(fullFileName);
	        Scanner scanner = null;
	        StringBuilder buffer = new StringBuilder();
	        try {
	            scanner = new Scanner(file, "utf-8");
	            while (scanner.hasNextLine()) {
	                buffer.append(scanner.nextLine());
	            }
	 
	        } catch (FileNotFoundException e) {
	            // TODO Auto-generated catch block  
	 
	        } finally {
	            if (scanner != null) {
	                scanner.close();
	            }
	        }
	        JSONObject jsonObj = JSONObject.fromObject(buffer.toString());
	        AjaxUtils.sendAjaxForObject(response,jsonObj);	
		}
	}
}