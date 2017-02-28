package com.dongnao.workbench.store.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：店铺活动模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class StoreActivity extends Model{
	
	
		            /**
	                 * 店铺活动ID(主键)
	                 **/
				   			private String storeActivityId;
		   		
		            /**
	                 * 店铺ID
	                 **/
				   			private String storeId;
				   			private String storeName;
				   			private String ownerUserId;
		   		
		            /**
	                 * 活动ID
	                 **/	private String activityType;
				   			private String activityId;
				   			private String activityName;
		   		
		            /**
	                 * 活动起始时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd") 
						private Date activityTimeBegin;
		
		            /**
	                 * 活动结束时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd") 
						private Date activityTimeEnd;
		
		            /**
	                 * 活动预算费用
	                 **/
				   			private String activityExpectedBudget;
		   		
		            /**
	                 * 活动预计回报
	                 **/
				   			private String activityExpectedReturn;
		   		
		            /**
	                 * 活动状态
	                 **/
				   			private String activityStatus;
		   		
		            /**
	                 * 活动实际价值
	                 **/
				   			private String activityActualProfit;
		   		
		            /**
	                 * 活动执行人
	                 **/
				   			private String activityExecutor;
		   		
		            /**
	                 * 活动执行时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd") 
						private Date activityExecuteTime;
		
	
				
		  			/**
			 * 获取 店铺活动ID(主键)
			 * @return String this.storeActivityId
			 */
			public String getStoreActivityId(){
				return this.storeActivityId;
			}
			
			/**
			 * 设置 店铺活动ID(主键)
			 * @param String storeActivityId 
			 */
			public void setStoreActivityId(String storeActivityId){
				this.storeActivityId = storeActivityId;
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
		   		
		
		
			
						
		  			public String getOwnerUserId() {
				return ownerUserId;
			}

			public void setOwnerUserId(String ownerUserId) {
				this.ownerUserId = ownerUserId;
			}

					/**
			 * 获取 活动ID
			 * @return String this.activityId
			 */
			public String getActivityId(){
				return this.activityId;
			}
			
			public String getActivityType() {
						return activityType;
					}

					public void setActivityType(String activityType) {
						this.activityType = activityType;
					}

			/**
			 * 设置 活动ID
			 * @param String activityId 
			 */
			public void setActivityId(String activityId){
				this.activityId = activityId;
			}
		   		
		
		
			
								/**
			 * 获取 活动起始时间
			 * @return Date this.activityTimeBegin
			 */
			public Date getActivityTimeBegin(){
				return this.activityTimeBegin;
			}
			
			/**
			 * 设置 活动起始时间
			 * @param Date activityTimeBegin 
			 */
			public void setActivityTimeBegin(Date activityTimeBegin){
				this.activityTimeBegin = activityTimeBegin;
			}
								/**
			 * 获取 活动结束时间
			 * @return Date this.activityTimeEnd
			 */
			public Date getActivityTimeEnd(){
				return this.activityTimeEnd;
			}
			
			/**
			 * 设置 活动结束时间
			 * @param Date activityTimeEnd 
			 */
			public void setActivityTimeEnd(Date activityTimeEnd){
				this.activityTimeEnd = activityTimeEnd;
			}
						
		  			/**
			 * 获取 活动预算费用
			 * @return String this.activityExpectedBudget
			 */
			public String getActivityExpectedBudget(){
				return this.activityExpectedBudget;
			}
			
			/**
			 * 设置 活动预算费用
			 * @param String activityExpectedBudget 
			 */
			public void setActivityExpectedBudget(String activityExpectedBudget){
				this.activityExpectedBudget = activityExpectedBudget;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动预计回报
			 * @return String this.activityExpectedReturn
			 */
			public String getActivityExpectedReturn(){
				return this.activityExpectedReturn;
			}
			
			/**
			 * 设置 活动预计回报
			 * @param String activityExpectedReturn 
			 */
			public void setActivityExpectedReturn(String activityExpectedReturn){
				this.activityExpectedReturn = activityExpectedReturn;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动状态
			 * @return String this.activityStatus
			 */
			public String getActivityStatus(){
				return this.activityStatus;
			}
			
			/**
			 * 设置 活动状态
			 * @param String activityStatus 
			 */
			public void setActivityStatus(String activityStatus){
				this.activityStatus = activityStatus;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动实际价值
			 * @return String this.activityActualProfit
			 */
			public String getActivityActualProfit(){
				return this.activityActualProfit;
			}
			
			/**
			 * 设置 活动实际价值
			 * @param String activityActualProfit 
			 */
			public void setActivityActualProfit(String activityActualProfit){
				this.activityActualProfit = activityActualProfit;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 活动执行人
			 * @return String this.activityExecutor
			 */
			public String getActivityExecutor(){
				return this.activityExecutor;
			}
			
			/**
			 * 设置 活动执行人
			 * @param String activityExecutor 
			 */
			public void setActivityExecutor(String activityExecutor){
				this.activityExecutor = activityExecutor;
			}
		   		
		
		
			
								/**
			 * 获取 活动执行时间
			 * @return Date this.activityExecuteTime
			 */
			public Date getActivityExecuteTime(){
				return this.activityExecuteTime;
			}
			
			/**
			 * 设置 活动执行时间
			 * @param Date activityExecuteTime 
			 */
			public void setActivityExecuteTime(Date activityExecuteTime){
				this.activityExecuteTime = activityExecuteTime;
			}

			public String getStoreName() {
				return storeName;
			}

			public void setStoreName(String storeName) {
				this.storeName = storeName;
			}

			public String getActivityName() {
				return activityName;
			}

			public void setActivityName(String activityName) {
				this.activityName = activityName;
			}
			}