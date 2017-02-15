package com.dongnao.workbench.activity.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：近期活动模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-14
 */
public class Activity extends Model{
	
	
		            /**
	                 * 活动ID(主键)
	                 **/
				   			private String activityId;
		   		
		            /**
	                 * 活动名称
	                 **/
				   			private String activityName;
		   		
		            /**
	                 * 活动类型
	                 **/
				   			private String activityType;
		   		
		            /**
	                 * 活动描述
	                 **/
				   			private String activityDesc;
		   		
		            /**
	                 * 活动预计价值
	                 **/
				   			private String activityExpectedProfit;
		   		
	
				
		  			/**
			 * 获取 活动ID(主键)
			 * @return String this.activityId
			 */
			public String getActivityId(){
				return this.activityId;
			}
			
			/**
			 * 设置 活动ID(主键)
			 * @param String activityId 
			 */
			public void setActivityId(String activityId){
				this.activityId = activityId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动名称
			 * @return String this.activityName
			 */
			public String getActivityName(){
				return this.activityName;
			}
			
			/**
			 * 设置 活动名称
			 * @param String activityName 
			 */
			public void setActivityName(String activityName){
				this.activityName = activityName;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动类型
			 * @return String this.activityType
			 */
			public String getActivityType(){
				return this.activityType;
			}
			
			/**
			 * 设置 活动类型
			 * @param String activityType 
			 */
			public void setActivityType(String activityType){
				this.activityType = activityType;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动描述
			 * @return String this.activityDesc
			 */
			public String getActivityDesc(){
				return this.activityDesc;
			}
			
			/**
			 * 设置 活动描述
			 * @param String activityDesc 
			 */
			public void setActivityDesc(String activityDesc){
				this.activityDesc = activityDesc;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动预计价值
			 * @return String this.activityExpectedProfit
			 */
			public String getActivityExpectedProfit(){
				return this.activityExpectedProfit;
			}
			
			/**
			 * 设置 活动预计价值
			 * @param String activityExpectedProfit 
			 */
			public void setActivityExpectedProfit(String activityExpectedProfit){
				this.activityExpectedProfit = activityExpectedProfit;
			}
		   		
		
		
			
			}