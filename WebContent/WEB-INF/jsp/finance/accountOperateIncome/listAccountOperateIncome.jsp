<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script src="<%=request.getContextPath() %>/js/extend/finance.js"></script>
<title></title>
<script type="text/javascript">
var gridObj = {};
//格式化cell
function cellFormat(value, options, rData){
	if(rData.raw){
		return value;
	}else if(options.colModel.calculate.indexOf("rData")>0){
		return eval(options.colModel.calculate);
	}return value;
};
//汇总运营表头
var totalColModel = [{name : "id",hidden : true,key : true,label:"主键",index : "id"},				
						{name : "storeName",label:"商户名称",index : "store_name"},				
						{name : "createDate",label:"日期",index : "create_date"},				
						{name : "invalidNum",label:"无效单",index : "invalid_num"},				
						{name : "validNum",label:"有效单",index : "valid_num"},
						{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount"},				
						{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable"},				
						{name : "amountPayable",label:"应付店铺结算金额",index : "amount_payable"},				
						{name : "cyzServiceCharge",label:"公司收入",index : "cyz_service_charge"},				
						{name : "saleGrossProfit",label:"销售毛利",index : "sale_gross_profit"},	
						{name : "actualMerchantDistCharge",label:"自配送实际支付金额",index : "actual_merchant_dist_charge"},		
                     ];
//底价运营表表头     
var basePriceModel = {url: "<m:url value='/operaDate/listOperaDate.do'/>?type=basePrice",
				 colModel:[
						{name : "id",hidden : true,key : true,label:"主键",index : "id"},				
						{name : "storeName",label:"商户名称",index : "store_name"},				
						{name : "createDate",label:"日期",index : "create_date"},				
						{name : "invalidNum",label:"无效单",index : "invalid_num"},				
						{name : "validNum",label:"有效单",index : "valid_num"},				
						{name : "orginPrice",label:"菜品原价",index : "orgin_price"},				
						{name : "mealFee",label:"餐盒费",index : "meal_fee"},				
						{name : "goodsQuality",label:"菜品份数",index : "goods_quality"},//菜品数量表中的销售量总和	
						{name : "allbasePrice",label:"底价",index : "allbase_price"},//菜品数量表中的销售额总和				
						{name : "allotherBasePrice",label:"其他底价",index : "allother_base_price"},				
						{name : "platformServiceCharge",label:"平台服务费",index : "platform_service_charge"},				
						{name : "platformDistCharge",label:"平台收取配送费",index : "platform_dist_charge"},				
						{name : "platformActivitiesCharge",label:"平台补贴线上活动费",index : "platform_activities_charge"},				
						{name : "activitiesSubsidyBycompany",label:"公司扣除平台补贴自营销费用",index : "activities_subsidy_bycompany"},				
						{name : "cyzDistCharge",label:"公司收取配送费",index : "cyz_dist_charge"},				
						{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount"},				
						{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable"},				
						{name : "amountPayable",label:"应付店铺结算金额",index : "amount_payable"},				
						{name : "cyzServiceCharge",label:"公司收入",index : "cyz_service_charge"},				
						{name : "saleGrossProfit",label:"销售毛利",index : "sale_gross_profit"},				
						{name : "saleGrossProfitRate",label:"毛利率",index : "sale_gross_profit_rate"},				
						{name : "actualMerchantDistCharge",label:"自配送实际支付金额",index : "actual_merchant_dist_charge"},				
						{name : "remark",label:"备注",index : "remark"},				
						{name : "platformType",label:"平台类型",index : "platform_type"}				
		           	],};
//销售额比例抽佣运营表表头         
var saleRateModel = {url: "<m:url value='/operaDate/listOperaDate.do'/>?type=saleRate",
					 colModel:[
						{name : "id",hidden : true,key : true,label:"主键",index : "id"},				
						{name : "storeName",label:"商户名称",index : "store_name"},				
						{name : "createDate",label:"日期",index : "create_date"},				
						{name : "invalidNum",label:"无效单",index : "invalid_num"},				
						{name : "validNum",label:"有效单",index : "valid_num"},				
						{name : "orginPrice",label:"原价",index : "orgin_price"},				
						{name : "mealFee",label:"餐盒费",index : "meal_fee"},				
						{name : "specialOrgin",label:"特价菜原价",index : "special_orgin"},				
						{name : "specialOffer",label:"特价菜结算",index : "special_offer"},				
						{name : "activitiesSubsidyBymerchant",label:"实际菜品折扣",index : "activities_subsidy_bymerchant"},				
						{name : "orderDistCharge",label:"订单上收取客户配送费",index : "order_dist_charge"},				
						{name : "platformDistCharge",label:"平台收取配送费",index : "platform_dist_charge"},				
						{name : "cyzDistCharge",label:"公司收取配送费",index : "cyz_dist_charge"},				
						{name : "activitiesSubsidyBycompany",label:"公司承担线上活动费",index : "activities_subsidy_bycompany"},				
						{name : "platformActivitiesCharge",label:"平台承担线上活动费",index : "platform_activities_charge"},				
						{name : "platformServiceCharge",label:"平台服务费",index : "platform_service_charge"},				
						{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount"},				
						{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable"},				
						{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true},		
						{name : "amountRatePayable",label:"70%结算金额",index : "amount_rate_payable"},				
						{name : "amountPayable",label:"应付店铺结算金额",index : "amount_payable"},				
						{name : "cyzServiceCharge",label:"公司收取店铺服务费",index : "cyz_service_charge"},				
						{name : "actualMerchantDistCharge",label:"自配送实际支付金额",index : "actual_merchant_dist_charge"},				
						{name : "saleGrossProfit",label:"销售毛利",index : "sale_gross_profit"},				
						{name : "saleGrossProfitRate",label:"毛利率",index : "sale_gross_profit_rate"},				
						{name : "remark",label:"备注",index : "remark"},				
						{name : "platformType",label:"平台类型",index : "platform_type"}			
			           	],};
//深运营表表头     
var deepOperaModel ={url: "<m:url value='/operaDate/listOperaDate.do'/>?type=deepOpera",
				 	colModel:[
							{name : "id",hidden : true,key : true,label:"主键",index : "id"},				
							{name : "storeName",label:"商户名称",index : "store_name"},				
							{name : "createDate",label:"日期",index : "create_date"},				
							{name : "invalidNum",label:"无效单",index : "invalid_num"},				
							{name : "validNum",label:"有效单",index : "valid_num"},				
							{name : "orginPrice",label:"原价",index : "orgin_price"},				
							{name : "mealFee",label:"餐盒费",index : "meal_fee"},				
							{name : "specialOrgin",label:"特价菜原价",index : "special_orgin"},				
							{name : "specialOffer",label:"特价菜结算",index : "special_offer"},				
							{name : "activitiesSubsidyBymerchant",label:"实际菜品折扣",index : "activities_subsidy_bymerchant"},				
							{name : "orderDistCharge",label:"订单上收取客户配送费",index : "order_dist_charge"},				
							{name : "platformDistCharge",label:"平台收取配送费",index : "platform_dist_charge"},				
							{name : "cyzDistCharge",label:"公司收取配送费",index : "cyz_dist_charge"},				
							{name : "activitiesSubsidyBycompany",label:"公司承担线上活动费",index : "activities_subsidy_bycompany"},				
							{name : "platformActivitiesCharge",label:"平台承担线上活动费",index : "platform_activities_charge"},				
							{name : "platformServiceCharge",label:"平台服务费",index : "platform_service_charge"},				
							{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount"},				
							{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable"},	
							{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true},	
							{name : "amountRatePayable",label:"品牌商家应收",index : "amount_rate_payable"},		
							{name : "cyzServiceChargeOperaPart",label:"运营应收",index : "cyz_service_charge_opera_part"},	
							{name : "distAll",label:"应付配送费",index : "dist_all"},	
							{name : "actualMerchantDistCharge",label:"自配送实际支付金额",index : "actual_merchant_dist_charge"},			
							{name : "distDiff",label:"自配送实际支付差额",index : "dist_diff"},		
							{name : "saleGrossProfit",label:"运营实收",index : "sale_gross_profit"},			
							{name : "cyzServiceChargeIndustryPart",label:"工厂应收",index : "cyz_service_charge_industry_part"},		
							{name : "remark",label:"备注",index : "remark"},				
							{name : "platformType",label:"平台类型",index : "platform_type"}				
			           	],};
//平台到账抽佣运营表表头            		
var platformAccountModel = {
						url: "<m:url value='/operaDate/listOperaDate.do'/>?type=platformAccount",
						colModel:[
							{name : "id",hidden : true,key : true,label:"主键",index : "id"},				
							{name : "storeName",label:"商户名称",index : "store_name"},				
							{name : "createDate",label:"日期",index : "create_date"},				
							{name : "invalidNum",label:"无效单",index : "invalid_num"},				
							{name : "validNum",label:"有效单",index : "valid_num"},				
							{name : "orginPrice",label:"原价",index : "orgin_price",isBasic:true,},				
							{name : "mealFee",label:"餐盒费",index : "meal_fee",isBasic:true},				
							{name : "specialOrgin",label:"特价菜原价",index : "special_orgin",isBasic:true,editable:true},				
							{name : "specialOffer",label:"特价菜结算",index : "special_offer",isBasic:true,editable:true},				
							{name : "activitiesSubsidyBymerchant",label:"实际菜品折扣",index : "activities_subsidy_bymerchant",isBasic:true},				
							{name : "orderDistCharge",label:"订单上收取客户配送费",index : "order_dist_charge",isBasic:true},				
							{name : "platformDistCharge",label:"平台收取配送费",index : "platform_dist_charge",isBasic:true},				
							{name : "cyzDistCharge",label:"公司收取配送费",index : "cyz_dist_charge",isBasic:true},				
							{name : "activitiesSubsidyBycompany",label:"公司承担线上活动费",index : "activities_subsidy_bycompany",isBasic:true},				
							{name : "platformActivitiesCharge",label:"平台承担线上活动费",index : "platform_activities_charge",isBasic:true},				
							{name : "platformServiceCharge",label:"平台服务费",index : "platform_service_charge",isBasic:true},				
							{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount",editFlag:true},				
							{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable",editFlag:true},				
							{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,calculate:"0.95",editFlag:true},				
							{name : "amountRatePayable",label:"95%结算金额",index : "amount_rate_payable",editFlag:true},				
							{name : "amountPayable",label:"应付店铺结算金额",index : "amount_payable",editFlag:true},				
							{name : "cyzServiceCharge",label:"公司收取店铺服务费",index : "cyz_service_charge",editFlag:true},				
							{name : "actualMerchantDistCharge",label:"自配送实际支付金额",index : "actual_merchant_dist_charge",editable:true},				
							{name : "saleGrossProfit",label:"销售毛利",index : "sale_gross_profit",editFlag:true},				
							{name : "saleGrossProfitRate",label:"毛利率",index : "sale_gross_profit_rate",editFlag:true},				
							{name : "remark",label:"备注",index : "remark",editable:true},				
							{name : "platformType",label:"平台类型",index : "platform_type"}				
			           	],};
	$(function(){
			initGrid("platformAccount");
			Finance.changeTabMenu();
    });
	//初始化grid
	function initGrid(ways){
		if(localStorage.getItem(ways+"Model")){
			var localStorageModel= $.each(JSON.parse(localStorage.getItem(ways+"Model")), function(idx, obj) {
				if(obj.serial){
					obj.formatter=cellFormat;
				}
			    return obj;
			});
		}
		gridObj = Finance.createGrid(ways,localStorageModel,true,true,baseUrl+"/operaDate/updateOperaDate.do?type="+ways);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
		if(ways="basePrice"){
			jQuery("#basePrice").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
			   {startColumnName: 'invalidNum', numberOfColumns:2, titleText: '每日单量'},
			   {startColumnName: 'goodsQuality', numberOfColumns:3, titleText: '商家底价'},
			   {startColumnName: 'platformServiceCharge', numberOfColumns:2, titleText: '平台收取'},
		    ]
		  });
		}
	}
	
	//config grid
	function loadConfigGrid(ways,colModel){
		$(".listtable_box").html("");
		$(".listtable_box").html('<table id="'+ways+'" ></table><div id="'+ways+'prowed"></div>');
		gridObj = Finance.loadConfigGrid(ways,colModel,true,true,baseUrl+"/operaDate/updateOperaDate.do?type="+ways);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
		if(ways="basePrice"){
			jQuery("#basePrice").jqGrid('setGroupHeaders', {
			    useColSpanStyle: true, 
			    groupHeaders:[
				   {startColumnName: 'invalidNum', numberOfColumns:2, titleText: '每日单量'},
				   {startColumnName: 'goodsQuality', numberOfColumns:3, titleText: '商家底价'},
				   {startColumnName: 'platformServiceCharge', numberOfColumns:2, titleText: '平台收取'},
			    ] 
			  });
		}
	}
	//配置的弹出框
	var config_iframe_dialog;
	//关闭配置页面，供子页面调用
  	function closeConfig(){
  		config_iframe_dialog.close();
  	}
    //导出运营明细数据
    function exportData(){
    	ExpExcel.showWin(gridObj,baseUrl+"/accountOperateIncome/exportDetailExcel.do",'grid','queryForm');
    }
 	//生成运营汇总表
    function genTotal(){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id');
    	var orderSaleRate = eval(tableId+"orderSaleRate");
   		$ .ajax({
   			type: "post",
   			data:{orderSaleRate:orderSaleRate,
   					id:tableId},
			url: baseUrl+"/accountOperaTotal/addTotalByOperaDetail.do?type="+tableId,
			cache:false,
			dataType:"json"
		});
    }
  	//获取表头	
    function getColModel(){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id')
    	var columnNames = $("#"+tableId).jqGrid('getGridParam','colModel');
    	return columnNames;
    }
  	//查看汇总信息
  	function changeTotal(){
  		var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id')
  		loadConfigGrid(tableId, totalColModel);
 	}
</script>
</head>
<body style="height:100%;">
	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li>	
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
				<li><input type="reset" class="reset_btn" onclick="List.resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="List.doSearch(gridObj);" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<c:if test="${configTitle}">
							<li>
								<a title="配置表头标题" href="javascript:;" onclick="Finance.configTitle()"> 
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
							<a title="根据订单详细显示销售额比例抽佣运营表" href="javascript:;" class="tableTab" data-id="saleRate">   
								<i class="back_icon show_icon"> </i> 
								<span>销售额比例抽佣运营表</span>
							</a>
						</li>
						<li>
							<a title="根据订单详细显示深运营表" href="javascript:;"  class="tableTab" data-id="deepOpera"> 
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
				<!-- <div><input type="button" value= "查看汇总信息" onclick="genTotal();" class="btn"></div> -->
				<div><input type="button" value= "查看汇总信息" onclick="changeTotal();" class="btn"></div>
		</div>
	</div>
</body>
</html>
