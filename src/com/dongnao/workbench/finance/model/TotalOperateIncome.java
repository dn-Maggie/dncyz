package com.dongnao.workbench.finance.model;

import java.util.Date;
import java.math.BigDecimal;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：运营数据模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-03-05
 */
public class TotalOperateIncome extends Model{
	
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
				   			private BigDecimal allorginPrice;
				   			private BigDecimal distPrice;
				   			private BigDecimal allorderDistributionCharge;
				   			private Integer allgoodsQuality;
				   			private BigDecimal allbasePrice;
				   			private BigDecimal allotherBasePrice;
				   			private BigDecimal allplatformServiceCharge;
				   			private BigDecimal allplatformDistCharge;
				   			private BigDecimal allplatformActivitiesCharge;
				   			private BigDecimal allcyzActivitiesCharge;
				   			private BigDecimal allcyzDistributionCharge;
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
	                 * 公司收取店铺服务费
	                 **/
				   			private String allcyzServiceCharge;
		   		
				   			
		            /**
	                 * 销售毛利
	                 **/
				   			private String allsaleGrossProfit;
		   		
			            /**
		                 * 自配送实际支付金额
		                 **/
				   			private BigDecimal  allactualMerchantDistCharge;
				   			private String platformType;
		   		
				   			private String storeId;
				   			private String storeName;
				   			private String remark;
				   			
				   			public Date getCreateDate() {
								return createDate;
							}

							public void setCreateDate(Date createDate) {
								this.createDate = createDate;
							}

							public Integer getAllinvalidNum() {
								return allinvalidNum;
							}

							public void setAllinvalidNum(Integer allinvalidNum) {
								this.allinvalidNum = allinvalidNum;
							}

							public Integer getAllvalidNum() {
								return allvalidNum;
							}

							public void setAllvalidNum(Integer allvalidNum) {
								this.allvalidNum = allvalidNum;
							}

							public String getAllproductSaleAmount() {
								return allproductSaleAmount;
							}

							public void setAllproductSaleAmount(String allproductSaleAmount) {
								this.allproductSaleAmount = allproductSaleAmount;
							}

							public String getAllamountReceivable() {
								return allamountReceivable;
							}

							public void setAllamountReceivable(String allamountReceivable) {
								this.allamountReceivable = allamountReceivable;
							}

							public String getAllamountPayable() {
								return allamountPayable;
							}

							public void setAllamountPayable(String allamountPayable) {
								this.allamountPayable = allamountPayable;
							}

							public String getAllcyzServiceCharge() {
								return allcyzServiceCharge;
							}

							public void setAllcyzServiceCharge(String allcyzServiceCharge) {
								this.allcyzServiceCharge = allcyzServiceCharge;
							}

							public String getAllsaleGrossProfit() {
								return allsaleGrossProfit;
							}

							public void setAllsaleGrossProfit(String allsaleGrossProfit) {
								this.allsaleGrossProfit = allsaleGrossProfit;
							}

							public String getPlatformType() {
								return platformType;
							}

							public void setPlatformType(String platformType) {
								this.platformType = platformType;
							}

							public String getStoreId() {
								return storeId;
							}

							public void setStoreId(String storeId) {
								this.storeId = storeId;
							}

							public String getRemark() {
								return remark;
							}

							public void setRemark(String remark) {
								this.remark = remark;
							}

							public String getStoreName() {
								return storeName;
							}

							public void setStoreName(String storeName) {
								this.storeName = storeName;
							}

							public BigDecimal getAllorginPrice() {
								return allorginPrice;
							}

							public void setAllorginPrice(BigDecimal allorginPrice) {
								this.allorginPrice = allorginPrice;
							}

							public BigDecimal getAllorderDistributionCharge() {
								return allorderDistributionCharge;
							}

							public void setAllorderDistributionCharge(BigDecimal allorderDistributionCharge) {
								this.allorderDistributionCharge = allorderDistributionCharge;
							}


							public BigDecimal getAllbasePrice() {
								return allbasePrice;
							}

							public void setAllbasePrice(BigDecimal allbasePrice) {
								this.allbasePrice = allbasePrice;
							}

							public BigDecimal getAllotherBasePrice() {
								return allotherBasePrice;
							}

							public void setAllotherBasePrice(BigDecimal allotherBasePrice) {
								this.allotherBasePrice = allotherBasePrice;
							}

							public BigDecimal getAllplatformServiceCharge() {
								return allplatformServiceCharge;
							}

							public void setAllplatformServiceCharge(BigDecimal allplatformServiceCharge) {
								this.allplatformServiceCharge = allplatformServiceCharge;
							}

							public BigDecimal getAllplatformDistCharge() {
								return allplatformDistCharge;
							}

							public void setAllplatformDistCharge(BigDecimal allplatformDistCharge) {
								this.allplatformDistCharge = allplatformDistCharge;
							}

							public BigDecimal getAllplatformActivitiesCharge() {
								return allplatformActivitiesCharge;
							}

							public void setAllplatformActivitiesCharge(BigDecimal allplatformActivitiesCharge) {
								this.allplatformActivitiesCharge = allplatformActivitiesCharge;
							}

							public BigDecimal getAllcyzActivitiesCharge() {
								return allcyzActivitiesCharge;
							}

							public void setAllcyzActivitiesCharge(BigDecimal allcyzActivitiesCharge) {
								this.allcyzActivitiesCharge = allcyzActivitiesCharge;
							}

							public BigDecimal getAllcyzDistributionCharge() {
								return allcyzDistributionCharge;
							}

							public void setAllcyzDistributionCharge(BigDecimal allcyzDistributionCharge) {
								this.allcyzDistributionCharge = allcyzDistributionCharge;
							}

							public Integer getAllgoodsQuality() {
								return allgoodsQuality;
							}

							public void setAllgoodsQuality(Integer allgoodsQuality) {
								this.allgoodsQuality = allgoodsQuality;
							}

							public BigDecimal getAllactualMerchantDistCharge() {
								return allactualMerchantDistCharge;
							}

							public void setAllactualMerchantDistCharge(BigDecimal allactualMerchantDistCharge) {
								this.allactualMerchantDistCharge = allactualMerchantDistCharge;
							}

							public BigDecimal getDistPrice() {
								return distPrice;
							}

							public void setDistPrice(BigDecimal distPrice) {
								this.distPrice = distPrice;
							}

							
				
		
			
		   		
		
		
			
			}