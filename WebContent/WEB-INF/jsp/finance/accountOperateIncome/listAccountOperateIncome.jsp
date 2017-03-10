<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
	$(function(){
  		gridObj = new biz.grid({
            id:"#remote_rowed",/*html部分table id*/
            url: "<m:url value='/accountOperateIncome/listOperaData.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
           	sortname:"create_date",
           	sortorder:"asc",
           	emptyrecords: "无记录可显示",
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:10,//默认显示15条
            colModel:[
				{name : "storeName",label:"店铺",index : "store_name"},
				{name : "id",hidden : true,key : true,label:"主键",index : "id"},				
				{name : "createDate",label:"日期",index : "create_date"},				
				{name : "createTime",label:"订单时点",index : "create_time"},				
				{name : "orderNo",label:"订单编号",index : "order_no"},				
				{name : "orginPrice",label:"原价",index : "orgin_price"},				
				{name : "discountPrice",label:"菜品折扣",index : "discount_price"},				
				{name : "afterDiscountPrice",label:"折扣后菜价格",index : "after_discount_price"},				
				{name : "actualPrice",label:"实际结算折扣菜金额",index : "actual_price"},				
				{name : "orderDistributionCharge",label:"订单上收取客户配送费",index : "order_distribution_charge"},				
				{name : "platformDistributionCharge",label:"平台收取客户配送费",index : "platform_distribution_charge"},				
				{name : "cyzDistributionCharge",label:"公司收取客户配送费",index : "cyz_distribution_charge"},				
				{name : "invalidNum",label:"无效单",index : "invalid_num"},				
				{name : "validNum",label:"有效单",index : "valid_num"},				
				{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount"},				
				{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable"},				
				{name : "seventypProductSaleAmount",label:"70%结算金额",index : "seventyP_product_sale_amount"},				
				{name : "discountBackCommission",label:"折扣菜退还佣金",index : "discount_back_commission"},				
				{name : "amountPayable",label:"应付店铺结算金额",index : "amount_payable"},				
				{name : "cyzServiceCharge",label:"公司收取店铺服务费",index : "cyz_service_charge"},				
				{name : "cyzActivitiesCharge",label:"公司承担线上活动费",index : "cyz_activities_charge"},				
				{name : "cyzAllIncome",label:"公司收入",index : "cyz_all_income"},				
				{name : "saleGrossProfit",label:"销售毛利",index : "sale_gross_profit"},				
				{name : "saleGrossProfitRate",label:"毛利率",index : "sale_gross_profit_rate"},				
				{name : "distributionActualPayment",label:"自配送实际支付金额",index : "distribution_actual_payment"},				
				{name : "platformActivitiesCharge",label:"平台承担线上活动费",index : "platform_activities_charge"},				
				{name : "platformServiceCharge",label:"平台服务费",index : "platform_service_charge"},				
				{name : "shouldDistributionCharge",label:"应收取自配送金额",index : "should_distribution_charge"},				
				{name : "cyzDistributionChargeActual",label:"实际按10元/单自配送金额",index : "cyz_distribution_charge_actual"},				
				{name : "diffDistributionCharge",label:"按10元/单自配送金额补差",index : "diff_distribution_charge"},				
				{name : "platformSubsidy",label:"平台补贴服务费",index : "platform_subsidy"},				
				{name : "actual",label:"实际运营毛利(销售毛利-补差-服务费)",index : "platform_subsidy"},
				{name : "platformType",label:"平台类型",index : "platform_type"},				
				{name : "storeId",label:"店铺ID",index : "store_id"}				
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
    		}
      });
        
	new biz.datepicker({
  			id : "#startDate",
  			maxDate:'#F{$dp.$D(\'endDate\',{d:0});}',
  			dateFmt:'yyyy-MM-dd'
  		});
  	    
  	    new biz.datepicker({
  			id : "#endDate",
  			minDate:'#F{$dp.$D(\'startDate\',{d:0});}',
  			dateFmt:'yyyy-MM-dd'
  		});
    });

 

    //新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
   	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
  	
  	function add(){
  	//xin zeng iframe 弹出框
		var url="<m:url value='/accountOperateIncome/toAddAccountOperateIncome.do'/>";
		add_iframe_dialog = new biz.dialog({
			id:$('<div id="addwindow_iframe"></div>').html('<iframe id="iframeAdd" name="iframeAdd" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 235,
			title: "运营数据增加"
		});
		add_iframe_dialog.open();
  	}
  	
  	//关闭新增页面，供子页面调用
  	function closeAdd(){
		add_iframe_dialog.close();
  	}
  	
    function edit(){
		var key = ICSS.utils.getSelectRowData("id");
		if(key.indexOf(",")>-1||key==""){
			showMessage("请选择一条数据！");
			return ;
		}
		var url="<m:url value='/accountOperateIncome/toEditAccountOperateIncome.do'/>?key="+key;
		edit_iframe_dialog = new biz.dialog({
		 	id:$('<div id="editwindow_iframe"></div>').html('<iframe id="iframeEdit" name="iframeEdit" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 235,
			title: "运营数据编辑"
		});
  		edit_iframe_dialog.open();
    }
    
    //关闭编辑页面，供子页面调用
    function closeEdit(){
    	edit_iframe_dialog.close();
    }
    
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
    
    //删除
    function batchDelete(){
    	var ids = ICSS.utils.getSelectRowData("id");
    	if(ids==""){
    		showMessage("请至少选择一条数据！");
    		return ;
    	}else{
    		new biz.alert({type:"confirm",message:I18N.msg_del_confirm,title:I18N.promp,callback:function(result){
    			if(result){
    				$ .ajax({
        				url: "<m:url value='/accountOperateIncome/deleteAccountOperateIncome.do'/>?key="+ids,
        				cache:false,
        				success: function(data, textStatus, jqXHR){
        					doSearch();
    						showInfo("删除成功",3000);
        				}
        			});
    			}
    		}}) ;   
    	}
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
							<input class="timepicker text" name="propsMap['startTime']"  type="text" />
						</div>
						</div>
					<i>至</i>
					<div class="time_bg">
						<div class="input-group bootstrap-timepicker">
							<input class="timepicker text" name="propsMap['endTime']"  type="text" />
						</div>
					</div>
					</li>		
				 <li><select class="search_select" name="platformType" id="platformType"><option value="">---请选择---</option>
					 <option value="elm">饿了么</option><option value="meituan">美团</option>
					</select><span>平台类型:</span></li><!--下拉 -->
				 <li><select class="search_select" name="distributionMode" id="distributionMode"><option value="">---请选择---</option></select>
				<span>配送方式:</span></li><!--下拉 -->
				<li><input type="reset" class="reset_btn" onclick="resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="doSearch();" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<c:if test="${add}">
							<li><a title="<m:message code="button.add"/>" href="javascript:;"
								onclick="add();"> <i class="icon_bg icon_add"> </i> <span><m:message
											code="button.add" /></span>
							</a></li>
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
						<li><a title="<m:message code="button.view"/>" href="javascript:"
							onclick="show();"> <i class="icon_bg icon_ckxq"></i> <span><m:message
										code="button.view" /></span>
						</a></li>
						<!-- <li>
							<a title="导入数据" href="javascript:;" onclick="$('#file').click()"> 
								<i class="back_icon import_icon"> </i> 
								<span>导入数据</span>
							</a>
							<form name="form" id="form" method="post"  enctype="multipart/form-data">
								<input type="file" id="file" name="file" style="display: none" onchange="importData();"/>
							</form>
						</li> -->
						<c:if test="${exportData}">
						<li>
							<a title="导出数据" href="javascript:;" onclick="exportData();"> 
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
				<table  id="remote_rowed" ></table>
				<div  id="remote_prowed"></div>		
				</div>
		</div>
	</div>
</body>
</html>
