package com.dongnao.workbench.finance.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：订单明细模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-03-02
 */
public class AccountOrderDetail extends Model{
	
	
		            /**
	                 * 账单ID
	                 **/
				   			private String id;
		   		
		            /**
	                 * 创建日期
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
					private Date createDate;
		
		            /**
	                 * 
	                 **/
				   			private String storeId;
				   			private String storeName;
		   		
		            /**
	                 * 账单编号
	                 **/
				   			private String checkNo;
		   		
		            /**
	                 * 订单类型
	                 **/
				   			private String orderType;
		   		
		            /**
	                 * 订单创建时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
			private Date orderTime;
		
		            /**
	                 * 订单完成时间
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
			private Date overTime;
		
		            /**
	                 * 接单序号
	                 **/
				   			private String orderIndex;
		   		
		            /**
	                 * 订单号
	                 **/
				   			private String orderNo;
		   		
		            /**
	                 * 菜价
	                 **/
				   			private String prices;
		   		
		            /**
	                 * 餐盒费
	                 **/
				   			private String mealFee;
		   		
		            /**
	                 * 赠品补贴
	                 **/
				   			private String giftAllowance;
		   		
		            /**
	                 * 商户承担活动补贴
	                 **/
				   			private String activitiesSubsidies;
		   		
		            /**
	                 * 商户承担代金券补贴
	                 **/
				   			private String subsidyVouchers;
		   		
		            /**
	                 * 商户收取配送费
	                 **/
				   			private String merchantCharge;
		   		
		            /**
	                 * 服务费费率
	                 **/
				   			private String serviceRate;
		   		
		            /**
	                 * 服务费
	                 **/
				   			private String serviceCharge;
		   		
		            /**
	                 * 用户申请退单金额
	                 **/
				   			private String refundAmount;
		   		
		            /**
	                 * 结算金额
	                 **/
				   			private String settlementAmount;
		   		
		            /**
	                 * 配送方式
	                 **/
				   			private String distributionMode;
		   		
		            /**
	                 * 备注
	                 **/
				   			private String remark;
		   		
		            /**
	                 * 饿了么承担活动补贴
	                 **/
				   			private String elmActivitiesSubsidies;
		   		
		            /**
	                 * 饿了么承担代金券补贴
	                 **/
				   			private String elmSubsidyVouchers;
		   		
	
				
		  			/**
			 * 获取 账单ID
			 * @return String this.id
			 */
			public String getId(){
				return this.id;
			}
			
			/**
			 * 设置 账单ID
			 * @param String id 
			 */
			public void setId(String id){
				this.id = id;
			}
		   		
		
		
			
								/**
			 * 获取 创建日期
			 * @return Date this.createDate
			 */
			public Date getCreateDate(){
				return this.createDate;
			}
			
			/**
			 * 设置 创建日期
			 * @param Date createDate 
			 */
			public void setCreateDate(Date createDate){
				this.createDate = createDate;
			}
						
		  			/**
			 * 获取 
			 * @return String this.storeId
			 */
			public String getStoreId(){
				return this.storeId;
			}
			
			/**
			 * 设置 
			 * @param String storeId 
			 */
			public void setStoreId(String storeId){
				this.storeId = storeId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 账单编号
			 * @return String this.checkNo
			 */
			public String getCheckNo(){
				return this.checkNo;
			}
			
			/**
			 * 设置 账单编号
			 * @param String checkNo 
			 */
			public void setCheckNo(String checkNo){
				this.checkNo = checkNo;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单类型
			 * @return String this.orderType
			 */
			public String getOrderType(){
				return this.orderType;
			}
			
			/**
			 * 设置 订单类型
			 * @param String orderType 
			 */
			public void setOrderType(String orderType){
				this.orderType = orderType;
			}
		   		
		
		
			
								/**
			 * 获取 订单创建时间
			 * @return Date this.orderTime
			 */
			public Date getOrderTime(){
				return this.orderTime;
			}
			
			/**
			 * 设置 订单创建时间
			 * @param Date orderTime 
			 */
			public void setOrderTime(Date orderTime){
				this.orderTime = orderTime;
			}
								/**
			 * 获取 订单完成时间
			 * @return Date this.overTime
			 */
			public Date getOverTime(){
				return this.overTime;
			}
			
			/**
			 * 设置 订单完成时间
			 * @param Date overTime 
			 */
			public void setOverTime(Date overTime){
				this.overTime = overTime;
			}
						
		  			/**
			 * 获取 接单序号
			 * @return String this.orderIndex
			 */
			public String getOrderIndex(){
				return this.orderIndex;
			}
			
			/**
			 * 设置 接单序号
			 * @param String orderIndex 
			 */
			public void setOrderIndex(String orderIndex){
				this.orderIndex = orderIndex;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单号
			 * @return String this.orderNo
			 */
			public String getOrderNo(){
				return this.orderNo;
			}
			
			/**
			 * 设置 订单号
			 * @param String orderNo 
			 */
			public void setOrderNo(String orderNo){
				this.orderNo = orderNo;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 菜价
			 * @return String this.prices
			 */
			public String getPrices(){
				return this.prices;
			}
			
			/**
			 * 设置 菜价
			 * @param String prices 
			 */
			public void setPrices(String prices){
				this.prices = prices;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 餐盒费
			 * @return String this.mealFee
			 */
			public String getMealFee(){
				return this.mealFee;
			}
			
			/**
			 * 设置 餐盒费
			 * @param String mealFee 
			 */
			public void setMealFee(String mealFee){
				this.mealFee = mealFee;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 赠品补贴
			 * @return String this.giftAllowance
			 */
			public String getGiftAllowance(){
				return this.giftAllowance;
			}
			
			/**
			 * 设置 赠品补贴
			 * @param String giftAllowance 
			 */
			public void setGiftAllowance(String giftAllowance){
				this.giftAllowance = giftAllowance;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 商户承担活动补贴
			 * @return String this.activitiesSubsidies
			 */
			public String getActivitiesSubsidies(){
				return this.activitiesSubsidies;
			}
			
			/**
			 * 设置 商户承担活动补贴
			 * @param String activitiesSubsidies 
			 */
			public void setActivitiesSubsidies(String activitiesSubsidies){
				this.activitiesSubsidies = activitiesSubsidies;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 商户承担代金券补贴
			 * @return String this.subsidyVouchers
			 */
			public String getSubsidyVouchers(){
				return this.subsidyVouchers;
			}
			
			/**
			 * 设置 商户承担代金券补贴
			 * @param String subsidyVouchers 
			 */
			public void setSubsidyVouchers(String subsidyVouchers){
				this.subsidyVouchers = subsidyVouchers;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 商户收取配送费
			 * @return String this.merchantCharge
			 */
			public String getMerchantCharge(){
				return this.merchantCharge;
			}
			
			/**
			 * 设置 商户收取配送费
			 * @param String merchantCharge 
			 */
			public void setMerchantCharge(String merchantCharge){
				this.merchantCharge = merchantCharge;
			}
		   		
		
		
			
						
  			/**
			 * 获取 服务费费率
			 * @return String this.serviceRate
			 */
			public String getServiceRate(){				
				return this.serviceRate;
			}
			
			/**
			 * 设置 服务费费率
			 * @param String serviceRate 
			 */
			public void setServiceRate(String serviceRate){
				this.serviceRate = serviceRate;
			}
		   		
		
		
			
						
  			/**
			 * 获取 服务费
			 * @return String this.serviceCharge
			 */
			public String getServiceCharge(){
				return this.serviceCharge;
			}
			
			/**
			 * 设置 服务费
			 * @param String serviceCharge 
			 */
			public void setServiceCharge(String serviceCharge){
				this.serviceCharge = serviceCharge;
			}
		   		
		
		
			
						
  			/**
			 * 获取 用户申请退单金额
			 * @return String this.refundAmount
			 */
			public String getRefundAmount(){
				return this.refundAmount;
			}
			
			/**
			 * 设置 用户申请退单金额
			 * @param String refundAmount 
			 */
			public void setRefundAmount(String refundAmount){
				this.refundAmount = refundAmount;
			}
		   		
		
		
			
						
  			/**
			 * 获取 结算金额
			 * @return String this.settlementAmount
			 */
			public String getSettlementAmount(){
				return this.settlementAmount;
			}
			
			/**
			 * 设置 结算金额
			 * @param String settlementAmount 
			 */
			public void setSettlementAmount(String settlementAmount){
				this.settlementAmount = settlementAmount;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 配送方式
			 * @return String this.distributionMode
			 */
			public String getDistributionMode(){
				return this.distributionMode;
			}
			
			/**
			 * 设置 配送方式
			 * @param String distributionMode 
			 */
			public void setDistributionMode(String distributionMode){
				this.distributionMode = distributionMode;
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
			 * 获取 饿了么承担活动补贴
			 * @return String this.elmActivitiesSubsidies
			 */
			public String getElmActivitiesSubsidies(){
				return this.elmActivitiesSubsidies;
			}
			
			/**
			 * 设置 饿了么承担活动补贴
			 * @param String elmActivitiesSubsidies 
			 */
			public void setElmActivitiesSubsidies(String elmActivitiesSubsidies){
				this.elmActivitiesSubsidies = elmActivitiesSubsidies;
			}
		   		
						
		  			/**
			 * 获取 饿了么承担代金券补贴
			 * @return String this.elmSubsidyVouchers
			 */
			public String getElmSubsidyVouchers(){
				return this.elmSubsidyVouchers;
			}
			
			/**
			 * 设置 饿了么承担代金券补贴
			 * @param String elmSubsidyVouchers 
			 */
			public void setElmSubsidyVouchers(String elmSubsidyVouchers){
				this.elmSubsidyVouchers = elmSubsidyVouchers;
			}

			public String getStoreName() {
				return storeName;
			}

			public void setStoreName(String storeName) {
				this.storeName = storeName;
			}
		   		
		
		
			
			}