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

import net.sf.json.JSONException;
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
	
	@RequestMapping("/testOrderJson")
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
	        System.out.println(jsonObj.get("result"));
	        AjaxUtils.sendAjaxForObject(response,jsonObj);	
		}
	}
	
	@RequestMapping("/testOrder")
	public void testOrderJson(HttpServletRequest request,HttpServletResponse response){
		StringBuilder buffer = new StringBuilder();
		/*String str1 = "{\"id\":\"1f0f702e-17c1-4e90-bc21-b1706b9f8670\",\"ncp\":\"2.0.0\",\"result\":[{\"activeTime\":\"2017-03-02T16:40:17\",\"activities\":[{\"amount\":-20.0,\"categoryId\":12,\"elemePart\":0.0,\"name\":\"(不与美食活动同享)在线支付立减优惠\",\"restaurantPart\":0.0}],";
		String str2 = "\"activityTotal\":-20.0,\"anonymousOrder\":false,\"bookedTime\":\"2017-03-01T14:45:00\",\"callDeliveryType\":\"DISABLE\",\"consigneeAddress\":\"长远大厦风火林网咖22号机\",";
		String str3 = "\"consigneeName\":\"徐明昊先生\",\"consigneePhones\":[\"13365853748\"],\"consigneeSecretPhones\":[\"13365853748\"],\"customerActualFee\":9.0,\"daySn\":5,\"deliveryCost\":9.0,\"deliveryFee\":9.0,\"deliveryFeeTotal\":9.0,\"deliveryServiceType\":\"CROWD\",\"distance\":\"1.93km\",\"downgraded\":false,";
		String str4 = "\"elemeActivityPart\":-14.0,\"elemeActivityPartPositive\":14.0,\"elemeMerchantSubsidy\":0.0,\"elemePart\":-14.0,\"expectDeliveryCost\":0.0,\"expectDeliveryCostDetail\":[],\"expectDeliveryCostForDetail\":0.0,";
		String str5 = "\"feedbackStatus\":\"WAITING\",\"followed\":false,\"goodsSummary\":\"共3件商品\",\"goodsTotal\":53.0,\"goodsTotalWithoutPackage\":50.0,\"groups\":[{\"items\":[{\"additions\":[],\"categoryId\":1,\"discount\":0.0,\"displayQuantity\":true,\"id\":155839050,\"name\":\"掌中宝\",\"price\":20.0,"; 
		String str6 = "\"quantity\":1,\"skuId\":103099203356,\"total\":20.0},{\"additions\":[],\"categoryId\":1,\"discount\":0.0,\"displayQuantity\":true,\"id\":509416883,\"name\":\"富得流油（牛油）\",\"price\":20.0,\"quantity\":1,\"skuId\":122002888476,\"total\":20.0},{\"additions\":[],\"categoryId\":1,\"discount\":0.0,";
		String str7 = "\"displayQuantity\":true,\"id\":170745348,\"name\":\"猿粉\",\"price\":10.0,\"quantity\":1,\"skuId\":103099223836,\"total\":10.0}],\"name\":\"1号篮子\",\"type\":\"NORMAL\"},{\"items\":[{\"additions\":[],\"categoryId\":102,\"discount\":0.0,\"displayQuantity\":false,\"id\":-70000,\"name\":\"餐盒\",\"price\":3.0,\"quantity\":1,\"skuId\":-1,\"total\":3.0}],\"name\":\"其它费用\",\"type\":\"EXTRA\"}],";
		String str8 = "\"headPromptForApp\":[{\"bgColor\":\"#424242\",\"fgColor\":\"#FFFFFF\",\"text\":\"[预]\"},{\"bgColor\":\"#424242\",\"fgColor\":\"#FF9800\",\"text\":\"今日17:45\"},{\"bgColor\":\"#424242\",\"fgColor\":\"#FFFFFF\",\"text\":\"送达\"}],\"headPromptForPC\":\"<fontcolor='#333333'bgcolor='#FFFFFF'>[预]<fontcolor='#FF6D00'>今日17:45</font>送达</font>\",\"hongbao\":0.0,\"id\":\"";
		String str9 = "120197759970082" +new java.util.Random().nextInt(2215);
		String str10 = "\",\"income\":53.65,\"merchantActivities\":[{\"amount\":-20.0,\"categoryId\":12,\"elemePart\":0.0,\"name\":\"(不与美食活动同享)在线支付立减优惠\",\"restaurantPart\":0.0}],\"merchantActivityPart\":-6.0,\"merchantDeliverySubsidy\":0.0,\"orderLatestStatus\":\"等待接单\",\"orderTraceButton\":\"NONE\",";
		String str11 = "\"orderTraceRenderViews\":[],\"orderType\":\"BOOKING\",\"packageFee\":3.0,\"payAmount\":42.0,\"payment\":\"ONLINE\",\"paymentStatus\":\"SUCCESS\",\"phoneAlertDescription\":\"\",";
		String str12 = "\"remark\":\"\",\"restaurantName\":\"猿串（解放西路店）\",\"restaurantPart\":-6.0,\"secretPhoneExpireTime\":\"2017-03-02T20:45:00\",\"serviceFee\":-2.35,\"serviceRate\":0.05,\"shopId\":848415,\"shopName\":\"猿串（解放西路店）\",\"showAgreeCancelOrderButton\":false,\"showAgreeRefundOrderButton\":false,\"showConfirmOrderButton\":true,";
		String str13 = "\"showDeliveryBySelfOnCancelled\":false,\"showDisagreeCancelOrderButton\":false,\"showDisagreeRefundOrderButton\":false,\"showInvalidOrderButton\":true,\"showNoMoreDeliveryButton\":false,\"showPrintOrderButton\":false,\"showReadCancelOrderButton\":false,\"showReadExceptionOrderButton\":false,\"showSetDeliveryBySelfButton\":false,\"status\":\"UNPROCESSED\",\"times\":6,\"tips\":[{\"backColor\":\"#ffb651\",";
		String str14 = "\"content\":\"预订单，请于03-0217:45送达\",\"contentColor\":\"#ffffff\",\"priority\":200,\"tipCategory\":\"NOTICE\"}],\"userTips\":[{\"backColor\":\"#FFFFFF\",\"content\":\"第6次下单\",\"contentColor\":\"#999999\",\"priority\":-1,\"tipCategory\":\"TIP\"}],\"vipDeliveryFeeDiscount\":0.0}]}";
		buffer.append(str1+str2+str3+str4+str5+str6+str7+str8+str9+str10+str11+str12+str13+str14);*/
		buffer.append("用左脑编程，用右脑写诗");
		JSONObject jsonObj = JSONObject.fromObject(buffer.toString());
        AjaxUtils.sendAjaxForObject(response,jsonObj);	
	}
	
}