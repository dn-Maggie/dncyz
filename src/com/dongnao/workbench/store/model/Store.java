package com.dongnao.workbench.store.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：店铺模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class Store extends Model{
	
	
		            /**
	                 * 店铺ID(主键)
	                 **/
				   			private String storeId;
		   		
		            /**
	                 * 店铺名称
	                 **/
				   			private String storeName;
		   		
		            /**
	                 * 所属品牌ID
	                 **/
				   			private String brandId;
				   			private String brandName;
		   		
		            /**
	                 * 店铺地址
	                 **/
				   			private String storeAddress;
		   		
		            /**
	                 * 营业时间起
	                 **/
					@DateTimeFormat(pattern="HH:mm:ss") 
							private Date workTimeBegin;
		
		            /**
	                 * 营业时间起
	                 **/
					@DateTimeFormat(pattern="HH:mm:ss") 
							private Date workTimeEnd;
		
		            /**
	                 * 店长姓名
	                 **/
				   			private String storeOwnerName;
		   		
		            /**
	                 * 店长电话
	                 **/
				   			private String storeOwnerTel;
		   		
		            /**
	                 * 是否可以提供发票
	                 **/
				   			private String proInvoiceFlag;
		   		
		            /**
	                 * 备注
	                 **/
				   			private String remark;
		   		
		            /**
	                 * 运营开始时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd") 
							private Date operateDate;
		
		            /**
	                 * 结算方式
	                 **/
				   			private String settlementMethod;
		   		
		            /**
	                 * 店铺联系电话
	                 **/
				   			private String storeTel;
		   		
		            /**
	                 * 实景图片1
	                 **/
				   			private String realImagePath1;
		   		
		            /**
	                 * 实景图片2
	                 **/
				   			private String realImagePath2;
		   		
		            /**
	                 * 实景图片3
	                 **/
				   			private String realImagePath3;
		   		
	
				
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
			 * 获取 所属品牌ID
			 * @return String this.brandId
			 */
			public String getBrandId(){
				return this.brandId;
			}
			
			/**
			 * 设置 所属品牌ID
			 * @param String brandId 
			 */
			public void setBrandId(String brandId){
				this.brandId = brandId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 店铺地址
			 * @return String this.storeAddress
			 */
			public String getStoreAddress(){
				return this.storeAddress;
			}
			
			/**
			 * 设置 店铺地址
			 * @param String storeAddress 
			 */
			public void setStoreAddress(String storeAddress){
				this.storeAddress = storeAddress;
			}
		   		
		
		
			
								/**
			 * 获取 营业时间起
			 * @return Date this.workTimeBegin
			 */
			public Date getWorkTimeBegin(){
				return this.workTimeBegin;
			}
			
			/**
			 * 设置 营业时间起
			 * @param Date workTimeBegin 
			 */
			public void setWorkTimeBegin(Date workTimeBegin){
				this.workTimeBegin = workTimeBegin;
			}
								/**
			 * 获取 营业时间起
			 * @return Date this.workTimeEnd
			 */
			public Date getWorkTimeEnd(){
				return this.workTimeEnd;
			}
			
			/**
			 * 设置 营业时间起
			 * @param Date workTimeEnd 
			 */
			public void setWorkTimeEnd(Date workTimeEnd){
				this.workTimeEnd = workTimeEnd;
			}
						
		  			/**
			 * 获取 店长姓名
			 * @return String this.storeOwnerName
			 */
			public String getStoreOwnerName(){
				return this.storeOwnerName;
			}
			
			/**
			 * 设置 店长姓名
			 * @param String storeOwnerName 
			 */
			public void setStoreOwnerName(String storeOwnerName){
				this.storeOwnerName = storeOwnerName;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 店长电话
			 * @return String this.storeOwnerTel
			 */
			public String getStoreOwnerTel(){
				return this.storeOwnerTel;
			}
			
			/**
			 * 设置 店长电话
			 * @param String storeOwnerTel 
			 */
			public void setStoreOwnerTel(String storeOwnerTel){
				this.storeOwnerTel = storeOwnerTel;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 是否可以提供发票
			 * @return String this.proInvoiceFlag
			 */
			public String getProInvoiceFlag(){
				return this.proInvoiceFlag;
			}
			
			/**
			 * 设置 是否可以提供发票
			 * @param String proInvoiceFlag 
			 */
			public void setProInvoiceFlag(String proInvoiceFlag){
				this.proInvoiceFlag = proInvoiceFlag;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 备注
			 * @return String this.remark
			 */
			public String getRemark(){
				return this.remark;
			}
			
			/**
			 * 设置 备注
			 * @param String remark 
			 */
			public void setRemark(String remark){
				this.remark = remark;
			}
		   		
		
		
			
								/**
			 * 获取 运营开始时间
			 * @return Date this.operateDate
			 */
			public Date getOperateDate(){
				return this.operateDate;
			}
			
			/**
			 * 设置 运营开始时间
			 * @param Date operateDate 
			 */
			public void setOperateDate(Date operateDate){
				this.operateDate = operateDate;
			}
						
		  			/**
			 * 获取 结算方式
			 * @return String this.settlementMethod
			 */
			public String getSettlementMethod(){
				return this.settlementMethod;
			}
			
			/**
			 * 设置 结算方式
			 * @param String settlementMethod 
			 */
			public void setSettlementMethod(String settlementMethod){
				this.settlementMethod = settlementMethod;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 店铺联系电话
			 * @return String this.storeTel
			 */
			public String getStoreTel(){
				return this.storeTel;
			}
			
			/**
			 * 设置 店铺联系电话
			 * @param String storeTel 
			 */
			public void setStoreTel(String storeTel){
				this.storeTel = storeTel;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 实景图片1
			 * @return String this.realImagePath1
			 */
			public String getRealImagePath1(){
				return this.realImagePath1;
			}
			
			/**
			 * 设置 实景图片1
			 * @param String realImagePath1 
			 */
			public void setRealImagePath1(String realImagePath1){
				this.realImagePath1 = realImagePath1;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 实景图片2
			 * @return String this.realImagePath2
			 */
			public String getRealImagePath2(){
				return this.realImagePath2;
			}
			
			/**
			 * 设置 实景图片2
			 * @param String realImagePath2 
			 */
			public void setRealImagePath2(String realImagePath2){
				this.realImagePath2 = realImagePath2;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 实景图片3
			 * @return String this.realImagePath3
			 */
			public String getRealImagePath3(){
				return this.realImagePath3;
			}
			
			/**
			 * 设置 实景图片3
			 * @param String realImagePath3 
			 */
			public void setRealImagePath3(String realImagePath3){
				this.realImagePath3 = realImagePath3;
			}

			public String getBrandName() {
				return brandName;
			}

			public void setBrandName(String brandName) {
				this.brandName = brandName;
			}
		   		
		
		
			
			}