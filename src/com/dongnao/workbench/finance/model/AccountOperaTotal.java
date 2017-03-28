package com.dongnao.workbench.finance.model;

import java.util.Date;
import java.math.BigDecimal;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：运营合计模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-03-26
 */
public class AccountOperaTotal extends Model{
	
	
		            /**
	                 * 主键
	                 **/
				   			private String id;
		   		
		            /**
	                 * 商户名称
	                 **/	private String storeId;
				   			private String storeName;
		            /**
	                 * 日期
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd") 
							private Date createDate;
		
		            /**
	                 * 无效单
	                 **/
				   			private Integer allinvalidNum;
		   		
		            /**
	                 * 有效单
	                 **/
				   			private Integer allvalidNum;
		   		
		            /**
	                 * 菜品原价
	                 **/
				   			private String allorginPrice;
		   		
		            /**
	                 * 订单上收取客户配送费
	                 **/
				   			private String allorderDistributionCharge;
		   		
		            /**
	                 * 平台收取配送费
	                 **/
				   			private String allplatformDistCharge;
		   		
		            /**
	                 * 公司收取配送费
	                 **/
				   			private String allcyzDistributionCharge;
		   		
		            /**
	                 * 产品销售金额
	                 **/
				   			private String allproductSaleAmount;
		   		
		            /**
	                 * 应收平台结算金额
	                 **/
				   			private String allamountReceivable;
		   		
		            /**
	                 * 应付店铺结算金额
	                 **/
				   			private String allamountPayable;
		   		
		            /**
	                 * 公司收入
	                 **/
				   			private String allcyzServiceCharge;
		   		
		            /**
	                 * 公司收入(工厂应收)
	                 **/
				   			private String allcyzServiceChargeIndustryPart;
		   		
		            /**
	                 * 公司收入(运营应收)
	                 **/
				   			private String allcyzServiceChargeOperaPart;
		   		
		            /**
	                 * 结算比例
	                 **/
				   			private BigDecimal orderSaleRate;
		   		
		            /**
	                 * 销售毛利
	                 **/
				   			private String allsaleGrossProfit;
		   		
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
	                 * 实际收取自配送金额
	                 **/
				   			private String allactualMerchantDistCharge;
		   		
		            /**
	                 * 平台补贴线上活动费
	                 **/
				   			private String allplatformActivitiesCharge;
		   		
		            /**
	                 * 平台服务费
	                 **/
				   			private String allplatformServiceCharge;
		   		
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
	                 * 公司承担线上活动费
	                 **/
				   			private String allcyzActivitiesCharge;
		   		
		            /**
	                 * 菜品份数
	                 **/
				   			private String allgoodsQuality;
		   		
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
			 * @return Integer this.allinvalidNum
			 */
			public Integer getAllinvalidNum(){
				return this.allinvalidNum;
			}
			
			/**
			 * 设置 无效单
			 * @param BigDecimal allinvalidNum 
			 */
			public void setAllinvalidNum(Integer allinvalidNum){
				this.allinvalidNum = allinvalidNum;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 有效单
			 * @return Integer this.allvalidNum
			 */
			public Integer getAllvalidNum(){
				return this.allvalidNum;
			}
			
			/**
			 * 设置 有效单
			 * @param BigDecimal allvalidNum 
			 */
			public void setAllvalidNum(Integer allvalidNum){
				this.allvalidNum = allvalidNum;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 菜品原价
			 * @return String this.allorginPrice
			 */
			public String getAllorginPrice(){
				return this.allorginPrice;
			}
			
			/**
			 * 设置 菜品原价
			 * @param String allorginPrice 
			 */
			public void setAllorginPrice(String allorginPrice){
				this.allorginPrice = allorginPrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单上收取客户配送费
			 * @return String this.allorderDistributionCharge
			 */
			public String getAllorderDistributionCharge(){
				return this.allorderDistributionCharge;
			}
			
			/**
			 * 设置 订单上收取客户配送费
			 * @param String allorderDistributionCharge 
			 */
			public void setAllorderDistributionCharge(String allorderDistributionCharge){
				this.allorderDistributionCharge = allorderDistributionCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台收取配送费
			 * @return String this.allplatformDistCharge
			 */
			public String getAllplatformDistCharge(){
				return this.allplatformDistCharge;
			}
			
			/**
			 * 设置 平台收取配送费
			 * @param String allplatformDistCharge 
			 */
			public void setAllplatformDistCharge(String allplatformDistCharge){
				this.allplatformDistCharge = allplatformDistCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收取配送费
			 * @return String this.allcyzDistributionCharge
			 */
			public String getAllcyzDistributionCharge(){
				return this.allcyzDistributionCharge;
			}
			
			/**
			 * 设置 公司收取配送费
			 * @param String allcyzDistributionCharge 
			 */
			public void setAllcyzDistributionCharge(String allcyzDistributionCharge){
				this.allcyzDistributionCharge = allcyzDistributionCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 产品销售金额
			 * @return String this.allproductSaleAmount
			 */
			public String getAllproductSaleAmount(){
				return this.allproductSaleAmount;
			}
			
			/**
			 * 设置 产品销售金额
			 * @param String allproductSaleAmount 
			 */
			public void setAllproductSaleAmount(String allproductSaleAmount){
				this.allproductSaleAmount = allproductSaleAmount;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 应收平台结算金额
			 * @return String this.allamountReceivable
			 */
			public String getAllamountReceivable(){
				return this.allamountReceivable;
			}
			
			/**
			 * 设置 应收平台结算金额
			 * @param String allamountReceivable 
			 */
			public void setAllamountReceivable(String allamountReceivable){
				this.allamountReceivable = allamountReceivable;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 应付店铺结算金额
			 * @return String this.allamountPayable
			 */
			public String getAllamountPayable(){
				return this.allamountPayable;
			}
			
			/**
			 * 设置 应付店铺结算金额
			 * @param String allamountPayable 
			 */
			public void setAllamountPayable(String allamountPayable){
				this.allamountPayable = allamountPayable;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收入
			 * @return String this.allcyzServiceCharge
			 */
			public String getAllcyzServiceCharge(){
				return this.allcyzServiceCharge;
			}
			
			/**
			 * 设置 公司收入
			 * @param String allcyzServiceCharge 
			 */
			public void setAllcyzServiceCharge(String allcyzServiceCharge){
				this.allcyzServiceCharge = allcyzServiceCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收入(工厂应收)
			 * @return String this.allcyzServiceChargeIndustryPart
			 */
			public String getAllcyzServiceChargeIndustryPart(){
				return this.allcyzServiceChargeIndustryPart;
			}
			
			/**
			 * 设置 公司收入(工厂应收)
			 * @param String allcyzServiceChargeIndustryPart 
			 */
			public void setAllcyzServiceChargeIndustryPart(String allcyzServiceChargeIndustryPart){
				this.allcyzServiceChargeIndustryPart = allcyzServiceChargeIndustryPart;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收入(运营应收)
			 * @return String this.allcyzServiceChargeOperaPart
			 */
			public String getAllcyzServiceChargeOperaPart(){
				return this.allcyzServiceChargeOperaPart;
			}
			
			/**
			 * 设置 公司收入(运营应收)
			 * @param String allcyzServiceChargeOperaPart 
			 */
			public void setAllcyzServiceChargeOperaPart(String allcyzServiceChargeOperaPart){
				this.allcyzServiceChargeOperaPart = allcyzServiceChargeOperaPart;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 结算比例
			 * @return String this.orderSaleRate
			 */
			public BigDecimal getOrderSaleRate(){
				return this.orderSaleRate;
			}
			
			/**
			 * 设置 结算比例
			 * @param String orderSaleRate 
			 */
			public void setOrderSaleRate(BigDecimal orderSaleRate){
				this.orderSaleRate = orderSaleRate;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 销售毛利
			 * @return String this.allsaleGrossProfit
			 */
			public String getAllsaleGrossProfit(){
				return this.allsaleGrossProfit;
			}
			
			/**
			 * 设置 销售毛利
			 * @param String allsaleGrossProfit 
			 */
			public void setAllsaleGrossProfit(String allsaleGrossProfit){
				this.allsaleGrossProfit = allsaleGrossProfit;
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
			 * 获取 实际收取自配送金额
			 * @return String this.allactualMerchantDistCharge
			 */
			public String getAllactualMerchantDistCharge(){
				return this.allactualMerchantDistCharge;
			}
			
			/**
			 * 设置 实际收取自配送金额
			 * @param String allactualMerchantDistCharge 
			 */
			public void setAllactualMerchantDistCharge(String allactualMerchantDistCharge){
				this.allactualMerchantDistCharge = allactualMerchantDistCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台补贴线上活动费
			 * @return String this.allplatformActivitiesCharge
			 */
			public String getAllplatformActivitiesCharge(){
				return this.allplatformActivitiesCharge;
			}
			
			/**
			 * 设置 平台补贴线上活动费
			 * @param String allplatformActivitiesCharge 
			 */
			public void setAllplatformActivitiesCharge(String allplatformActivitiesCharge){
				this.allplatformActivitiesCharge = allplatformActivitiesCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台服务费
			 * @return String this.allplatformServiceCharge
			 */
			public String getAllplatformServiceCharge(){
				return this.allplatformServiceCharge;
			}
			
			/**
			 * 设置 平台服务费
			 * @param String allplatformServiceCharge 
			 */
			public void setAllplatformServiceCharge(String allplatformServiceCharge){
				this.allplatformServiceCharge = allplatformServiceCharge;
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
			 * 获取 公司承担线上活动费
			 * @return String this.allcyzActivitiesCharge
			 */
			public String getAllcyzActivitiesCharge(){
				return this.allcyzActivitiesCharge;
			}
			
			/**
			 * 设置 公司承担线上活动费
			 * @param String allcyzActivitiesCharge 
			 */
			public void setAllcyzActivitiesCharge(String allcyzActivitiesCharge){
				this.allcyzActivitiesCharge = allcyzActivitiesCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 菜品份数
			 * @return String this.allgoodsQuality
			 */
			public String getAllgoodsQuality(){
				return this.allgoodsQuality;
			}
			
			/**
			 * 设置 菜品份数
			 * @param String allgoodsQuality 
			 */
			public void setAllgoodsQuality(String allgoodsQuality){
				this.allgoodsQuality = allgoodsQuality;
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

			public String getStoreId() {
				return storeId;
			}

			public void setStoreId(String storeId) {
				this.storeId = storeId;
			}

		
			
			}