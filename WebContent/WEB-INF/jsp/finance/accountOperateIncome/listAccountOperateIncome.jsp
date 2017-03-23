<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
//底价运营表表头         
var basePriceModel = {url: "<m:url value='/accountOperateIncome/listAccountOperateIncomeByDate.do'/>",
						colModel:[
						{name : "storeName",label:"商户名称",index : "store_name"},	
						{name : "createDate",label:"日期",index : "create_date"},		
                        {name : "allinvalidNum",label:"无效单"},				
        				{name : "allvalidNum",label:"有效单"},	 
        				{name : "allorginPrice",label:"菜品原价",index : "allorgin_price",isBasic:true},	
        				{name : "allorderDistributionCharge",label:"订单上收取客户配送费",index : "allorder_distribution_charge",isBasic:true},	
        				{name : "allgoodsQuality",label:"菜品份数"},				
        				{name : "allbasePrice",label:"底价",index : "allbase_price",isBasic:true},				
        				{name : "allotherBasePrice",label:"其他底价",index : "allother_base_price",isBasic:true},				
        				{name : "allplatformServiceCharge",label:"平台服务费",isBasic:true},		
        				{name : "allplatformDistCharge",label:"平台收取配送费",isBasic:true},						
        				{name : "allplatformActivitiesCharge",label:"平台补贴线上活动费",isBasic:true},
        				{name : "allcyzActivitiesCharge",label:"公司扣除平台补贴自营销费用",isBasic:true},	
        				{name : "allcyzDistributionCharge",label:"公司收取配送费",isBasic:true},				
        				{name : "allproductSaleAmount",label:"产品销售金额",calculate:"rData['allorginPrice']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
        				{name : "allamountReceivable",label:"应收平台结算金额",calculate:"rData['allorginPrice']+rData['allorderDistributionCharge']-rData['allplatformServiceCharge']-rData['allplatformDistCharge']-rData['allcyzActivitiesCharge']+rData['allcyzDistributionCharge']",editFlag:true,
								formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
        				{name : "allamountPayable",label:"应付店铺结算金额",calculate:"rData['allbasePrice']+rData['allotherBasePrice']",editFlag:true,
								formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
        				{name : "allcyzServiceCharge",label:"公司收入",calculate:"rData['allorginPrice']-rData['allbasePrice']-rData['allotherBasePrice']",editFlag:true,
								formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
        				{name : "allsaleGrossProfit",label:"销售毛利",calculate:"rData['allorginPrice']+rData['allorderDistributionCharge']-rData['allplatformServiceCharge']-rData['allplatformDistCharge']-rData['allcyzActivitiesCharge']+rData['allcyzDistributionCharge']-rData['allotherBasePrice']-rData['allbasePrice']",editFlag:true,
								formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
        				{name : "",label:"毛利率",calculate:"(rData['allorginPrice']+rData['allorderDistributionCharge']-rData['allplatformServiceCharge']-rData['allplatformDistCharge']-rData['allcyzActivitiesCharge']+rData['allcyzDistributionCharge']-rData['allotherBasePrice']-rData['allbasePrice'])/(rData['allorginPrice']-rData['allbasePrice']-rData['allotherBasePrice'])",editFlag:true,
								formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
        				{name : "allactualMerchantDistCharge",label:"自配送实际支付金额",editable:true},
        				{name : "remark",label:"备注",index : "remark"},
        				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
				       	]};
//菜品数量表表头
var goodsQuantityModel = {url: "<m:url value='/accountOrderDetail/listGoods.do'/>",
						colModel:[
						{name : "storeName",label:"商户名称",index : "store_name"},	
						{name : "createDate",label:"日期",index : "create_date"},		
						{name : "goodsName",label:"商品名称"},	
						{name : "goodsQuality",label:"销售量",isBasic:true},	
						{name : "goodsPrice",label:"结算单价",isBasic:true},	
						{name : "",label:"销售额",calculate:"rData['goodsQuality'] * rData['goodsPrice']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
        				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
				       	]};
//销售额比例抽佣运营表表头         
var salesRateorderSaleRate = localStorage.getItem("salesRateorderSaleRate")?localStorage.getItem("salesRateorderSaleRate"):0.7;
var salesRateModel = {url: "<m:url value='/accountOrderDetail/listAccountOrderDetail.do'/>",
		colModel:[
						{name : "id",hidden : true,key : true,label:"账单ID",index : "id"},	
						{name : "storeName",label:"商户名称",index : "store_name"},		
						{name : "createDate",label:"日期",index : "create_date"},				
						{name : "orderType",label:"订单类型",index : "order_type",hidden:true},				
						{name : "orderTime",label:"订单时点",index : "order_time"},	
						{name : "orderNo",label:"订单编号",index : "order_no"},		
						{name : "prices",label:"菜价",index : "prices",hidden:true},				
						{name : "mealFee",label:"餐盒费",index : "meal_fee",hidden:true},		
						{name : "totalPrice",label:"原价",index : "total_price",calculate:"rData['mealFee'] + rData['prices']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
						{name : "activitiesSubsidyBymerchant",label:"菜品折扣",index:"activities_subsidy_bymerchant"},				
		  				{name : "foodDiscount",label:"折扣菜金额",index:"food_discount"},				
		  				{name : "specialOffer",label:"结算特价",index:"special_offer"},				
		  				{name : "orderDistCharge",label:"订单上收取客户配送费",index : "order_dist_charge"},				
	     				{name : "platformDistCharge",label:"平台收取客户配送费",index : "platform_dist_charge"},				
	     				{name : "merchantDistCharge",label:"公司收取客户配送费",index : "merchant_dist_charge"},				
	     				{name : "activitiesSubsidyBycompany",label:"公司承担线上活动费",index : "activities_subsidy_bycompany",calculate:"rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant']",editFlag:true,
	     					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
	     				{name : "platformActivitiesSubsidies",label:"平台承担线上活动费",index : "platform_activities_subsidies"},
	     				{name : "serviceCharge",label:"平台服务费",index : "service_charge"},	
	     				{name : "serviceRate",label:"平台服务费费率",index : "service_rate",hidden:true},	
	     				{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,editFlag:true,calculate:"0.7",
           					formatter : function(value, options, rData){salesRateorderSaleRate = options.colModel.calculate;return eval(options.colModel.calculate);}},
	     				{name : "productSaleAmount",index:"product_sale_amount",label:"产品销售金额",calculate:"rData['mealFee'] + rData['prices'] - rData['activitiesSubsidyBymerchant']",editFlag:true,
	     					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
     					{name : "settlementAmount",label:"应收平台结算金额",index : "settlement_amount",calculate:"rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant']+rData['orderDistCharge']-rData['platformDistCharge']+rData['merchantDistCharge']-rData['merchantActivitiesSubsidies']+rData['activitiesSubsidyBymerchant']-rData['serviceCharge']",editFlag:true,
            				formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "",label:"70%结算金额",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*salesRateorderSaleRate",editFlag:true,
	     					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
	     				{name : "",label:"应付店铺结算金额",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*salesRateorderSaleRate+rData['activitiesSubsidyBymerchant']",editFlag:true,
				       			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
	     				{name : "",label:"公司收取店铺服务费",calculate:"(rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant'])*(1-salesRateorderSaleRate)",editFlag:true,
				       		formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
	     				{name : "actualMerchantDistCharge",label:"自配送实际支付金额",editable:true},
	     				{name : "",label:"销售毛利",calculate:"rData['prices']+rData['mealFee']-((rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*salesRateorderSaleRate+rData['activitiesSubsidyBymerchant'])-(rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant'])-rData['serviceCharge']",editFlag:true,
	     					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
	     				{name : "",label:"毛利率",calculate:"(rData['prices']+rData['mealFee']-((rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*salesRateorderSaleRate+rData['activitiesSubsidyBymerchant'])-(rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant'])-rData['serviceCharge'])/((rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant'])*(1-salesRateorderSaleRate))",editFlag:true,
			       			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
						{name : "merchantActivitiesSubsidies",label:"商户承担活动补贴",index : "merchant_activities_subsidies",hidden:true},		
						{name : "distributionMode",label:"配送方式",index : "distribution_mode",hidden:true},	
						{name : "merchantSubsidyVouchers",label:"商户承担代金券补贴",index : "merchant_subsidy_vouchers",hidden:true},	
						{name : "platformSubsidyVouchers",label:"平台承担代金券补贴",index : "platform_subsidy_vouchers",hidden:true},
						{name : "remark",label:"备注",index : "remark"},		
						{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
			           	]};
//深运营表表头     
var deepOperationorderSaleRate = localStorage.getItem("deepOperationorderSaleRate")?localStorage.getItem("deepOperationorderSaleRate"):0.65;
var deepOperationModel ={url: "<m:url value='/accountOrderDetail/listAccountOrderDetail.do'/>",
						colModel:[
						{name : "id",hidden : true,key : true,label:"账单ID",index : "id"},	
						{name : "storeName",label:"商户名称",index : "store_name"},		
						{name : "createDate",label:"日期",index : "create_date"},				
						{name : "orderType",label:"订单类型",index : "order_type",hidden:true},				
						{name : "orderTime",label:"订单时点",index : "order_time"},	
						{name : "orderNo",label:"订单编号",index : "order_no"},		
						{name : "prices",label:"菜价",index : "prices",hidden:true,isBasic:true},				
						{name : "mealFee",label:"餐盒费",index : "meal_fee",hidden:true,isBasic:true},		
						{name : "totalPrice",label:"原价",index : "total_price",calculate:"rData['mealFee'] + rData['prices']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
						{name : "activitiesSubsidyBymerchant",label:"菜品折扣",index:"activities_subsidy_bymerchant",isBasic:true},				
						{name : "foodDiscount",label:"折扣菜金额",index:"food_discount",isBasic:true},				
						{name : "specialOffer",label:"结算特价",index:"special_offer",isBasic:true},				
						{name : "orderDistCharge",label:"订单上收取客户配送费",index : "order_dist_charge",isBasic:true},				
						{name : "platformDistCharge",label:"平台收取客户配送费",index : "platform_dist_charge",isBasic:true},				
						{name : "merchantDistCharge",label:"运营收取客户配送费",index : "merchant_dist_charge",isBasic:true},				
						{name : "activitiesSubsidyBycompany",label:"运营承担线上活动费",index : "activities_subsidy_bycompany",calculate:"rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
						{name : "platformActivitiesSubsidies",label:"平台承担线上活动费",index : "platform_activities_subsidies",isBasic:true},
						{name : "serviceCharge",label:"平台服务费",index : "service_charge",isBasic:true},	
						{name : "serviceRate",label:"平台服务费费率",index : "service_rate",hidden:true,isBasic:true},	
						{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,editFlag:true,calculate:"0.65",
           					formatter : function(value, options, rData){deepOperationorderSaleRate = options.colModel.calculate;return eval(options.colModel.calculate);}},
						{name : "productSaleAmount",label:"产品销售金额",calculate:"rData['mealFee'] + rData['prices'] - rData['activitiesSubsidyBymerchant']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
						{name : "settlementAmount",label:"应收平台结算金额",calculate:"rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant']+rData['orderDistCharge']-rData['platformDistCharge']+rData['merchantDistCharge']-rData['merchantActivitiesSubsidies']+rData['activitiesSubsidyBymerchant']-rData['serviceCharge']",editFlag:true,
              					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "amountPayable",label:"品牌商家应收",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*deepOperationorderSaleRate+rData['specialOffer']",editFlag:true,
			      			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
		      			{name : "",label:"运营应收",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*(1-deepOperationorderSaleRate)*5/7",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
						{name : "",label:"应付配送费",editable:true,},				
						{name : "actualMerchantDistCharge",label:"自配送实际支付金额",editable:true},
						{name : "",label:"运营实收",calculate:"rData['mealFee'] + rData['prices'] - rData['activitiesSubsidyBymerchant']-(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-((rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*deepOperationorderSaleRate+rData['specialOffer'])-((rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*(1-deepOperationorderSaleRate)*2/7)-(rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant'])-rData['serviceCharge']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
						{name : "",label:"工厂应收",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*(1-deepOperationorderSaleRate)*2/7",editFlag:true,
			     			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
						{name : "merchantActivitiesSubsidies",label:"商户承担活动补贴",index : "merchant_activities_subsidies",hidden:true,isBasic:true},		
						{name : "distributionMode",label:"配送方式",index : "distribution_mode",hidden:true},	
						{name : "merchantSubsidyVouchers",label:"商户承担代金券补贴",index : "merchant_subsidy_vouchers",hidden:true,isBasic:true},	
						{name : "platformSubsidyVouchers",label:"平台承担代金券补贴",index : "platform_subsidy_vouchers",hidden:true,isBasic:true},
						{name : "remark",label:"备注",index : "remark"},		
						{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
				       	]};
//平台到账抽佣运营表表头            		
var platformAccountorderSaleRate = localStorage.getItem("platformAccountorderSaleRate")?localStorage.getItem("platformAccountorderSaleRate"):0.95;
var platformAccountModel = {
						url: "<m:url value='/accountOrderDetail/listAccountOrderDetail.do'/>",
						colModel:[
						{name : "id",hidden : true,key : true,label:"账单ID",index : "id"},	
						{name : "storeName",label:"商户名称",index : "store_name"},		
						{name : "createDate",label:"日期",index : "create_date"},				
						{name : "orderType",label:"订单类型",index : "order_type",hidden:true},				
						{name : "orderTime",label:"订单时点",index : "order_time"},	
						{name : "orderNo",label:"订单编号",index : "order_no"},		
						{name : "prices",label:"菜价",index : "prices",hidden:true,isBasic:true},				
						{name : "mealFee",label:"餐盒费",index : "meal_fee",hidden:true,isBasic:true},		
						{name : "totalPrice",label:"原价",index : "total_price",calculate:"rData['mealFee'] + rData['prices']",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
						{name : "activitiesSubsidyBymerchant",label:"菜品折扣",index:"activities_subsidy_bymerchant",isBasic:true},				
        				{name : "foodDiscount",label:"折扣菜金额",index:"food_discount",isBasic:true},				
        				{name : "specialOffer",label:"结算特价",index:"special_offer",isBasic:true},				
        				{name : "orderDistCharge",label:"订单上收取客户配送费",index : "order_dist_charge",isBasic:true},				
           				{name : "platformDistCharge",label:"平台收取客户配送费",index : "platform_dist_charge",isBasic:true},				
           				{name : "merchantDistCharge",label:"公司收取客户配送费",index : "merchant_dist_charge",isBasic:true},				
           				{name : "activitiesSubsidyBycompany",label:"公司承担线上活动费",index : "activities_subsidy_bycompany",calculate:"rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant']",editFlag:true,
           					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
           				{name : "platformActivitiesSubsidies",label:"平台承担线上活动费",index : "platform_activities_subsidies",isBasic:true},
           				{name : "serviceCharge",label:"平台服务费",index : "service_charge",isBasic:true},	
           				{name : "serviceRate",label:"平台服务费费率",index : "service_rate",hidden:true,isBasic:true},	
           				{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,editFlag:true,calculate:"0.95",
           					formatter : function(value, options, rData){platformAccountorderSaleRate = options.colModel.calculate;return eval(options.colModel.calculate);}},	
           				{name : "productSaleAmount",index:"product_sale_amount",label:"产品销售金额",calculate:"rData['mealFee'] + rData['prices'] - rData['activitiesSubsidyBymerchant']",editFlag:true,
           					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "settlementAmount",label:"应收平台结算金额",index : "settlement_amount",calculate:"rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant']+rData['orderDistCharge']-rData['platformDistCharge']+rData['merchantDistCharge']-rData['merchantActivitiesSubsidies']+rData['activitiesSubsidyBymerchant']-rData['serviceCharge']",editFlag:true,
               					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "",label:"95%结算金额",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*platformAccountorderSaleRate",editFlag:true,
           					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "",label:"应付店铺结算金额",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*platformAccountorderSaleRate+rData['activitiesSubsidyBymerchant']",editFlag:true,
   			       			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "",label:"公司收取店铺服务费",calculate:"(rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant'])*(1-platformAccountorderSaleRate)",editFlag:true,
      			       		formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "actualMerchantDistCharge",label:"自配送实际支付金额",editable:true},	
           				{name : "",label:"销售毛利",calculate:"rData['prices']+rData['mealFee']-((rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*platformAccountorderSaleRate+rData['activitiesSubsidyBymerchant'])-(rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant'])-rData['serviceCharge']",editFlag:true,
           					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
           				{name : "",label:"毛利率",calculate:"(rData['prices']+rData['mealFee']-((rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*platformAccountorderSaleRate+rData['activitiesSubsidyBymerchant'])-(rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant'])-rData['serviceCharge'])/((rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant'])*(1-platformAccountorderSaleRate))",editFlag:true,
  			       			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
						{name : "merchantActivitiesSubsidies",label:"商户承担活动补贴",index : "merchant_activities_subsidies",hidden:true,isBasic:true},		
						{name : "distributionMode",label:"配送方式",index : "distribution_mode",hidden:true},	
						{name : "merchantSubsidyVouchers",label:"商户承担代金券补贴",index : "merchant_subsidy_vouchers",hidden:true,isBasic:true},	
						{name : "platformSubsidyVouchers",label:"平台承担代金券补贴",index : "platform_subsidy_vouchers",hidden:true,isBasic:true},
						{name : "remark",label:"备注",index : "remark"},		
						{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?value!='baidu'?'未知':'百度':'美团':'饿了么';",editFlag:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
			           	]};
	$(function(){
			initGrid("platformAccount");
			$(".tableTab").on('click',function(){
				$(".tableTab").trigger("removeCheck");
				$(this).addClass('checked');
				$(".listtable_box").trigger("removeAll");
				$(".listtable_box").html('<table  id="'+$(this).data("id")+'" ></table><div id='+$(this).data("id")+'prowed></div>');
				initGrid($(this).data("id"));
			})
			$(".tableTab").bind('removeCheck',function(){
				$(this).removeClass('checked');
			})
			$(".listtable_box").bind('removeAll',function(){
				$(this).html("");
				
		});
			
    });
    function cellFormat(value, options, rData){return eval(options.colModel.calculate);};
	//初始化grid
	function initGrid(ways){
		$("#orderSaleRate").val(localStorage.getItem(ways+"orderSaleRate")?localStorage.getItem(ways+"orderSaleRate"):0.7);
		if(localStorage.getItem(ways+"Model")){
			var localStorageModel= $.each(JSON.parse(localStorage.getItem(ways+"Model")), function(idx, obj) {
				if(obj.serial){
					obj.formatter=cellFormat;
				}
			    return obj;
			});
		}
		gridObj = new biz.grid({
	        id:"#"+ways,
	        url: eval(ways+"Model.url"),
	       	sortname:"create_date",
	       	sortorder:"asc",
	       	footerrow:true,
	        forceFit : true,
	        cellEdit: true,
	        cellsubmit: 'clientArray',
	        afterEditCell: function (id,name,val,iRow,iCol){
	        },
           	afterSaveCell : function(rowid,name,val,iRow,iCol) {
           		var paramDatas = {
           				actualMerchantDistCharge:val,
           				id:rowid
				};
           		$ .ajax({
           			type: "post",
    				url: "<m:url value='/accountOrderDetail/updateAccountOrderDetailActualDistCharge.do'/>?actualDistCharge="+val+"&&key="+rowid,
    				data: paramDatas,
					cache:false,
    				dataType:"json",
    				success: function(data, textStatus, jqXHR){
    					console.log(1);
    				},
    				error: function() {
    					console.log(2);
 			        }
    			});
	            /* if(name == 'amount') {
	              var taxval = jQuery("#celltbl").jqGrid('getCell',rowid,iCol+1);
	              jQuery("#celltbl").jqGrid('setRowData',rowid,{total:parseFloat(val)+parseFloat(taxval)});
	            }
	            if(name == 'tax') {
	              var amtval = jQuery("#celltbl").jqGrid('getCell',rowid,iCol-1);
	              jQuery("#celltbl").jqGrid('setRowData',rowid,{total:parseFloat(val)+parseFloat(amtval)});
	            } */
          	},
	        
	       	pager: "#"+ways+"prowed",
	        colModel:localStorage.getItem(ways+"Model")?localStorageModel:eval(ways+"Model.colModel"),
			serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
				$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
				return obj;
			},
		 	datatype: "json",/*数据类型，设置为json数据，默认为json*/
	        emptyrecords: "无记录可显示",
	        rowList:[10,15,50,100],//每页显示记录数
			rowNum:15,//默认显示15条
			gridComplete:function(){//表格加载执行  
			    $(this).closest(".ui-jqgrid-bdiv").css({ 'overflow-x' : 'hidden' });
			}  
	      });
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
		if(ways="basePrice"){
			jQuery("#basePrice").jqGrid('setGroupHeaders', {
			    useColSpanStyle: true, 
			    groupHeaders:[
				   {startColumnName: 'allinvalidNum', numberOfColumns:2, titleText: '每日单量'},
				   {startColumnName: 'allgoodsQuality', numberOfColumns:3, titleText: '商家底价'},
				   {startColumnName: 'allplatformServiceCharge', numberOfColumns:2, titleText: '平台收取'},
			    ]
			  });
		}
	}
	
	//config grid
	function loadConfigGrid(ways,colModel){
		$(".listtable_box").html("");
		$(".listtable_box").html('<table id="'+ways+'" ></table><div id="'+ways+'prowed"></div>');
		$("#orderSaleRate").val(localStorage.getItem(ways+"orderSaleRate")?localStorage.getItem(ways+"orderSaleRate"):0.7);
		gridObj = new biz.grid({
	        id:"#"+ways,
	        url: eval(ways+"Model.url"),
	       	sortname:"create_date",
	       	sortorder:"asc",
	       	footerrow:true,
	       	forceFit : true,
	        cellEdit: true,
	        cellsubmit: 'clientArray',
	        afterEditCell: function (id,name,val,iRow,iCol){
	        },
           	afterSaveCell : function(rowid,name,val,iRow,iCol) {
           		var paramDatas = {
           				actualMerchantDistCharge:val,
           				id:rowid
				};
           		$ .ajax({
           			type: "post",
    				url: "<m:url value='/accountOrderDetail/updateAccountOrderDetailActualDistCharge.do'/>?actualDistCharge="+val+"&&key="+rowid,
    				data: paramDatas,
					cache:false,
    				dataType:"json",
    				success: function(data, textStatus, jqXHR){
    					console.log(1);
    				},
    				error: function() {
    					console.log(2);
 			        }
    			});
           	},
	       	pager: '#'+ways+'prowed',
	        colModel:colModel,
			serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
				$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
				return obj;
			},
		 	datatype: "json",/*数据类型，设置为json数据，默认为json*/
	        emptyrecords: "无记录可显示",
	        rowList:[10,15,50,100],//每页显示记录数
			rowNum:15,//默认显示15条
			gridComplete:function(){//表格加载执行  
			    $(this).closest(".ui-jqgrid-bdiv").css({ 'overflow-x' : 'hidden' });
			}  
	      });
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
		if(ways="basePrice"){
			jQuery("#basePrice").jqGrid('setGroupHeaders', {
			    useColSpanStyle: true, 
			    groupHeaders:[
				   {startColumnName: 'allinvalidNum', numberOfColumns:2, titleText: '每日单量'},
				   {startColumnName: 'allgoodsQuality', numberOfColumns:3, titleText: '商家底价'},
				   {startColumnName: 'allplatformServiceCharge', numberOfColumns:2, titleText: '平台收取'},
			    ] 
			  });
		}
	}
	//配置的弹出框
	var config_iframe_dialog;
	function configGrid(tableName,tableId){
			var url="<m:url value='/accountOperateIncome/toConfigGridTitle.do'/>";
			config_iframe_dialog = new biz.dialog({
				id:$('<div id="addwindow_iframe" ></div>').html('<iframe id="iframeAdd"  class="'+tableId+'" name="iframeAdd" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
				modal: true,
				width: $(window).width()*0.9,
				height: 600,
				title: tableName+"表头配置"
			});
			config_iframe_dialog.open();
	  	}
	//关闭配置页面，供子页面调用
  	function closeConfig(){
  		config_iframe_dialog.close();
  	}
	
	//查看的弹出框
	var show_iframe_dialog;
    function show(){
    	var key = ICSS.utils.getSelectRowData("id");
		if(key.indexOf(",")>-1||key==""){
			showMessage("请选择一条数据！");
			return ;
		}
		var url="<m:url value='/accountOperateIncome/toShowAccountOperateIncome.do'/>?key="+key;
		show_iframe_dialog = new biz.dialog({
		 	id:$('<div id="showwindow_iframe"></div>').html('<iframe id="iframeShow" name="iframeShow" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 235,
				title: "运营数据详情"
		});
  		show_iframe_dialog.open();
    }
    
    //关闭查看页面，供子页面调用
    function closeShow(){
    	show_iframe_dialog.close();
    }
    /**
    * 获取查询条件值
    */
    function getQueryCondition(){
       var obj = {};
		jQuery.each($("#queryForm").serializeArray(),function(i,o){
        	if(o.value){
        		obj[o.name] = o.value;
        	}
        });
		return obj;
    }
    //查询Grid数据
    function doSearch(isStayCurrentPage){
    	if(!isStayCurrentPage)gridObj.setGridParam({"page":"1"});
    	gridObj.trigger('reloadGrid');
    }
    //重置查询表单
    function resetForm(formId){
		document.getElementById(formId).reset();
	}
    
    //导出运营明细数据
    function exportData(){
    	ExpExcel.showWin(gridObj,baseUrl+"/accountOperateIncome/exportDetailExcel.do",'grid','queryForm');
    }
    
    //配置表头
    function configTitle(tableName,tableId){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id');
    	var tableName = $('.tableTab.checked').find('span').text();
    	configGrid(tableName,tableId);
    }
  	//获取表头	
    function getColModel(){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id')
    	var columnNames = $("#"+tableId).jqGrid('getGridParam','colModel');
    	return columnNames;
    }
</script>
</head>
<body style="height:100%;">
	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li>	
					<input type="hidden" name="orderSaleRate" id="orderSaleRate">
					<input type="text" name="storeName" id="storeName" class="search_choose"> <span>店铺名称:</span>
				</li><!-- 输入框-->
				<li>
					<div class="time_bg">
					<input type="text" placeholder="截止日期"  class="search_time150 date-picker" name="propsMap['endDate']" data-date-format="yyyy-mm-dd "><!-- 时间选择控件-->
					<i class="search_time_ico2" ></i>
					</div>
					<div class="time_bg">
					<input type="text" placeholder="起始日期" class="search_time150 date-picker" name="propsMap['startDate']" data-date-format="yyyy-mm-dd "><!-- 时间选择控件-->
					<i class="search_time_ico2" ></i>
					</div>
				</li>
				<li class="date_area">
					<span>创建时间:</span>
						<div class="time_bg">
						<div class="input-group bootstrap-timepicker">
							<input class="timepicker text" name="propsMap['startTime']" type="text" />
						</div>
						</div>
					<i>至</i>
					<div class="time_bg">
						<div class="input-group bootstrap-timepicker">
							<input class="timepicker text" name="propsMap['endTime']"   type="text" />
						</div>
					</div>
					</li>	
				 <li><select class="search_select" name="platformType" id="platformType"><option value="">---请选择---</option>
					 <option value="elm">饿了么</option><option value="meituan">美团</option><option value="baidu">百度</option>
					</select><span>平台类型:</span></li><!--下拉 -->
				<li><input type="reset" class="reset_btn" onclick="resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="doSearch();" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<c:if test="${configTitle}">
							<li>
								<a title="配置表头标题" href="javascript:;" onclick="configTitle();"> 
									<i class="back_icon permissions_icon"> </i> 
									<span>配置表头</span>
								</a>
							</li>
						</c:if>
						<c:if test="${show}">
						<li>
							<a title="根据订单详细显示平台到账抽佣运营表" href="javascript:;" class="tableTab checked" data-id="platformAccount"> 
								<i class="back_icon show_icon"> </i> 
								<span>平台到账抽佣运营表</span>
							</a>
						</li>
						<li>
							<a title="根据订单详细显示底价运营表" href="javascript:;"  class="tableTab" data-id="basePrice"> 
								<i class="back_icon show_icon"> </i> 
								<span>底价运营表</span>
							</a>
						</li>
						<li>
							<a title="根据订单详细显示菜品数量表" href="javascript:;" class="tableTab" data-id="goodsQuantity"> 
								<i class="back_icon show_icon"> </i> 
								<span>菜品数量表</span>
							</a>
						</li>
						<li>
							<a title="根据订单详细显示销售额比例抽佣运营表" href="javascript:;" class="tableTab" data-id="salesRate">   
								<i class="back_icon show_icon"> </i> 
								<span>销售额比例抽佣运营表</span>
							</a>
						</li>
						<li>
							<a title="根据订单详细显示深运营表" href="javascript:;"  class="tableTab" data-id="deepOperation"> 
								<i class="back_icon show_icon"> </i> 
								<span>深运营表</span>
							</a>
						</li>
						</c:if>
						<c:if test="${exportData}">
							<li>
								<a title="根据订单详细导出运营详细数据" href="javascript:;" onclick="exportData();"> 
									<i class="back_icon import_icon"> </i> 
									<span>导出数据</span>
								</a>
							</li>
						</c:if>
					</ul>
				</div>
	
			<!--功能按钮end-->
				<div class="listtable_box">
					<!--此处放表格-->
					<table  id="platformAccount" ></table>
					<div  id="platformAccountprowed"></div>	
				</div>
		</div>
	</div>
</body>
</html>
