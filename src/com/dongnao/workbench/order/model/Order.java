package com.dongnao.workbench.order.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：订单模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class Order extends Model{
	
	
		            /**
	                 * 订单ID(主键)
	                 **/
				   			private String orderId;
		   		
		            /**
	                 * 订单来源,来自数据字典
	                 **/
				   			private String orderSource;
		   		
		            /**
	                 * 店铺ID
	                 **/
				   			private String storeId;
				   			private String storeName;
		   		
		            public String getStoreName() {
								return storeName;
							}

							public void setStoreName(String storeName) {
								this.storeName = storeName;
							}

					/**
	                 * 订单时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
							private Date orderTime;
		
		            /**
	                 * 订单人
	                 **/
				   			private String orderPersonName;
		   		
		            /**
	                 * 订单人电话
	                 **/
				   			private String orderPersonTel;
		   		
		            /**
	                 * 订单产品列表ID
	                 **/
				   			private String productListId;
		   		
		            /**
	                 * 配送费
	                 **/
				   			private String deliveryCost;
		   		
		            /**
	                 * 餐盒费
	                 **/
				   			private String foodboxCost;
		   		
		            /**
	                 * 立减优惠
	                 **/
				   			private String privilege;
		   		
		            /**
	                 * 红包抵扣
	                 **/
				   			private String deduction;
		   		
		            /**
	                 * 订单状态
	                 **/
				   			private String orderStatus;
		   		
	
				
		  			/**
			 * 获取 订单ID(主键)
			 * @return String this.orderId
			 */
			public String getOrderId(){
				return this.orderId;
			}
			
			/**
			 * 设置 订单ID(主键)
			 * @param String orderId 
			 */
			public void setOrderId(String orderId){
				this.orderId = orderId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单来源,来自数据字典
			 * @return String this.orderSource
			 */
			public String getOrderSource(){
				return this.orderSource;
			}
			
			/**
			 * 设置 订单来源,来自数据字典
			 * @param String orderSource 
			 */
			public void setOrderSource(String orderSource){
				this.orderSource = orderSource;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 店铺ID
			 * @return String this.storeId
			 */
			public String getStoreId(){
				return this.storeId;
			}
			
			/**
			 * 设置 店铺ID
			 * @param String storeId 
			 */
			public void setStoreId(String storeId){
				this.storeId = storeId;
			}
		   		
		
		
			
								/**
			 * 获取 订单时间
			 * @return Date this.orderTime
			 */
			public Date getOrderTime(){
				return this.orderTime;
			}
			
			/**
			 * 设置 订单时间
			 * @param Date orderTime 
			 */
			public void setOrderTime(Date orderTime){
				this.orderTime = orderTime;
			}
						
		  			/**
			 * 获取 订单人
			 * @return String this.orderPersonName
			 */
			public String getOrderPersonName(){
				return this.orderPersonName;
			}
			
			/**
			 * 设置 订单人
			 * @param String orderPersonName 
			 */
			public void setOrderPersonName(String orderPersonName){
				this.orderPersonName = orderPersonName;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单人电话
			 * @return String this.orderPersonTel
			 */
			public String getOrderPersonTel(){
				return this.orderPersonTel;
			}
			
			/**
			 * 设置 订单人电话
			 * @param String orderPersonTel 
			 */
			public void setOrderPersonTel(String orderPersonTel){
				this.orderPersonTel = orderPersonTel;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单产品列表ID
			 * @return String this.productListId
			 */
			public String getProductListId(){
				return this.productListId;
			}
			
			/**
			 * 设置 订单产品列表ID
			 * @param String productListId 
			 */
			public void setProductListId(String productListId){
				this.productListId = productListId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 配送费
			 * @return String this.deliveryCost
			 */
			public String getDeliveryCost(){
				return this.deliveryCost;
			}
			
			/**
			 * 设置 配送费
			 * @param String deliveryCost 
			 */
			public void setDeliveryCost(String deliveryCost){
				this.deliveryCost = deliveryCost;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 餐盒费
			 * @return String this.foodboxCost
			 */
			public String getFoodboxCost(){
				return this.foodboxCost;
			}
			
			/**
			 * 设置 餐盒费
			 * @param String foodboxCost 
			 */
			public void setFoodboxCost(String foodboxCost){
				this.foodboxCost = foodboxCost;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 立减优惠
			 * @return String this.privilege
			 */
			public String getPrivilege(){
				return this.privilege;
			}
			
			/**
			 * 设置 立减优惠
			 * @param String privilege 
			 */
			public void setPrivilege(String privilege){
				this.privilege = privilege;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 红包抵扣
			 * @return String this.deduction
			 */
			public String getDeduction(){
				return this.deduction;
			}
			
			/**
			 * 设置 红包抵扣
			 * @param String deduction 
			 */
			public void setDeduction(String deduction){
				this.deduction = deduction;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单状态
			 * @return String this.orderStatus
			 */
			public String getOrderStatus(){
				return this.orderStatus;
			}
			
			/**
			 * 设置 订单状态
			 * @param String orderStatus 
			 */
			public void setOrderStatus(String orderStatus){
				this.orderStatus = orderStatus;
			}
		   		
		
		
			
			}