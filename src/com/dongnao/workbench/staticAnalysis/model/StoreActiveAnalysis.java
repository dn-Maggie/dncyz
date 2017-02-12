package com.dongnao.workbench.staticAnalysis.model;

import com.dongnao.workbench.common.bean.Model;

public class StoreActiveAnalysis extends Model{

	 /**
    * 商户名称
    **/
  			private String storeName;
  	
	 /**
    * 商户所在区域(商圈)
    **/
  			private String storeArea;
  	/**
    * 查询时间（日期时间段）
    **/
  			private String searchTime;
	/**
    * 活动类型
    **/
  			private String activityType;	 
	/**
    * 活动名称
    **/
  			private String activityName;	 
	/**
    * 平台补贴金额
    **/
  			private String platformAllowance;
	
	/**
    * 活动力度
    **/
  			private String activityIntensity
;
	 /**
    * 活动周期
    **/
  			private String activityCycle;	 
	/**
    * 该活动总支出
    **/
  			private String activityTotalCost;
	 /**
    * 共计产生利润
    **/
  			private String activityTotalProfit;	
	/**
    * 利润率
    **/
  			private String profitPercent;
	/**
    * 活动期间进店率
    **/
  			private String enterRateInActivity;   			 
	/**
    * 活动期间转化率
    **/
  			private String conversionRateInActivity;
	 /**
     * 活动期间同比上期交易额增幅
     **/
   			private String tradeAmountIncrementPercent;	
	/**
     * 活动期间同比上期订单量增幅
     **/
   			private String orderAmountIncrementPercent;
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreArea() {
		return storeArea;
	}
	public void setStoreArea(String storeArea) {
		this.storeArea = storeArea;
	}
	public String getSearchTime() {
		return searchTime;
	}
	public void setSearchTime(String searchTime) {
		this.searchTime = searchTime;
	}
	public String getActivityType() {
		return activityType;
	}
	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getPlatformAllowance() {
		return platformAllowance;
	}
	public void setPlatformAllowance(String platformAllowance) {
		this.platformAllowance = platformAllowance;
	}
	public String getActivityIntensity() {
		return activityIntensity;
	}
	public void setActivityIntensity(String activityIntensity) {
		this.activityIntensity = activityIntensity;
	}
	public String getActivityCycle() {
		return activityCycle;
	}
	public void setActivityCycle(String activityCycle) {
		this.activityCycle = activityCycle;
	}
	public String getActivityTotalCost() {
		return activityTotalCost;
	}
	public void setActivityTotalCost(String activityTotalCost) {
		this.activityTotalCost = activityTotalCost;
	}
	public String getActivityTotalProfit() {
		return activityTotalProfit;
	}
	public void setActivityTotalProfit(String activityTotalProfit) {
		this.activityTotalProfit = activityTotalProfit;
	}
	public String getProfitPercent() {
		return profitPercent;
	}
	public void setProfitPercent(String profitPercent) {
		this.profitPercent = profitPercent;
	}
	public String getEnterRateInActivity() {
		return enterRateInActivity;
	}
	public void setEnterRateInActivity(String enterRateInActivity) {
		this.enterRateInActivity = enterRateInActivity;
	}
	public String getConversionRateInActivity() {
		return conversionRateInActivity;
	}
	public void setConversionRateInActivity(String conversionRateInActivity) {
		this.conversionRateInActivity = conversionRateInActivity;
	}
	public String getTradeAmountIncrementPercent() {
		return tradeAmountIncrementPercent;
	}
	public void setTradeAmountIncrementPercent(String tradeAmountIncrementPercent) {
		this.tradeAmountIncrementPercent = tradeAmountIncrementPercent;
	}
	public String getOrderAmountIncrementPercent() {
		return orderAmountIncrementPercent;
	}
	public void setOrderAmountIncrementPercent(String orderAmountIncrementPercent) {
		this.orderAmountIncrementPercent = orderAmountIncrementPercent;
	}	
}
