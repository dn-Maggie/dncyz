package com.dongnao.workbench.finance.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：运营数据模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-03-05
 */
public class AccountOperateIncome extends Model{
	
	
		            /**
	                 * 主键
	                 **/
				   			private String id;
		   		
		            /**
	                 * 日期
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd") 
							private Date createDate;
		
		            /**
	                 * 订单时点
	                 **/
					@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
							private Date createTime;
					
		            /**
	                 * 订单编号
	                 **/
				   			private String orderNo;
		   		
		            /**
	                 * 原价
	                 **/
				   			private String orginPrice;
		   		
		            /**
	                 * 菜品折扣
	                 **/
				   			private String discountPrice;
		   		
		            /**
	                 * 折扣后菜价格
	                 **/
				   			private String afterDiscountPrice;
		   		
		            /**
	                 * 实际结算折扣菜金额
	                 **/
				   			private String actualPrice;
		   		
		            /**
	                 * 订单上收取客户配送费
	                 **/
				   			private String orderDistributionCharge;
		   		
		            /**
	                 * 平台收取客户配送费
	                 **/
				   			private String platformDistributionCharge;
		   		
		            /**
	                 * 公司收取客户配送费
	                 **/
				   			private String cyzDistributionCharge;
		   		
		            /**
	                 * 无效单
	                 **/
				   			private Integer invalidNum;
		   		
		            /**
	                 * 有效单
	                 **/
				   			private Integer validNum;
		   		
		            /**
	                 * 产品销售金额
	                 **/
				   			private String productSaleAmount;
		   		
		            /**
	                 * 应收平台结算金额
	                 **/
				   			private String amountReceivable;
		   		
		            /**
	                 * 70%结算金额
	                 **/
				   			private String seventypProductSaleAmount;
		   		
		            /**
	                 * 折扣菜退还佣金
	                 **/
				   			private String discountBackCommission;
		   		
		            /**
	                 * 应付店铺结算金额
	                 **/
				   			private String amountPayable;
		   		
		            /**
	                 * 公司收取店铺服务费
	                 **/
				   			private String cyzServiceCharge;
		   		
		            /**
	                 * 公司承担线上活动费
	                 **/
				   			private String cyzActivitiesCharge;
		   		
		            /**
	                 * 公司收入
	                 **/
				   			private String cyzAllIncome;
		   		
		            /**
	                 * 销售毛利
	                 **/
				   			private String saleGrossProfit;
				   			private String actualProfit;
		   		
		            /**
	                 * 毛利率
	                 **/
				   			private String saleGrossProfitRate;
		   		
		            /**
	                 * 自配送实际支付金额
	                 **/
				   			private String distributionActualPayment;
		   		
		            /**
	                 * 平台承担线上活动费
	                 **/
				   			private String platformActivitiesCharge;
		   		
		            /**
	                 * 平台服务费
	                 **/
				   			private String platformServiceCharge;
		   		
		            /**
	                 * 应收取自配送金额
	                 **/
				   			private String shouldDistributionCharge;
		   		
		            /**
	                 * 实际按10元/单自配送金额
	                 **/
				   			private String cyzDistributionChargeActual;
		   		
		            /**
	                 * 按10元/单自配送金额补差
	                 **/
				   			private String diffDistributionCharge;
		   		
		            /**
	                 * 平台补贴
	                 **/
				   			private String platformSubsidy;
		   		
		            /**
	                 * 平台类型
	                 **/
				   			private String platformType;
		   		
		            /**
	                 * 店铺ID
	                 **/
				   			private String storeId;
				   			private String storeName;
				   			private String storeType;
				   			private String storeWorkTime;
				
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
			 * 获取 订单时点
			 * @return Date this.createTime
			 */
			public Date getCreateTime(){
				return this.createTime;
			}
			
			/**
			 * 设置 订单时点
			 * @param Date createTime 
			 */
			public void setCreateTime(Date createTime){
				this.createTime = createTime;
			}
						
		  			/**
			 * 获取 订单编号
			 * @return String this.orderNo
			 */
			public String getOrderNo(){
				return this.orderNo;
			}
			
			/**
			 * 设置 订单编号
			 * @param String orderNo 
			 */
			public void setOrderNo(String orderNo){
				this.orderNo = orderNo;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 原价
			 * @return String this.orginPrice
			 */
			public String getOrginPrice(){
				return this.orginPrice;
			}
			
			/**
			 * 设置 原价
			 * @param String orginPrice 
			 */
			public void setOrginPrice(String orginPrice){
				this.orginPrice = orginPrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 菜品折扣
			 * @return String this.discountPrice
			 */
			public String getDiscountPrice(){
				return this.discountPrice;
			}
			
			/**
			 * 设置 菜品折扣
			 * @param String discountPrice 
			 */
			public void setDiscountPrice(String discountPrice){
				this.discountPrice = discountPrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 折扣后菜价格
			 * @return String this.afterDiscountPrice
			 */
			public String getAfterDiscountPrice(){
				return this.afterDiscountPrice;
			}
			
			/**
			 * 设置 折扣后菜价格
			 * @param String afterDiscountPrice 
			 */
			public void setAfterDiscountPrice(String afterDiscountPrice){
				this.afterDiscountPrice = afterDiscountPrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 实际结算折扣菜金额
			 * @return String this.actualPrice
			 */
			public String getActualPrice(){
				return this.actualPrice;
			}
			
			/**
			 * 设置 实际结算折扣菜金额
			 * @param String actualPrice 
			 */
			public void setActualPrice(String actualPrice){
				this.actualPrice = actualPrice;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 订单上收取客户配送费
			 * @return String this.orderDistributionCharge
			 */
			public String getOrderDistributionCharge(){
				return this.orderDistributionCharge;
			}
			
			/**
			 * 设置 订单上收取客户配送费
			 * @param String orderDistributionCharge 
			 */
			public void setOrderDistributionCharge(String orderDistributionCharge){
				this.orderDistributionCharge = orderDistributionCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台收取客户配送费
			 * @return String this.platformDistributionCharge
			 */
			public String getPlatformDistributionCharge(){
				return this.platformDistributionCharge;
			}
			
			/**
			 * 设置 平台收取客户配送费
			 * @param String platformDistributionCharge 
			 */
			public void setPlatformDistributionCharge(String platformDistributionCharge){
				this.platformDistributionCharge = platformDistributionCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收取客户配送费
			 * @return String this.cyzDistributionCharge
			 */
			public String getCyzDistributionCharge(){
				return this.cyzDistributionCharge;
			}
			
			/**
			 * 设置 公司收取客户配送费
			 * @param String cyzDistributionCharge 
			 */
			public void setCyzDistributionCharge(String cyzDistributionCharge){
				this.cyzDistributionCharge = cyzDistributionCharge;
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
			 * 获取 70%结算金额
			 * @return String this.seventypProductSaleAmount
			 */
			public String getSeventypProductSaleAmount(){
				return this.seventypProductSaleAmount;
			}
			
			/**
			 * 设置 70%结算金额
			 * @param String seventypProductSaleAmount 
			 */
			public void setSeventypProductSaleAmount(String seventypProductSaleAmount){
				this.seventypProductSaleAmount = seventypProductSaleAmount;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 折扣菜退还佣金
			 * @return String this.discountBackCommission
			 */
			public String getDiscountBackCommission(){
				return this.discountBackCommission;
			}
			
			/**
			 * 设置 折扣菜退还佣金
			 * @param String discountBackCommission 
			 */
			public void setDiscountBackCommission(String discountBackCommission){
				this.discountBackCommission = discountBackCommission;
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
			 * 获取 公司收取店铺服务费
			 * @return String this.cyzServiceCharge
			 */
			public String getCyzServiceCharge(){
				return this.cyzServiceCharge;
			}
			
			/**
			 * 设置 公司收取店铺服务费
			 * @param String cyzServiceCharge 
			 */
			public void setCyzServiceCharge(String cyzServiceCharge){
				this.cyzServiceCharge = cyzServiceCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司承担线上活动费
			 * @return String this.cyzActivitiesCharge
			 */
			public String getCyzActivitiesCharge(){
				return this.cyzActivitiesCharge;
			}
			
			/**
			 * 设置 公司承担线上活动费
			 * @param String cyzActivitiesCharge 
			 */
			public void setCyzActivitiesCharge(String cyzActivitiesCharge){
				this.cyzActivitiesCharge = cyzActivitiesCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 公司收入
			 * @return String this.cyzAllIncome
			 */
			public String getCyzAllIncome(){
				return this.cyzAllIncome;
			}
			
			/**
			 * 设置 公司收入
			 * @param String cyzAllIncome 
			 */
			public void setCyzAllIncome(String cyzAllIncome){
				this.cyzAllIncome = cyzAllIncome;
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
			 * 获取 自配送实际支付金额
			 * @return String this.distributionActualPayment
			 */
			public String getDistributionActualPayment(){
				return this.distributionActualPayment;
			}
			
			/**
			 * 设置 自配送实际支付金额
			 * @param String distributionActualPayment 
			 */
			public void setDistributionActualPayment(String distributionActualPayment){
				this.distributionActualPayment = distributionActualPayment;
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
			 * 获取 应收取自配送金额
			 * @return String this.shouldDistributionCharge
			 */
			public String getShouldDistributionCharge(){
				return this.shouldDistributionCharge;
			}
			
			/**
			 * 设置 应收取自配送金额
			 * @param String shouldDistributionCharge 
			 */
			public void setShouldDistributionCharge(String shouldDistributionCharge){
				this.shouldDistributionCharge = shouldDistributionCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 实际按10元/单自配送金额
			 * @return String this.cyzDistributionChargeActual
			 */
			public String getCyzDistributionChargeActual(){
				return this.cyzDistributionChargeActual;
			}
			
			/**
			 * 设置 实际按10元/单自配送金额
			 * @param String cyzDistributionChargeActual 
			 */
			public void setCyzDistributionChargeActual(String cyzDistributionChargeActual){
				this.cyzDistributionChargeActual = cyzDistributionChargeActual;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 按10元/单自配送金额补差
			 * @return String this.diffDistributionCharge
			 */
			public String getDiffDistributionCharge(){
				return this.diffDistributionCharge;
			}
			
			/**
			 * 设置 按10元/单自配送金额补差
			 * @param String diffDistributionCharge 
			 */
			public void setDiffDistributionCharge(String diffDistributionCharge){
				this.diffDistributionCharge = diffDistributionCharge;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台补贴
			 * @return String this.platformSubsidy
			 */
			public String getPlatformSubsidy(){
				return this.platformSubsidy;
			}
			
			/**
			 * 设置 平台补贴
			 * @param String platformSubsidy 
			 */
			public void setPlatformSubsidy(String platformSubsidy){
				this.platformSubsidy = platformSubsidy;
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

			public String getActualProfit() {
				return actualProfit;
			}

			public void setActualProfit(String actualProfit) {
				this.actualProfit = actualProfit;
			}

			public String getStoreName() {
				return storeName;
			}

			public void setStoreName(String storeName) {
				this.storeName = storeName;
			}

			public String getStoreType() {
				return storeType;
			}

			public void setStoreType(String storeType) {
				this.storeType = storeType;
			}

			public String getStoreWorkTime() {
				return storeWorkTime;
			}

			public void setStoreWorkTime(String storeWorkTime) {
				this.storeWorkTime = storeWorkTime;
			}
		   		
		
		
			
			}