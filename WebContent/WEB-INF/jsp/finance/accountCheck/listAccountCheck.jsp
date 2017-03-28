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
//绑商家卡对账表表头    
var boundMerchantorderSaleRate = localStorage.getItem("boundMerchantorderSaleRate")?localStorage.getItem("boundMerchantorderSaleRate"):0.7;
var boundMerchantModel = {url: "<m:url value='/accountCheck/listAccountCheck.do'/>",
					 	colModel:[
							{name : "storeName",label:"商户名称",index : "store_name"},	
							{name : "createDate",label:"日期",index : "create_date"},				
							{name : "createTime",label:"订单时点",index : "create_time"},				
							{name : "orderNo",label:"订单号",index : "order_no"},				
							{name : "orginPrice",label:"原价",index : "orgin_price"},				
							{name : "discountPrice",label:"菜品折扣",index : "discount_price"},				
							{name : "afterDiscountPrice",label:"折扣菜金额",index : "after_discount_price"},	
							{name : "specialOffer",label:"特价结算"},
							{name : "actualPrice",label:"原价菜金额",index : "actual_price"},				
							{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,editFlag:true,calculate:"0.7",
	           					formatter : function(value, options, rData){boundMerchantorderSaleRate = options.colModel.calculate;return eval(options.colModel.calculate);}},
							{name : "amountPayable",label:"结算金额",index : "amount_payable"}
		           		]};
//绑公司卡对账表表头         
var boundCompanyorderSaleRate = localStorage.getItem("boundCompanyorderSaleRate")?localStorage.getItem("boundCompanyorderSaleRate"):0.7;
var boundCompanyModel = {url: "<m:url value='/accountCheck/listAccountCheck.do'/>",
						colModel:[
							{name : "storeName",label:"商户名称",index : "store_name"},	
							{name : "createDate",label:"日期",index : "create_date"},				
							{name : "createTime",label:"订单时点",index : "create_time"},				
							{name : "orderNo",label:"订单号",index : "order_no"},				
							{name : "orginPrice",label:"原价",index : "orgin_price"},				
							{name : "discountPrice",label:"菜品折扣",index : "discount_price"},				
							{name : "afterDiscountPrice",label:"折扣菜金额",index : "after_discount_price"},	
							{name : "",label:"特价结算"},
							{name : "actualPrice",label:"原价菜金额",index : "actual_price"},				
							{name : "orderSaleRate",label:"结算比例",index : "order_sale_rate",hidden:true,editFlag:true,calculate:"0.7",
	           					formatter : function(value, options, rData){boundCompanyorderSaleRate = options.colModel.calculate;return eval(options.colModel.calculate);}},
							{name : "amountPayable",label:"结算金额",index : "amount_payable"}
		           		]};
	$(function(){
		initGrid("boundMerchant");
		Finance.changeTabMenu();
    });
    function cellFormat(value, options, rData){
		return eval(options.colModel.calculate);
	};
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
		gridObj = Finance.createGrid(ways,localStorageModel,false,false);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('editFlag');
	}
	
	//config grid
	function loadConfigGrid(ways,colModel){
		$(".listtable_box").html("");
		$(".listtable_box").html('<table id="'+ways+'" ></table><div id="'+ways+'prowed"></div>');
		$("#orderSaleRate").val(localStorage.getItem(ways+"orderSaleRate")?localStorage.getItem(ways+"orderSaleRate"):0.7);
		gridObj = Finance.loadConfigGrid(ways,colModel,false,false);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('editFlag');
	}
	//配置的弹出框
	var config_iframe_dialog;
	//关闭配置页面，供子页面调用
  	function closeConfig(){
  		config_iframe_dialog.close();
  	}
	
    //导出运营明细数据
    function exportData(){
    	ExpExcel.showWin(gridObj,baseUrl+"/accountCheck/exportDetailExcel.do",'grid','queryForm');
    }
    
  //生成运营汇总表
    function genTotal(){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id');
    	var orderSaleRate = eval(tableId+"orderSaleRate");
   		$ .ajax({
   			type: "post",
   			data:{orderSaleRate:orderSaleRate,
   					id:tableId},
			url: baseUrl+"/accountCheck/addByCheckDetail.do",
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
</script>
</head>
<body style="height:100%;">
	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li>
					<input type="hidden" name="orderSaleRate" id="orderSaleRate">
					<input type="text" name="storeName" id="storeName" class="search_choose"> 
					<span>店铺名称:</span></li><!-- 输入框-->
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
					 <option value="elm">饿了么</option><option value="meituan">美团</option>
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
							<a title="根据订单详细显示绑商家卡对账表" href="javascript:;" class="tableTab" data-id=boundMerchant>   
								<i class="back_icon show_icon"> </i> 
								<span>绑商家卡对账表</span>
							</a>
						</li>
						<li>
							<a title="根据订单详细显示绑公司卡对账表" href="javascript:;"  class="tableTab" data-id="boundCompany"> 
								<i class="back_icon show_icon"> </i> 
								<span>绑公司卡对账表</span>
							</a>
						</li>
						</c:if>
						<c:if test="${exportData}">
							<li>
								<a title="根据订单详细导出对账详细数据" href="javascript:;" onclick="exportData();"> 
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
					<table  id="boundMerchant" ></table>
					<div  id="boundMerchantprowed"></div>	
				</div>
				<div><input type="button" value= "确定并生成对账汇总信息" onclick="genTotal();" class="btn"></div>
		</div>
	</div>
</body>
</html>
