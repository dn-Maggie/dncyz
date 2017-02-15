package com.dongnao.workbench.store.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：店铺评价模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class StoreEvaluate extends Model{
	
	
		            /**
	                 * 评价ID(主键)
	                 **/
				   			private String evaluateId;
		   		
		            /**
	                 * 评价产品ID
	                 **/
				   			private String productId;
				   			private String productName;
		   		
		            /**
	                 * 渠道ID
	                 **/
				   			private String channelId;
				   			private String channelName;
		   		
		            /**
	                 * 星级
	                 **/
				   			private Integer starLevel;
		   		
		            /**
	                 * 评价内容
	                 **/
				   			private String evaluateContent;
		   		
		            /**
	                 * 回复内容
	                 **/
				   			private String replyContent;
		   		
	
				
		  			/**
			 * 获取 评价ID(主键)
			 * @return String this.evaluateId
			 */
			public String getEvaluateId(){
				return this.evaluateId;
			}
			
			/**
			 * 设置 评价ID(主键)
			 * @param String evaluateId 
			 */
			public void setEvaluateId(String evaluateId){
				this.evaluateId = evaluateId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 评价产品ID
			 * @return String this.productId
			 */
			public String getProductId(){
				return this.productId;
			}
			
			/**
			 * 设置 评价产品ID
			 * @param String productId 
			 */
			public void setProductId(String productId){
				this.productId = productId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 渠道ID
			 * @return String this.channelId
			 */
			public String getChannelId(){
				return this.channelId;
			}
			
			/**
			 * 设置 渠道ID
			 * @param String channelId 
			 */
			public void setChannelId(String channelId){
				this.channelId = channelId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 星级
			 * @return Integer this.starLevel
			 */
			public Integer getStarLevel(){
				return this.starLevel;
			}
			
			/**
			 * 设置 星级
			 * @param BigDecimal starLevel 
			 */
			public void setStarLevel(Integer starLevel){
				this.starLevel = starLevel;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 评价内容
			 * @return String this.evaluateContent
			 */
			public String getEvaluateContent(){
				return this.evaluateContent;
			}
			
			/**
			 * 设置 评价内容
			 * @param String evaluateContent 
			 */
			public void setEvaluateContent(String evaluateContent){
				this.evaluateContent = evaluateContent;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 回复内容
			 * @return String this.replyContent
			 */
			public String getReplyContent(){
				return this.replyContent;
			}
			
			/**
			 * 设置 回复内容
			 * @param String replyContent 
			 */
			public void setReplyContent(String replyContent){
				this.replyContent = replyContent;
			}

			public String getProductName() {
				return productName;
			}

			public void setProductName(String productName) {
				this.productName = productName;
			}

			public String getChannelName() {
				return channelName;
			}

			public void setChannelName(String channelName) {
				this.channelName = channelName;
			}
		   		
		
		
			
			}