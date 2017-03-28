<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML  >
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
					{name : "storeName",label:"商户名称",index : "store_name"},		
					{name : "createDate",label:"创建日期",index : "create_date"},				
					{name : "orderType",label:"订单类型",index : "order_type"
						,formatter:GridColModelForMatter.orderType},				
					{name : "orderTime",label:"订单创建时间",index : "order_time"},				
					{name : "overTime",label:"订单完成时间",index : "over_time"},				
					{name : "orderNo",label:"订单号",index : "order_no"},				
					{name : "orginPrice",label:"菜价",index : "orginPrice"},				
					{name : "mealFee",label:"餐盒费",index : "meal_fee"},				
					{name : "giftAllowance",label:"赠品补贴",index : "gift_allowance"},				
					{name : "merchantActivitiesSubsidies",label:"商户承担活动补贴",index : "merchant_activities_subsidies"},		
					{name : "platformActivitiesSubsidies",label:"平台承担活动补贴",index : "platform_activities_subsidies"},	
					{name : "distributionMode",label:"配送方式",index : "distribution_mode"},	
					{name : "merchantDistCharge",label:"商户收取配送费",index : "merchant_dist_charge"},			
					{name : "platformDistCharge",label:"平台收取配送费",index : "platform_dist_charge"},	
					{name : "merchantSubsidyVouchers",label:"商户承担代金券补贴",index : "merchant_subsidy_vouchers"},	
					{name : "platformSubsidyVouchers",label:"平台承担代金券补贴",index : "platform_subsidy_vouchers"},
					/* {name : "serviceRate",label:"服务费费率",index : "service_rate"},	 */			
					{name : "serviceCharge",label:"服务费",index : "service_charge"},				
					/* {name : "refundAmount",label:"用户申请退单金额",index : "refund_amount"}, */				
					{name : "settlementAmount",label:"结算金额",index : "settlement_amount"},				
					{name : "remark",label:"备注",index : "remark"},		
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
	function initGrid(ways){
		gridObj = Finance.createGrid(ways,orderDetail.colModel,true,false);
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
	function executeDownload(){
		var fid = $("#downloadform");
		$("#downloadform").attr("action", "<%=request.getContextPath()%>/download/fileDownload");
		fid.submit();
	}
	//生成运营汇总表
    function genTotal(ways){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id');
    	var orderSaleRate = eval(tableId+"orderSaleRate");
   		$ .ajax({
   			type: "post",
   			data:{orderSaleRate:orderSaleRate,
   					id:tableId},
			url: baseUrl+"/accountOperaTotal/addByOrderDetail.do?type="+ways,
			cache:false,
			dataType:"json"
		});
    }
    </script>
</head>
<body style="height:100%;">

	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li><span>关键字：</span>
				<input type="text" name="storeName" id="storeName" class="search_choose" placeholder="商户名称">
				<input type="hidden" name="isInvalid" value="0"></li><!-- 输入框-->
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
				 <li><select class="search_select" name="distributionMode" id="distributionMode"><option value="">---请选择---</option></select>
				<span>配送方式:</span></li><!--下拉 -->
				<li><input type="reset" class="reset_btn" onclick="List.resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="List.doSearch(gridObj);" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
					<li><a title="下载模板" href="javascript:" onclick="downloadTemplate();">
							<i class="icon_bg icon_download"></i> <span>下载模板</span>
					</a></li>
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
						<c:if test="${edit}">
							<li><a title="<m:message code="button.edit"/>" href="javascript:;"
								onclick="edit();"><i class="icon_bg icon_edit"></i> <span><m:message
											code="button.edit" /></span> </a></li>
						</c:if>
						<c:if test="${delete}">
							<li><a title="<m:message code="button.delete"/>" href="javascript:;"
								onclick="batchDelete();"> <i class="icon_bg icon_del"></i> <span><m:message
											code="button.delete" /></span>
							</a></li>
						</c:if>
						<c:if test="${manage}">
						<li><a title="<m:message code="button.module.moduleRes"/>" href="javascript:"
							onclick="moduleResMgt();"> <i class="back_icon resources_icon"></i> <span><m:message
										code="button.module.moduleRes" /></span>
						</a></li>
						</c:if>
					</ul>
				</div>
	
				<!--功能按钮end-->
				<div class="listtable_box">
					<!--此处放表格-->
					<table  id="orderDetail" ></table>
					<div  id="orderDetailprowed"></div>		
				</div>
				<div>
					<input type="button" value= "生成底价运营表" onclick="genTotal('basePrice');" class="btn">
					<input type="button" value= "生成深运营运营表" onclick="genTotal('deepOpera');" class="btn">
					<input type="button" value= "生成销售额比例抽佣运营表" onclick="genTotal('saleRate');" class="btn">
					<input type="button" value= "生成平台到款抽佣运营表" onclick="genTotal('platformAccount');" class="btn">
				</div>
		</div>
	</div>
</body>
</html>
