<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script src="<%=request.getContextPath() %>/js/extend/finance.js"></script>
<script src="<%=request.getContextPath() %>/js/extend/list.js"></script>
<style>
	.ui-jqgrid-sortable{
		font-weight:normal;
	}
</style>
<title></title>
<script type="text/javascript">
var gridObj = {};
//底价运营表表头         
var basePriceModel =  {url: "<m:url value='/accountOperateIncome/listAccountOperateIncomeByDate.do'/>",
						colModel:[
						{name : "storeName",label:"商户名称",index : "store_name"},	
						{name : "createDate",label:"日期",index : "create_date"},		
                        {name : "allinvalidNum",label:"无效单"},				
        				{name : "allvalidNum",label:"有效单"},	 
        				{name : "allproductSaleAmount",label:"产品销售金额"},				
        				{name : "allamountReceivable",label:"应收平台结算金额"},	
        				{name : "allamountPayable",label:"应付店铺结算金额"},				
        				{name : "allcyzServiceCharge",label:"公司收入"},	
        				{name : "allsaleGrossProfit",label:"毛利"},				
        				{name : "allactualMerchantDistCharge",label:"自配送实际支付金额"},
        				{name : "allplatformActivitiesCharge",label:"平台承担线上活动费"},
	       				{name : "allcyzActivitiesCharge",label:"公司承担线上活动费"},
	       				{name : "allplatformServiceCharge",label:"平台服务费"},
				       	]};
//销售额比例抽佣运营表表头         
var salesRateModel = {url: "<m:url value='/accountOperateIncome/listAccountOperateIncomeByDate.do'/>",
						colModel:[
						{name : "storeName",label:"商户名称",index : "store_name"},	
						{name : "createDate",label:"日期",index : "create_date"},		
                        {name : "allinvalidNum",label:"无效单"},				
        				{name : "allvalidNum",label:"有效单"},	 
        				{name : "allproductSaleAmount",label:"产品销售金额"},				
        				{name : "allamountReceivable",label:"应收平台结算金额"},	
        				{name : "allamountPayable",label:"应付店铺结算金额"},				
        				{name : "allcyzServiceCharge",label:"公司收入"},	
        				{name : "allsaleGrossProfit",label:"毛利"},				
        				{name : "allactualMerchantDistCharge",label:"自配送实际支付金额"},
        				{name : "allplatformActivitiesCharge",label:"平台承担线上活动费"},
	       				{name : "allcyzActivitiesCharge",label:"公司承担线上活动费"},
	       				{name : "allplatformServiceCharge",label:"平台服务费"},
				       	]};
//平台到账抽佣运营表表头            		
var platformAccountModel = {
						url: "<m:url value='/accountOperateIncome/listAccountOperateIncomeByDate.do'/>",
						colModel:[
						{name : "storeName",label:"商户名称",index : "store_name"},	
						{name : "createDate",label:"日期",index : "create_date"},		
                        {name : "allinvalidNum",label:"无效单"},				
        				{name : "allvalidNum",label:"有效单"},	 
        				{name : "allproductSaleAmount",label:"产品销售金额"},				
        				{name : "allamountReceivable",label:"应收平台结算金额"},	
        				{name : "allamountPayable",label:"应付店铺结算金额"},				
        				{name : "allcyzServiceCharge",label:"公司收入"},	
        				{name : "allsaleGrossProfit",label:"毛利"},				
        				{name : "allactualMerchantDistCharge",label:"自配送实际支付金额"},
        				{name : "allplatformActivitiesCharge",label:"平台承担线上活动费"},
	       				{name : "allcyzActivitiesCharge",label:"公司承担线上活动费"},
	       				{name : "allplatformServiceCharge",label:"平台服务费"},
				       	]};				      
//深运营表表头         
var deepOperationModel ={url: "<m:url value='/accountOperateIncome/listAccountOperateIncomeByDate.do'/>",
						colModel:[
						{name : "storeName",label:"商户名称",index : "store_name"},		
						{name : "createDate",label:"日期",index : "create_date"},		
						{name : "allinvalidNum",label:"无效单"},				
	        			{name : "allvalidNum",label:"有效单"},	
						{name : "allproductSaleAmount",label:"产品销售金额"},				
						{name : "allamountReceivable",label:"应收平台结算金额",index : "settlement_amount"},				
						{name : "allamountPayable",label:"品牌商家应收"},				
		      			{name : "allcyzServiceCharge",label:"运营应收",
	       					formatter : function(value, options, rData){return (value*5/7).toFixed(3);}},				
						{name : "allsaleGrossProfit",label:"运营实收"},				
						{name : "allcyzDistributionCharge",label:"运营收取客户配送费"},				
	       				{name : "allcyzActivitiesCharge",label:"运营承担线上活动费"},				
						{name : "allcyzServiceCharge",label:"工厂应收",
	       					formatter : function(value, options, rData){return (value*2/7).toFixed(3);}},	
		     			{name : "allplatformActivitiesCharge",label:"平台承担线上活动费"},
		     			{name : "allplatformServiceCharge",label:"平台服务费",},
				       	]};

		$(function(){
			initGrid("platformAccount");
			Finance.changeTabMenu();
    });
	//初始化grid
	function initGrid(ways){
		$("#orderSaleRate").val(localStorage.getItem(ways+"orderSaleRate")?localStorage.getItem(ways+"orderSaleRate"):0.7);
		gridObj = Finance.createGrid(ways,null,true,false);
		$("#"+ways).setColProp('calculate');
	}
    //导出运营明细数据
    function exportData(){
    	ExpExcel.showWin(gridObj,baseUrl+"/accountOperateIncome/exportDetailExcel.do",'grid','queryForm');
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
				<li><input type="reset" class="reset_btn" onclick="List.resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="List.doSearch(gridObj);" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
							<li>
								<a title="根据订单详细显示平台到账抽佣运营数据日报表" href="javascript:;" class="tableTab checked" data-id="platformAccount"> 
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
								<a title="根据订单详细显示销售额比例抽佣运营数据日报表" href="javascript:;" class="tableTab" data-id="salesRate">   
									<i class="back_icon show_icon"> </i> 
									<span>销售额比例抽佣运营表</span>
								</a>
							</li>
							<li>
								<a title="根据订单详细显示深运营数据日报表" href="javascript:;"  class="tableTab" data-id="deepOperation"> 
									<i class="back_icon show_icon"> </i> 
									<span>深运营表</span>
								</a>
							</li>
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
