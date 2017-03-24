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
//格式化cell
function cellFormat(value, options, rData){
	if(rData.raw){
		return value;
	}else{
		return eval(options.colModel.calculate);
	}
};
//浅运营汇总表表头         
var distPrice = 12.5;
var simpleTotalorderSaleRate = localStorage.getItem("simpleTotalorderSaleRate")?localStorage.getItem("simpleTotalorderSaleRate"):0.7;
var simpleTotalModel = {url: "<m:url value='/accountOperateIncome/ListAccountOperateIncomeByTotal.do'/>",
					colModel:[
					{name : "storeName",label:"商户名称",index : "store_name"},	
					{name : "createDate",label:"日期",index : "create_date"},		
                  	{name : "allinvalidNum",label:"无效单",isBasic:true},				
	 				{name : "allvalidNum",label:"有效单",isBasic:true},	 
	 				{name : "allproductSaleAmount",label:"产品销售金额",isBasic:true},				
	 				{name : "allamountReceivable",label:"应收平台结算金额",isBasic:true},	
	 				{name : "allamountPayable",label:"应付店铺结算金额",isBasic:true},				
	 				{name : "allcyzServiceCharge",label:"公司收入",isBasic:true},	
	 				{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,editFlag:true,calculate:"0.7",isBasic:true,
       					formatter : function(value, options, rData){simpleTotalorderSaleRate = options.colModel.calculate;return eval(options.colModel.calculate);}},
     				{name : "allsaleGrossProfit",label:"销售毛利",isBasic:true},				
     				{name : "distPrice",label:"自配送金额单价",hidden:true,},
     				{name : "distAll",label:"自配送金额",editFlag:true,calculate:"rData['distPrice']*rData['allvalidNum']",
    					formatter : cellFormat},
	 				{name : "distDiff",label:"自配送补差",editFlag:true,calculate:"rData['distPrice']*rData['allvalidNum']-rData['allactualMerchantDistCharge']",
       					formatter : cellFormat},
	 				{name : "allactualMerchantDistCharge",label:"实际收取自配送金额",isBasic:true},
	 				{name : "allplatformActivitiesCharge",label:"饿了吗平台补贴 ",isBasic:true},
	 				{name : "serviceAll",label:"对外支付饿了么平台补贴服务费",editFlag:true,calculate:"0.4*rData['allplatformActivitiesCharge']",
       					formatter : cellFormat},
	 				{name : "profitAll",label:"实际运营毛利",editFlag:true,calculate:"rData['allsaleGrossProfit']-(rData['distPrice']*rData['allvalidNum']-rData['allactualMerchantDistCharge'])-(0.4*rData['allplatformActivitiesCharge'])",
    					formatter : cellFormat},
   					{name : "otherAll",label:"竞价费用+短信推广"},
			       	]};
//深运营汇总表表头
var deepTotalorderSaleRate = localStorage.getItem("deepTotalorderSaleRate")?localStorage.getItem("deepTotalorderSaleRate"):0.65;
var deepTotalModel = {url: "<m:url value='/accountOperateIncome/ListAccountOperateIncomeByTotal.do'/>",
					colModel:[
					{name : "storeName",label:"商户名称",index : "store_name"},	
					{name : "createDate",label:"日期",index : "create_date"},		
                  	{name : "allinvalidNum",label:"无效单",isBasic:true},				
	 				{name : "allvalidNum",label:"有效单",isBasic:true},	 
	 				{name : "allproductSaleAmount",label:"产品销售金额",isBasic:true},				
	 				{name : "allamountReceivable",label:"应收平台结算金额",isBasic:true},	
	 				{name : "allamountPayable",label:"应付店铺结算金额",isBasic:true},				
	 				{name : "allcyzServiceCharge",label:"公司收入",isBasic:true},	
	 				{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,editFlag:true,calculate:"0.7",isBasic:true,
       					formatter : function(value, options, rData){simpleTotalorderSaleRate = options.colModel.calculate;return eval(options.colModel.calculate);}},
     				{name : "allsaleGrossProfit",label:"销售毛利",isBasic:true},				
     				{name : "distPrice",label:"自配送金额单价",hidden:true,},
     				{name : "distAll",label:"自配送金额",editFlag:true,calculate:"rData['distPrice']*rData['allvalidNum']",
    					formatter : cellFormat},
	 				{name : "distDiff",label:"自配送补差",editFlag:true,calculate:"rData['distPrice']*rData['allvalidNum']-rData['allactualMerchantDistCharge']",
       					formatter : cellFormat},
	 				{name : "allactualMerchantDistCharge",label:"实际收取自配送金额",isBasic:true},
	 				{name : "allplatformActivitiesCharge",label:"饿了吗平台补贴 ",isBasic:true},
	 				{name : "",label:"对外支付饿了么平台补贴服务费",editFlag:true,calculate:"0.4*rData['allplatformActivitiesCharge']",
       					formatter : cellFormat},
	 				{name : "",label:"实际运营毛利",editFlag:true,calculate:"rData['allsaleGrossProfit']-(rData['distPrice']*rData['allvalidNum']-rData['allactualMerchantDistCharge'])-(0.4*rData['allplatformActivitiesCharge'])",
    					formatter : cellFormat},
   					{name : "",label:"竞价费用+短信推广"},
			       	]};
		$(function(){
			initGrid("simpleTotal");
			Finance.changeTabMenu();
    	});
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
		gridObj = Finance.createGrid(ways,localStorageModel);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
	}
	
	//config grid
	function loadConfigGrid(ways,colModel){
		$(".listtable_box").html("");
		$(".listtable_box").html('<table id="'+ways+'" ></table><div id="'+ways+'prowed"></div>');
		gridObj = Finance.loadConfigGrid(ways,colModel);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
	}
	//配置的弹出框
	var config_iframe_dialog ;
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
    //查询Grid数据
   /*  function doSearch(isStayCurrentPage){
    	if(!isStayCurrentPage)gridObj.setGridParam({"page":"1"});
    	gridObj.trigger('reloadGrid');
    } */
    //重置查询表单
   /*  function resetForm(formId){
		document.getElementById(formId).reset();
	} */
    
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
								<a title="配置表头标题" href="javascript:;" onclick=Finance.configTitle()> 
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
