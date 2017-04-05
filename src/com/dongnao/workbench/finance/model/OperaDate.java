package com.dongnao.workbench.finance.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：运营日明细模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-03-28
 */
public class OperaDate extends Model{
	
	
		            /**
	                 * 主键
	                 **/
				   			private String id;
		   		
		            /**
	                 * 店铺ID
	                 **/
				   			private String storeId;
		   		
		            /**
	                 * 商户名称
	                 **/
				   			private String storeName;
		   		
		            /**
	                 * 日期
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
			private Date createDate;
		
		            /**
	                 * 无效单
	                 **/
				   			private Integer invalidNum;
		   		
		            /**
	                 * 有效单
	                 **/
				   			private Integer validNum;
		   		
		            /**
	                 * 菜品份数
	                 **/
				   			private String goodsQuality;
		   		
		            /**
	                 * 菜品原价
	                 **/
				   			private String orginPrice;
		   		
		            /**
	                 * 餐盒费
	                 **/
				   			private String mealFee;
		   		
		            /**
	                 * 特价菜原价
	                 **/
				   			private String specialOrgin;
		   		
		            /**
	                 * 特价菜结算
	                 **/
				   			private String specialOffer;
				   			
			   		 /**
	                 * 原价菜金额
	                 **/
				   			private String actualPrice;
		   		
		            /**
	                 * 实际菜品折扣
	                 **/
				   			private String activitiesSubsidyBymerchant;
		   		
		            /**
	                 * 订单上收取客户配送费
	                 **/
				   			private String orderDistCharge;
		   		
		            /**
	                 * 平台收取配送费
	                 **/
				   			private String platformDistCharge;
		   		
		            /**
	                 * 公司收取配送费
	                 **/
				   			private String cyzDistCharge;
		   		
		            /**
	                 * 公司承担线上活动费
	                 **/
				   			private String activitiesSubsidyBycompany;
		   		
		            /**
	                 * 平台承担线上活动费
	                 **/
				   			private String platformActivitiesCharge;
		   		
		            /**
	                 * 平台服务费
	                 **/
				   			private String platformServiceCharge;
		   		
		            /**
	                 * 产品销售金额
	                 **/
				   			private String productSaleAmount;
		   		
		            /**
	                 * 应收平台结算金额
	                 **/
				   			private String amountReceivable;
		   		
		            /**
	                 * 结算比例
	                 **/
				   			private String orderSaleRate;
		   		
		            /**
	                 * (结算比例)*结算金额
	                 **/
				   			private String amountRatePayable;
		   		
		            /**
	                 * 应付店铺结算金额
	                 **/
				   			private String amountPayable;
		   		
		            /**
	                 * 公司收入(公司收取店铺服务费)
	                 **/
				   			private String cyzServiceCharge;
		   		
		            /**
	                 * 公司收入(工厂应收)
	                 **/
				   			private String cyzServiceChargeIndustryPart;
		   		
		            /**
	                 * 公司收入(运营应收)
	                 **/
				   			private String cyzServiceChargeOperaPart;
		   		
		            /**
	                 * 自配送实际支付金额
	                 **/
				   			private String actualMerchantDistCharge;
		   		
		            /**
	                 * 销售毛利
	                 **/
				   			private String saleGrossProfit;
		   		
		            /**
	                 * 毛利率
	                 **/
				   			private String saleGrossProfitRate;
		   		
		            /**
	                 * 自配送金额单价
	                 **/
				   			private String distPrice;
		   		
		            /**
	                 * 自配送金额
	                 **/
				   			private String distAll;
		   		
		            /**
	                 * 自配送补差
	                 **/
				   			private String distDiff;
		   		
		            /**
	                 * 对外支付饿了么平台补贴服务费
	                 **/
				   			private String serviceAll;
		   		
		            /**
	                 * 实际运营毛利
	                 **/
				   			private String profitAll;
		   		
		            /**
	                 * 竞价费用+短信推广
	                 **/
				   			private String otherAll;
		   		
		            /**
	                 * 底价
	                 **/
				   			private String allbasePrice;
		   		
		            /**
	                 * 其他底价
	                 **/
				   			private String allotherBasePrice;
		   		
		            /**
	                 * 备注
	                 **/
				   			private String remark;
		   		
		            /**
	                 * 平台类型
	                 **/
				   			private String platformType;
		   		
	
				
		  			/**
			 * 获取 主键
			 * @return String this.id
			 */
			public String getId(){
				return this.id;
			}
			
			/**
			 * 设置 主键
			 * @param String id 
			 */
			public void setId(String id){
				this.id = id;
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
			 * 获取 商户名称
			 * @return String this.storeName
			 */
			public String getStoreName(){
				return this.storeName;
			}
			
			/**
			 * 设置 商户名称
			 * @param String storeName 
			 */
			public void setStoreName(String storeName){
				this.storeName = storeName;
			}
		   		
		
		
			
								/**
			 * 获取 日期
			 * @return Date this.createDate
			 */
			public Date getCreateDate(){
				return this.createDate;
			}
			
			/**
			 * 设置 日期
			 * @param Date createDate 
			 */
			public void setCreateDate(Date createDate){
				this.createDate = createDate;
			}
						
		  			/**
			 * 获取 无效单
			 * @return Integer this.invalidNum
			 */
			public Integer getInvalidNum(){
				return this.invalidNum;
			}
			
			/**
			 * 设置 无效单
			 * @param BigDecimal invalidNum 
			 */
			public void setInvalidNum(Integer invalidNum){
				this.invalidNum = invalidNum;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 有效单
			 * @return Integer this.validNum
			 */
			public Integer getValidNum(){
				return this.validNum;
			}
			
			/**
			 * 设置 有效单
			 * @param BigDecimal validNum 
			 */
			public void setValidNum(Integer validNum){
				this.validNum = validNum;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 菜品份数
			 * @return String this.goodsQuality
			 */
			public String getGoodsQuality(){
				return this.goodsQuality;
			}
			
			/**
			 * 设置 菜品份数
			 * @param String goodsQuality 
			 */
			public void setGoodsQuality(String goodsQuality){
				this.goodsQuality = goodsQuality;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 菜品原价
			 * @return String this.orginPrice
			 */
			public String getOrginPrice(){
				return this.orginPrice;
			}
			
			/**
			 * 设置 菜品原价
			 * @param String orginPrice 
			 */
			public void setOrginPrice(String orginPrice){
				this.orginPrice = orginPrice;
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
			 * 获取 特价菜原价
			 * @return String this.specialOrgin
			 */
			public String getSpecialOrgin(){
				return this.specialOrgin;
			}
			
			/**
			 * 设置 特价菜原价
			 * @param String specialOrgin 
			 */
			public void setSpecialOrgin(String specialOrgin){
				this.specialOrgin = specialOrgin;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 特价菜结算
			 * @return String this.specialOffer
			 */
			public String getSpecialOffer(){
				return this.specialOffer;
			}
			
			/**
			 * 设置 特价菜结算
			 * @param String specialOffer 
			 */
			public void setSpecialOffer(String specialOffer){
				this.specialOffer = specialOffer;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 实际菜品折扣
			 * @return String this.activitiesSubsidyBymerchant
			 */
			public String getActivitiesSubsidyBymerchant(){
				return this.activitiesSubsidyBymerchant;
			}
			
			/**
			 * 设置 实际菜品折扣
			 * @param String activitiesSubsidyBymerchant 
			 */
			public void setActivitiesSubsidyBymerchant(String activitiesSubsidyBymerchant){
				this.activitiesSubsidyBymerchant = activitiesSubsidyBymerchant;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单上收取客户配送费
			 * @return String this.orderDistCharge
			 */
			public String getOrderDistCharge(){
				return this.orderDistCharge;
			}
			
			/**
			 * 设置 订单上收取客户配送费
			 * @param String orderDistCharge 
			 */
			public void setOrderDistCharge(String orderDistCharge){
				this.orderDistCharge = orderDistCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台收取配送费
			 * @return String this.platformDistCharge
			 */
			public String getPlatformDistCharge(){
				return this.platformDistCharge;
			}
			
			/**
			 * 设置 平台收取配送费
			 * @param String platformDistCharge 
			 */
			public void setPlatformDistCharge(String platformDistCharge){
				this.platformDistCharge = platformDistCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收取配送费
			 * @return String this.cyzDistCharge
			 */
			public String getCyzDistCharge(){
				return this.cyzDistCharge;
			}
			
			/**
			 * 设置 公司收取配送费
			 * @param String cyzDistCharge 
			 */
			public void setCyzDistCharge(String cyzDistCharge){
				this.cyzDistCharge = cyzDistCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司承担线上活动费
			 * @return String this.activitiesSubsidyBycompany
			 */
			public String getActivitiesSubsidyBycompany(){
				return this.activitiesSubsidyBycompany;
			}
			
			/**
			 * 设置 公司承担线上活动费
			 * @param String activitiesSubsidyBycompany 
			 */
			public void setActivitiesSubsidyBycompany(String activitiesSubsidyBycompany){
				this.activitiesSubsidyBycompany = activitiesSubsidyBycompany;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台承担线上活动费
			 * @return String this.platformActivitiesCharge
			 */
			public String getPlatformActivitiesCharge(){
				return this.platformActivitiesCharge;
			}
			
			/**
			 * 设置 平台承担线上活动费
			 * @param String platformActivitiesCharge 
			 */
			public void setPlatformActivitiesCharge(String platformActivitiesCharge){
				this.platformActivitiesCharge = platformActivitiesCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台服务费
			 * @return String this.platformServiceCharge
			 */
			public String getPlatformServiceCharge(){
				return this.platformServiceCharge;
			}
			
			/**
			 * 设置 平台服务费
			 * @param String platformServiceCharge 
			 */
			public void setPlatformServiceCharge(String platformServiceCharge){
				this.platformServiceCharge = platformServiceCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 产品销售金额
			 * @return String this.productSaleAmount
			 */
			public String getProductSaleAmount(){
				return this.productSaleAmount;
			}
			
			/**
			 * 设置 产品销售金额
			 * @param String productSaleAmount 
			 */
			public void setProductSaleAmount(String productSaleAmount){
				this.productSaleAmount = productSaleAmount;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 应收平台结算金额
			 * @return String this.amountReceivable
			 */
			public String getAmountReceivable(){
				return this.amountReceivable;
			}
			
			/**
			 * 设置 应收平台结算金额
			 * @param String amountReceivable 
			 */
			public void setAmountReceivable(String amountReceivable){
				this.amountReceivable = amountReceivable;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 结算比例
			 * @return String this.orderSaleRate
			 */
			public String getOrderSaleRate(){
				return this.orderSaleRate;
			}
			
			/**
			 * 设置 结算比例
			 * @param String orderSaleRate 
			 */
			public void setOrderSaleRate(String orderSaleRate){
				this.orderSaleRate = orderSaleRate;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 (结算比例)*结算金额
			 * @return String this.amountRatePayable
			 */
			public String getAmountRatePayable(){
				return this.amountRatePayable;
			}
			
			/**
			 * 设置 (结算比例)*结算金额
			 * @param String amountRatePayable 
			 */
			public void setAmountRatePayable(String amountRatePayable){
				this.amountRatePayable = amountRatePayable;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 应付店铺结算金额
			 * @return String this.amountPayable
			 */
			public String getAmountPayable(){
				return this.amountPayable;
			}
			
			/**
			 * 设置 应付店铺结算金额
			 * @param String amountPayable 
			 */
			public void setAmountPayable(String amountPayable){
				this.amountPayable = amountPayable;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收入(公司收取店铺服务费)
			 * @return String this.cyzServiceCharge
			 */
			public String getCyzServiceCharge(){
				return this.cyzServiceCharge;
			}
			
			/**
			 * 设置 公司收入(公司收取店铺服务费)
			 * @param String cyzServiceCharge 
			 */
			public void setCyzServiceCharge(String cyzServiceCharge){
				this.cyzServiceCharge = cyzServiceCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收入(工厂应收)
			 * @return String this.cyzServiceChargeIndustryPart
			 */
			public String getCyzServiceChargeIndustryPart(){
				return this.cyzServiceChargeIndustryPart;
			}
			
			/**
			 * 设置 公司收入(工厂应收)
			 * @param String cyzServiceChargeIndustryPart 
			 */
			public void setCyzServiceChargeIndustryPart(String cyzServiceChargeIndustryPart){
				this.cyzServiceChargeIndustryPart = cyzServiceChargeIndustryPart;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收入(运营应收)
			 * @return String this.cyzServiceChargeOperaPart
			 */
			public String getCyzServiceChargeOperaPart(){
				return this.cyzServiceChargeOperaPart;
			}
			
			/**
			 * 设置 公司收入(运营应收)
			 * @param String cyzServiceChargeOperaPart 
			 */
			public void setCyzServiceChargeOperaPart(String cyzServiceChargeOperaPart){
				this.cyzServiceChargeOperaPart = cyzServiceChargeOperaPart;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 自配送实际支付金额
			 * @return String this.actualMerchantDistCharge
			 */
			public String getActualMerchantDistCharge(){
				return this.actualMerchantDistCharge;
			}
			
			/**
			 * 设置 自配送实际支付金额
			 * @param String actualMerchantDistCharge 
			 */
			public void setActualMerchantDistCharge(String actualMerchantDistCharge){
				this.actualMerchantDistCharge = actualMerchantDistCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 销售毛利
			 * @return String this.saleGrossProfit
			 */
			public String getSaleGrossProfit(){
				return this.saleGrossProfit;
			}
			
			/**
			 * 设置 销售毛利
			 * @param String saleGrossProfit 
			 */
			public void setSaleGrossProfit(String saleGrossProfit){
				this.saleGrossProfit = saleGrossProfit;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 毛利率
			 * @return String this.saleGrossProfitRate
			 */
			public String getSaleGrossProfitRate(){
				return this.saleGrossProfitRate;
			}
			
			/**
			 * 设置 毛利率
			 * @param String saleGrossProfitRate 
			 */
			public void setSaleGrossProfitRate(String saleGrossProfitRate){
				this.saleGrossProfitRate = saleGrossProfitRate;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 自配送金额单价
			 * @return String this.distPrice
			 */
			public String getDistPrice(){
				return this.distPrice;
			}
			
			/**
			 * 设置 自配送金额单价
			 * @param String distPrice 
			 */
			public void setDistPrice(String distPrice){
				this.distPrice = distPrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 自配送金额
			 * @return String this.distAll
			 */
			public String getDistAll(){
				return this.distAll;
			}
			
			/**
			 * 设置 自配送金额
			 * @param String distAll 
			 */
			public void setDistAll(String distAll){
				this.distAll = distAll;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 自配送补差
			 * @return String this.distDiff
			 */
			public String getDistDiff(){
				return this.distDiff;
			}
			
			/**
			 * 设置 自配送补差
			 * @param String distDiff 
			 */
			public void setDistDiff(String distDiff){
				this.distDiff = distDiff;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 对外支付饿了么平台补贴服务费
			 * @return String this.serviceAll
			 */
			public String getServiceAll(){
				return this.serviceAll;
			}
			
			/**
			 * 设置 对外支付饿了么平台补贴服务费
			 * @param String serviceAll 
			 */
			public void setServiceAll(String serviceAll){
				this.serviceAll = serviceAll;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 实际运营毛利
			 * @return String this.profitAll
			 */
			public String getProfitAll(){
				return this.profitAll;
			}
			
			/**
			 * 设置 实际运营毛利
			 * @param String profitAll 
			 */
			public void setProfitAll(String profitAll){
				this.profitAll = profitAll;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 竞价费用+短信推广
			 * @return String this.otherAll
			 */
			public String getOtherAll(){
				return this.otherAll;
			}
			
			/**
			 * 设置 竞价费用+短信推广
			 * @param String otherAll 
			 */
			public void setOtherAll(String otherAll){
				this.otherAll = otherAll;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 底价
			 * @return String this.allbasePrice
			 */
			public String getAllbasePrice(){
				return this.allbasePrice;
			}
			
			/**
			 * 设置 底价
			 * @param String allbasePrice 
			 */
			public void setAllbasePrice(String allbasePrice){
				this.allbasePrice = allbasePrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 其他底价
			 * @return String this.allotherBasePrice
			 */
			public String getAllotherBasePrice(){
				return this.allotherBasePrice;
			}
			
			/**
			 * 设置 其他底价
			 * @param String allotherBasePrice 
			 */
			public void setAllotherBasePrice(String allotherBasePrice){
				this.allotherBasePrice = allotherBasePrice;
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
			 * 获取 平台类型
			 * @return String this.platformType
			 */
			public String getPlatformType(){
				return this.platformType;
			}
			
			/**
			 * 设置 平台类型
			 * @param String platformType 
			 */
			public void setPlatformType(String platformType){
				this.platformType = platformType;
			}

			public String getActualPrice() {
				return actualPrice;
			}

			public void setActualPrice(String actualPrice) {
				this.actualPrice = actualPrice;
			}
		   		
		
		
			
			}