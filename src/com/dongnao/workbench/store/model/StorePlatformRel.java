package com.dongnao.workbench.store.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：商铺外卖平台关系模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class StorePlatformRel extends Model{
	
	
		            /**
	                 * 关联ID（主键）
	                 **/
				   			private String relId;
		   		
		            /**
	                 * 店铺ID(主键)
	                 **/
				   			private String storeId;
		   		
		            /**
	                 * 店铺名称
	                 **/
				   			private String storeName;
		   		
		            /**
	                 * 平台ID（主键）
	                 **/
				   			private String platformId;
		   		
		            /**
	                 * 平台编码（BD：百度外卖，MT：美团外卖，ELM：饿了么外卖）
	                 **/
				   			private String platformCode;
		   		
	
				
		  			/**
			 * 获取 关联ID（主键）
			 * @return String this.relId
			 */
			public String getRelId(){
				return this.relId;
			}
			
			/**
			 * 设置 关联ID（主键）
			 * @param String relId 
			 */
			public void setRelId(String relId){
				this.relId = relId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 店铺ID(主键)
			 * @return String this.storeId
			 */
			public String getStoreId(){
				return this.storeId;
			}
			
			/**
			 * 设置 店铺ID(主键)
			 * @param String storeId 
			 */
			public void setStoreId(String storeId){
				this.storeId = storeId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 店铺名称
			 * @return String this.storeName
			 */
			public String getStoreName(){
				return this.storeName;
			}
			
			/**
			 * 设置 店铺名称
			 * @param String storeName 
			 */
			public void setStoreName(String storeName){
				this.storeName = storeName;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台ID（主键）
			 * @return String this.platformId
			 */
			public String getPlatformId(){
				return this.platformId;
			}
			
			/**
			 * 设置 平台ID（主键）
			 * @param String platformId 
			 */
			public void setPlatformId(String platformId){
				this.platformId = platformId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台编码（BD：百度外卖，MT：美团外卖，ELM：饿了么外卖）
			 * @return String this.platformCode
			 */
			public String getPlatformCode(){
				return this.platformCode;
			}
			
			/**
			 * 设置 平台编码（BD：百度外卖，MT：美团外卖，ELM：饿了么外卖）
			 * @param String platformCode 
			 */
			public void setPlatformCode(String platformCode){
				this.platformCode = platformCode;
			}
		   		
		
		
			
			}