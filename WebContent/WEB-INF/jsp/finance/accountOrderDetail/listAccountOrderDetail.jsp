<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script src="<%=request.getContextPath() %>/js/extend/finance.js"></script>
<script type="text/javascript">
var gridObj = {};
var orderDetailModel = {
		url: "<m:url value='/accountOrderDetail/listAccountOrderDetail.do'/>",
		colModel:[
					{name : "id",hidden : true,key : true,label:"账单ID",index : "id"},	
					/* {name : "storeName",label:"商户名称",index : "store_name"}, */		
					{name : "createDate",label:"创建日期",index : "create_date"},				
					{name : "orderType",label:"订单类型",index : "order_type"
						,formatter:GridColModelForMatter.orderType},				
					{name : "orderTime",label:"订单创建时间",index : "order_time"},				
					{name : "overTime",label:"订单完成时间",index : "over_time"},				
					{name : "orderNo",label:"订单号",index : "order_no"},				
					{name : "orginPrice",label:"菜价",index : "orginPrice"},				
					{name : "mealFee",label:"餐盒费",index : "meal_fee"},				
					/* {name : "giftAllowance",label:"赠品补贴",index : "gift_allowance"}, */	
					{name : "activitiesSubsidyBymerchant",label:"实际菜品折扣",index : "activities_subsidy_bymerchant",editable:true},				
					{name : "specialOffer",label:"结算菜特价",index : "special_offer"},			
					{name : "distributionMode",label:"配送方式",index : "distribution_mode"},	
					{name : "orderDistCharge",label:"订单取配送费",index : "order_dist_charge",editable:true},
					{name : "platformDistCharge",label:"平台收取配送费",index : "platform_dist_charge",editable:true},
					{name : "merchantDistCharge",label:"公司收取配送费",index : "merchant_dist_charge",editable:true},			
					{name : "merchantActivitiesSubsidies",label:"商户承担活动补贴",index : "merchant_activities_subsidies",editable:true},		
					{name : "platformActivitiesSubsidies",label:"平台承担活动补贴",index : "platform_activities_subsidies",editable:true},	
					/* {name : "merchantSubsidyVouchers",label:"商户承担代金券补贴",index : "merchant_subsidy_vouchers"},	
					{name : "platformSubsidyVouchers",label:"平台承担代金券补贴",index : "platform_subsidy_vouchers"}, */
					/* {name : "serviceRate",label:"服务费费率",index : "service_rate"},	 */			
					{name : "serviceCharge",label:"服务费",index : "service_charge"},				
					/* {name : "refundAmount",label:"用户申请退单金额",index : "refund_amount"}, */				
					{name : "settlementAmount",label:"结算金额",index : "settlement_amount"},				
					{name : "remark",label:"备注",index : "remark",editable:true},		
					{name : "platformType",label:"平台类型",index : "platform_type",
						formatter:function(cellvalue, options, rowObject){
			 				 if (cellvalue=='elm') {return '饿了么';}
			 				 else if (cellvalue=='meituan'){return '美团';}
			 				 else if (cellvalue=='baidu'){return '百度';}
					}},
	           	]};
	$(function(){
		initGrid("orderDetail");
    });
	function executeDownload(){
		var fid = $("#downloadform");
		$("#downloadform").attr("action", "<%=request.getContextPath()%>/download/fileDownload");
		fid.submit();
	}
	function initGrid(ways){
		gridObj = Finance.createGrid(ways,orderDetail.colModel,true,true,baseUrl+"/accountOrderDetail/updateAccountOrderDetail.do");
	}
	
    //新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
   	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
  	
  	function add(){
  		var url = baseUrl+'/accountOrderDetail/toAddAccountOrderDetail.do';
		var title = "订单明细增加";
		add_iframe_dialog = Add.create(url, title);
		List.openDialog(add_iframe_dialog);
  	}
	function closeAdd(){
		List.closeDialog(add_iframe_dialog);
	}
    function edit(){
		var key = ICSS.utils.getSelectRowData("id");
		var url=baseUrl+'/accountOrderDetail/toEditAccountOrderDetail.do';
		var title = "订单明细编辑";
		edit_iframe_dialog = Edit.create(key, url, title);
		List.openDialog(edit_iframe_dialog);
    }
    //关闭编辑页面，供子页面调用
    function closeEdit(){
    	List.closeDialog(edit_iframe_dialog);
    }
    function show(){
    	var key = ICSS.utils.getSelectRowData("id");
		var url = baseUrl+'/accountOrderDetail/toShowAccountOrderDetail.do';
		var title = "餐饮品牌详细";
		show_iframe_dialog = Show.create(key, url, title);
		List.openDialog(show_iframe_dialog);
    }
    //关闭查看页面，供子页面调用
    function closeShow(){
    	List.closeDialog(show_iframe_dialog);
    }
    //删除
    function batchDelete(){
    	var ids = ICSS.utils.getSelectRowData("id");
		var url = baseUrl+'/accountOrderDetail/deleteAccountOrderDetail.do';
		List.batchDelete(id, url);
    }
    //导入excel数据
	function importData(){
		ExpExcel.showImportWin();
	}
    //下载模板
    function downloadTemplate(){
    	ExpExcel.showDownloadWin();
    }
 	//导出订单详细数据
 	function exportData(){
 		ExpExcel.showWin(gridObj,baseUrl+"/accountOrderDetail/exportExcel.do",'grid','queryForm');
 	}
	//生成运营汇总表
    function genTotal(ways){
   		$ .ajax({
   			type: "post",
   			data:Finance.getQueryCondition(),
			url: baseUrl+"/operaDate/addByOrderDetail.do?type="+ways,
			cache:false,
			dataType:"json",
			success : function(response) {
				showMessage(response.message,"提示", 2000);
			}
		});
    }
    </script>
</head>
<body style="height:100%;">

	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li><span>商户名称：</span>
					<select class="search_select choose_select" name="storeName" id="storeName">
						<c:forEach var="store" items="${store}">
							<option value="${store.storeName}"> <c:out value="${store.storeName}"></c:out> </option>
		             	</c:forEach>
					</select>
				</li>
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
				 <li>
				 	<select class="search_select" name="platformType" id="platformType">
				 		<option value="">---请选择---</option>
					 	<option value="elm">饿了么</option>
					 	<option value="meituan">美团</option>
					 	<option value="baidu">百度</option>
					</select>
					<span>平台类型:</span>
				 </li>
				  <li>
				 	<select class="search_select" name="distributionMode" id="distributionMode">
				 		<option value="">---请选择---</option>
				 		<option value="">商家自配</option>
					 	<option value="">平台专配</option>
				 	</select>
					<span>配送方式:</span>
				 </li>
				 <li>
					<input type="reset" class="reset_btn" onclick="List.resetForm('queryForm')" value="重置"><!-- 重置 -->
					<input type="button" class="search_btn mr22 " onclick="List.doSearch(gridObj);" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
					<li>
						<a title="下载模板" href="javascript:" onclick="downloadTemplate();">
						<i class="icon_bg icon_download"></i> <span>下载模板</span>
						</a>
					</li>
					 <c:if test="${importData}">
						<li>
							<a title="导入原始数据" href="javascript:;" onclick="importData();"> 
								<i class="back_icon import_icon"> </i> 
								<span>导入原始数据</span>
							</a>
						</li>
					</c:if> 
					<c:if test="${exportData}">
						<li>
							<a title="导出数据" href="javascript:;" onclick="exportData();"> 
								<i class="back_icon import_icon"> </i> 
								<span>导出数据</span>
							</a>
						</li>
					</c:if>
					<c:if test="${delete}">
						<li>
							<a title="<m:message code="button.delete"/>" href="javascript:;"
								onclick="batchDelete();"> <i class="icon_bg icon_del"></i> <span><m:message code="button.delete" /></span>
							</a>
						</li>
					</c:if>
					<li>
						<a href="javascript:;" class="btn" onclick="genTotal('basePrice');">
							<span>生成底价运营表</span>
						</a>
					</li>
					<li>
						<a href="javascript:;" class="btn" onclick="genTotal('deepOpera');">
							<span>生成深运营运营表</span>
						</a>
					</li>
					<li>
						<a href="javascript:;" class="btn" onclick="genTotal('saleRate');">
							<span>生成销售额比例抽佣运营表</span>
						</a>
					</li>
					<li>
						<a href="javascript:;" class="btn" onclick="genTotal('platformAccount');">
							<span>生成平台到款抽佣运营表</span>
						</a>
					</li>
					</ul>
				</div>
	
				<!--功能按钮end-->
				<div class="listtable_box">
					<!--此处放表格-->
					<table  id="orderDetail" ></table>
					<div  id="orderDetailprowed"></div>		
				</div>
		</div>
	</div>
</body>
</html>
