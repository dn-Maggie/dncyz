package com.dongnao.workbench.store.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：店铺流量模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class StoreFlux extends Model{
	
	
		            /**
	                 * 流量ID(主键)
	                 **/
				   			private String fluxId;
		   		
		            /**
	                 * 平台ID
	                 **/
				   			private String platformId;
		   		
		            /**
	                 * 店铺ID
	                 **/
				   			private String storeId;
		   		
		            /**
	                 * 曝光量
	                 **/
				   			private Integer storeExposure;
		   		
		            /**
	                 * 进店人数
	                 **/
				   			private Integer storeVisitorNum;
		   		
		            /**
	                 * 下单数
	                 **/
				   			private Integer storeOrderNum;
		   		
		            /**
	                 * 品类入口餐厅列表流量
	                 **/
				   			private Integer fluxInCategory;
		   		
		            /**
	                 * 首页餐厅列表流量
	                 **/
				   			private Integer fluxInHomepage;
		   		
		            /**
	                 * 订单详情页流量
	                 **/
				   			private Integer fluxInDetaile;
		   		
		            /**
	                 * 活动页流量
	                 **/
				   			private Integer fluxInActivity;
		   		
		            /**
	                 * 收藏餐厅流量
	                 **/
				   			private Integer fluxInCollect;
		   		
		            /**
	                 * 搜索流量
	                 **/
				   			private Integer fluxInSearch;
		   		
	
				
		  			/**
			 * 获取 流量ID(主键)
			 * @return String this.fluxId
			 */
			public String getFluxId(){
				return this.fluxId;
			}
			
			/**
			 * 设置 流量ID(主键)
			 * @param String fluxId 
			 */
			public void setFluxId(String fluxId){
				this.fluxId = fluxId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台ID
			 * @return String this.platformId
			 */
			public String getPlatformId(){
				return this.platformId;
			}
			
			/**
			 * 设置 平台ID
			 * @param String platformId 
			 */
			public void setPlatformId(String platformId){
				this.platformId = platformId;
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
			 * 获取 曝光量
			 * @return Integer this.storeExposure
			 */
			public Integer getStoreExposure(){
				return this.storeExposure;
			}
			
			/**
			 * 设置 曝光量
			 * @param BigDecimal storeExposure 
			 */
			public void setStoreExposure(Integer storeExposure){
				this.storeExposure = storeExposure;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 进店人数
			 * @return Integer this.storeVisitorNum
			 */
			public Integer getStoreVisitorNum(){
				return this.storeVisitorNum;
			}
			
			/**
			 * 设置 进店人数
			 * @param BigDecimal storeVisitorNum 
			 */
			public void setStoreVisitorNum(Integer storeVisitorNum){
				this.storeVisitorNum = storeVisitorNum;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 下单数
			 * @return Integer this.storeOrderNum
			 */
			public Integer getStoreOrderNum(){
				return this.storeOrderNum;
			}
			
			/**
			 * 设置 下单数
			 * @param BigDecimal storeOrderNum 
			 */
			public void setStoreOrderNum(Integer storeOrderNum){
				this.storeOrderNum = storeOrderNum;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 品类入口餐厅列表流量
			 * @return Integer this.fluxInCategory
			 */
			public Integer getFluxInCategory(){
				return this.fluxInCategory;
			}
			
			/**
			 * 设置 品类入口餐厅列表流量
			 * @param BigDecimal fluxInCategory 
			 */
			public void setFluxInCategory(Integer fluxInCategory){
				this.fluxInCategory = fluxInCategory;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 首页餐厅列表流量
			 * @return Integer this.fluxInHomepage
			 */
			public Integer getFluxInHomepage(){
				return this.fluxInHomepage;
			}
			
			/**
			 * 设置 首页餐厅列表流量
			 * @param BigDecimal fluxInHomepage 
			 */
			public void setFluxInHomepage(Integer fluxInHomepage){
				this.fluxInHomepage = fluxInHomepage;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 订单详情页流量
			 * @return Integer this.fluxInDetaile
			 */
			public Integer getFluxInDetaile(){
				return this.fluxInDetaile;
			}
			
			/**
			 * 设置 订单详情页流量
			 * @param BigDecimal fluxInDetaile 
			 */
			public void setFluxInDetaile(Integer fluxInDetaile){
				this.fluxInDetaile = fluxInDetaile;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 活动页流量
			 * @return Integer this.fluxInActivity
			 */
			public Integer getFluxInActivity(){
				return this.fluxInActivity;
			}
			
			/**
			 * 设置 活动页流量
			 * @param BigDecimal fluxInActivity 
			 */
			public void setFluxInActivity(Integer fluxInActivity){
				this.fluxInActivity = fluxInActivity;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 收藏餐厅流量
			 * @return Integer this.fluxInCollect
			 */
			public Integer getFluxInCollect(){
				return this.fluxInCollect;
			}
			
			/**
			 * 设置 收藏餐厅流量
			 * @param BigDecimal fluxInCollect 
			 */
			public void setFluxInCollect(Integer fluxInCollect){
				this.fluxInCollect = fluxInCollect;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 搜索流量
			 * @return Integer this.fluxInSearch
			 */
			public Integer getFluxInSearch(){
				return this.fluxInSearch;
			}
			
			/**
			 * 设置 搜索流量
			 * @param BigDecimal fluxInSearch 
			 */
			public void setFluxInSearch(Integer fluxInSearch){
				this.fluxInSearch = fluxInSearch;
			}
		  		
		
		
			
			}