package com.dongnao.workbench.order.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：订单产品详细模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class ProductList extends Model{
	
	
		            /**
	                 * 订单产品列表ID(主键)
	                 **/
				   			private String productListId;
		   		
		            /**
	                 * 订单ID
	                 **/
				   			private String orderId;
		   		
		            /**
	                 * 产品ID
	                 **/
				   			private String productId;
		   		
		            /**
	                 * 数量
	                 **/
				   			private Integer productCount;
		   		
		            /**
	                 * 单价
	                 **/
				   			private String productUnitPrice;
		   		
		            /**
	                 * 金额
	                 **/
				   			private String productCost;
		   		
		            /**
	                 * 订单产品列表状态
	                 **/
				   			private String productListStatus;
		   		
	
				
		  			/**
			 * 获取 订单产品列表ID(主键)
			 * @return String this.productListId
			 */
			public String getProductListId(){
				return this.productListId;
			}
			
			/**
			 * 设置 订单产品列表ID(主键)
			 * @param String productListId 
			 */
			public void setProductListId(String productListId){
				this.productListId = productListId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单ID
			 * @return String this.orderId
			 */
			public String getOrderId(){
				return this.orderId;
			}
			
			/**
			 * 设置 订单ID
			 * @param String orderId 
			 */
			public void setOrderId(String orderId){
				this.orderId = orderId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 产品ID
			 * @return String this.productId
			 */
			public String getProductId(){
				return this.productId;
			}
			
			/**
			 * 设置 产品ID
			 * @param String productId 
			 */
			public void setProductId(String productId){
				this.productId = productId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 数量
			 * @return Integer this.productCount
			 */
			public Integer getProductCount(){
				return this.productCount;
			}
			
			/**
			 * 设置 数量
			 * @param BigDecimal productCount 
			 */
			public void setProductCount(Integer productCount){
				this.productCount = productCount;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 单价
			 * @return String this.productUnitPrice
			 */
			public String getProductUnitPrice(){
				return this.productUnitPrice;
			}
			
			/**
			 * 设置 单价
			 * @param String productUnitPrice 
			 */
			public void setProductUnitPrice(String productUnitPrice){
				this.productUnitPrice = productUnitPrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 金额
			 * @return String this.productCost
			 */
			public String getProductCost(){
				return this.productCost;
			}
			
			/**
			 * 设置 金额
			 * @param String productCost 
			 */
			public void setProductCost(String productCost){
				this.productCost = productCost;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单产品列表状态
			 * @return String this.productListStatus
			 */
			public String getProductListStatus(){
				return this.productListStatus;
			}
			
			/**
			 * 设置 订单产品列表状态
			 * @param String productListStatus 
			 */
			public void setProductListStatus(String productListStatus){
				this.productListStatus = productListStatus;
			}
		   		
		
		
			
			}