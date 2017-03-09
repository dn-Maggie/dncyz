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
				   			private String allcyzDistributionCharge;
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

							public String getAllcyzDistributionCharge() {
								return allcyzDistributionCharge;
							}

							public void setAllcyzDistributionCharge(String allcyzDistributionCharge) {
								this.allcyzDistributionCharge = allcyzDistributionCharge;
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

							
				
		
			
		   		
		
		
			
			}