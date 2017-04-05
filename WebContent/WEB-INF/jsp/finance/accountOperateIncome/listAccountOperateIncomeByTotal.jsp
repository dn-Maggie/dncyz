<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script src="<%=request.getContextPath() %>/js/extend/finance.js"></script>
<style>
	.ui-jqgrid-sortable{
		font-weight:normal;
	}
</style>
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
//浅运营汇总表表头         
var distPrice = 12.5;
var simpleTotalModel = {url: "<m:url value='/accountOperaTotal/listAccountOperaTotal.do'/>?type=simpleTotal",
					colModel:[
					{name : "id",hidden : true,key : true,label:"主键",index : "id"},	
					{name : "storeName",label:"商户名称",index : "store_name"},	
					{name : "createDate",label:"日期",index : "create_date"},		
                  	{name : "invalidNum",label:"无效单",isBasic:true},				
	 				{name : "validNum",label:"有效单",isBasic:true},	 
	 				{name : "productSaleAmount",label:"产品销售金额",isBasic:true},				
	 				{name : "amountReceivable",label:"应收平台结算金额",isBasic:true},	
	 				{name : "amountPayable",label:"应付店铺结算金额",isBasic:true},				
	 				{name : "cyzServiceCharge",label:"公司收入",isBasic:true},	
     				{name : "saleGrossProfit",label:"销售毛利",isBasic:true},				
     				{name : "distPrice",label:"自配送金额单价",hidden:true,},
     				{name : "distAll",label:"自配送金额",editFlag:true,calculate:"rData['distPrice']*rData['validNum']",
    					formatter : cellFormat},
	 				{name : "distDiff",label:"自配送补差",editFlag:true,calculate:"rData['distPrice']*rData['validNum']-rData['actualMerchantDistCharge']",
       					formatter : cellFormat},
	 				{name : "actualMerchantDistCharge",label:"实际收取自配送金额",isBasic:true,editable:true},
	 				{name : "platformActivitiesCharge",label:"饿了吗平台补贴 ",isBasic:true},
	 				{name : "serviceAll",label:"对外支付饿了么平台补贴服务费",editFlag:true,calculate:"0.4*rData['platformActivitiesCharge']",
       					formatter : cellFormat},
	 				{name : "profitAll",label:"实际运营毛利",editFlag:true,calculate:"rData['saleGrossProfit']-(rData['distPrice']*rData['validNum']-rData['actualMerchantDistCharge'])-(0.4*rData['platformActivitiesCharge'])",
    					formatter : cellFormat},
   					{name : "otherAll",label:"竞价费用+短信推广",editable:true},
			       	]};
//深运营汇总表表头
var deepTotalModel = {url: "<m:url value='/accountOperaTotal/listAccountOperaTotal.do'/>?type=deepTotal",
					colModel:[
					{name : "id",hidden : true,key : true,label:"主键",index : "id"},	
					{name : "storeName",label:"商户名称",index : "store_name"},	
					{name : "createDate",label:"日期",index : "create_date"},		
					{name : "invalidNum",label:"无效单",isBasic:true},				
					{name : "validNum",label:"有效单",isBasic:true},	 
					{name : "productSaleAmount",label:"产品销售金额",isBasic:true},				
					{name : "amountReceivable",label:"应收平台结算金额",isBasic:true},	
					{name : "amountPayable",label:"应付店铺结算金额",isBasic:true},				
					{name : "cyzServiceCharge",label:"公司收入",isBasic:true},	
					{name : "saleGrossProfit",label:"销售毛利",isBasic:true},				
					{name : "distPrice",label:"自配送金额单价",hidden:true,},
					{name : "distAll",label:"自配送金额",editFlag:true,calculate:"rData['distPrice']*rData['validNum']",
					formatter : cellFormat},
					{name : "distDiff",label:"自配送补差",editFlag:true,calculate:"rData['distPrice']*rData['validNum']-rData['actualMerchantDistCharge']",
						formatter : cellFormat},
					{name : "actualMerchantDistCharge",label:"实际收取自配送金额",isBasic:true,editable:true},
					{name : "platformActivitiesCharge",label:"饿了吗平台补贴 ",isBasic:true},
					{name : "serviceAll",label:"对外支付饿了么平台补贴服务费",editFlag:true,calculate:"0.4*rData['platformActivitiesCharge']",
						formatter : cellFormat},
					{name : "profitAll",label:"实际运营毛利",editFlag:true,calculate:"rData['saleGrossProfit']-(rData['distPrice']*rData['validNum']-rData['actualMerchantDistCharge'])-(0.4*rData['platformActivitiesCharge'])",
					formatter : cellFormat},
					{name : "otherAll",label:"竞价费用+短信推广",editable:true},
			       	]};
		$(function(){
			initGrid("simpleTotal");
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
		gridObj = Finance.createGrid(ways,localStorageModel,true,true,baseUrl+"/accountOperaTotal/updateAccountOperaTotal.do?type="+ways);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
	}
	
	//config grid
	function loadConfigGrid(ways,colModel){
		$(".listtable_box").html("");
		$(".listtable_box").html('<table id="'+ways+'" ></table><div id="'+ways+'prowed"></div>');
		$("#orderSaleRate").val(localStorage.getItem(ways+"orderSaleRate")?localStorage.getItem(ways+"orderSaleRate"):0.7);
		gridObj = Finance.loadConfigGrid(ways,colModel);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
	}
	//配置的弹出框
	var config_iframe_dialog ;
	//关闭配置页面，供子页面调用
  	function closeConfig(){config_iframe_dialog.close();}
    //导出运营明细数据
    function exportData(){
    	ExpExcel.showWin(gridObj,baseUrl+"/accountOperateIncome/exportDetailExcel.do",'grid','queryForm');
    }
    function getColModel(){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id')
    	var columnNames = $("#"+tableId).jqGrid('getGridParam','colModel');
    	return columnNames;
    };
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
				<li><select class="search_select" name="distributionMode" id="distributionMode"><option value="">---请选择---</option>
					 <option value="elm">自配送</option><option value="meituan">平台专送</option>
					</select><span>配送方式:</span></li><!--下拉 -->
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
							<a title="根据订单详细显示浅运营汇总表" href="javascript:;" class="tableTab checked" data-id="simpleTotal"> 
								<i class="back_icon show_icon"> </i> 
								<span>浅运营汇总表</span>
							</a>
						</li>
						<li>
							<a title="根据订单详细显示深运营汇总表" href="javascript:;" class="tableTab" data-id="deepTotal"> 
								<i class="back_icon show_icon"> </i> 
								<span>深运营汇总表</span>
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
					<table  id="simpleTotal" ></table>
					<div  id="simpleTotalprowed"></div>	
				</div>
		</div>
	</div>
</body>
</html>
