package com.dongnao.workbench.store.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：店铺健康率模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class StoreHealth extends Model{
	
	
		            /**
	                 * 健康ID(主键)
	                 **/
				   			private String healthId;
		   		
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
	                 * 评估时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
			private Date assessDate;
		
		            /**
	                 * 评估人
	                 **/
				   			private String assessors;
		   		
		            /**
	                 * 健康值
	                 **/
				   			private Integer healthValue;
		   		
	
				
		  			/**
			 * 获取 健康ID(主键)
			 * @return String this.healthId
			 */
			public String getHealthId(){
				return this.healthId;
			}
			
			/**
			 * 设置 健康ID(主键)
			 * @param String healthId 
			 */
			public void setHealthId(String healthId){
				this.healthId = healthId;
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
			 * 获取 评估时间
			 * @return Date this.assessDate
			 */
			public Date getAssessDate(){
				return this.assessDate;
			}
			
			/**
			 * 设置 评估时间
			 * @param Date assessDate 
			 */
			public void setAssessDate(Date assessDate){
				this.assessDate = assessDate;
			}
						
		  			/**
			 * 获取 评估人
			 * @return String this.assessors
			 */
			public String getAssessors(){
				return this.assessors;
			}
			
			/**
			 * 设置 评估人
			 * @param String assessors 
			 */
			public void setAssessors(String assessors){
				this.assessors = assessors;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 健康值
			 * @return Integer this.healthValue
			 */
			public Integer getHealthValue(){
				return this.healthValue;
			}
			
			/**
			 * 设置 健康值
			 * @param BigDecimal healthValue 
			 */
			public void setHealthValue(Integer healthValue){
				this.healthValue = healthValue;
			}
		  		
		
		
			
			}