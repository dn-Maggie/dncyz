<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
	$(function(){
		initGridByOrder();
    });

 	function initGridByOrder(){
 		$("#gbox_remote_rowed2").css("display","none");
 		$("#gbox_remote_rowed").css("display","block");
 		gridObj = new biz.grid({
            id:"#remote_rowed",/*html部分table id*/
            url: "<m:url value='/accountOrderDetail/listOperaData.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
            footerrow:true,
            emptyrecords: "无记录可显示",
           	sortname:"create_time",
           	sortorder:"asc",
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:15,//默认显示15条
            colModel:[
				{name : "id",hidden : true,key : true,label:"主键",index : "id"},
				{name : "storeName",label:"商户名称",index : "store_name"},	
				{name : "createDate",label:"日期",index : "create_date"},				
				{name : "createTime",label:"订单时点",index : "create_time"},				
				{name : "orderNo",label:"订单编号",index : "order_no"},				
				{name : "orginPrice",label:"原价",index : "orgin_price"},				
				{name : "discountPrice",label:"菜品折扣",index : "discount_price"},				
				{name : "afterDiscountPrice",label:"折扣菜金额",index : "after_discount_price"},				
				{name : "actualPrice",label:"结算特价",index : "actual_price"},				
				{name : "orderDistributionCharge",label:"订单上收取客户配送费",index : "order_distribution_charge"},				
				{name : "platformDistributionCharge",label:"平台收取客户配送费",index : "platform_distribution_charge"},				
				{name : "cyzDistributionCharge",label:"公司收取客户配送费",index : "cyz_distribution_charge"},				
				{name : "cyzActivitiesCharge",label:"公司承担线上活动费",index : "cyz_activities_charge"},	
				{name : "platformActivitiesCharge",label:"平台承担线上活动费",index : "platform_activities_charge"},
				{name : "platformServiceCharge",label:"平台服务费",index : "platform_service_charge"},		
				/* {name : "invalidNum",label:"无效单",index : "invalid_num"},				
				{name : "validNum",label:"有效单",index : "valid_num"},	 */			
				{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount"},				
				{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable"},				
				{name : "seventypProductSaleAmount",label:"70%结算金额",index : "seventyP_product_sale_amount"},				
				{name : "amountPayable",label:"应付店铺结算金额",index : "amount_payable"},				
				{name : "cyzServiceCharge",label:"公司收取店铺服务费",index : "cyz_service_charge"},				
				{name : "distributionActualPayment",label:"自配送实际支付金额",index : "distribution_actual_payment"},
				{name : "saleGrossProfit",label:"销售毛利",index : "sale_gross_profit"},				
				{name : "saleGrossProfitRate",label:"毛利率",index : "sale_gross_profit_rate"},	
				{name : "remark",label:"备注",index : "remark"},
				{name : "platformType",label:"平台类型",index : "platform_type",
					formatter:function(cellvalue, options, rowObject){
		 				 if (cellvalue=='elm') {return '饿了么';}
		 				 else if (cellvalue=='meituan'){return '美团';}
		 				 else if (cellvalue=='baidu'){return '百度';}
				}},			
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
    		},
	  		gridComplete:function(){
		    	$(".ui-jqgrid-sdiv").show();
		    	$(this).footerData("set",{
		    		"rn":"合计",
		    		"orginPrice":$(this).getCol("orginPrice",false,"sum").toFixed(2),
		    		"discountPrice":$(this).getCol("discountPrice",false,"sum").toFixed(2),
		    		"afterDiscountPrice":$(this).getCol("afterDiscountPrice",false,"sum").toFixed(2),
		    		"actualPrice":$(this).getCol("actualPrice",false,"sum").toFixed(2),
		    		"cyzDistributionCharge":$(this).getCol("cyzDistributionCharge",false,"sum").toFixed(2),
		    		"cyzActivitiesCharge":$(this).getCol("cyzActivitiesCharge",false,"sum").toFixed(2),
		    		"platformActivitiesCharge":$(this).getCol("platformActivitiesCharge",false,"sum").toFixed(2),
		    		"platformServiceCharge":$(this).getCol("platformServiceCharge",false,"sum").toFixed(2),
		    		"productSaleAmount":$(this).getCol("productSaleAmount",false,"sum").toFixed(2),
		    		"amountReceivable":$(this).getCol("amountReceivable",false,"sum").toFixed(2),
		    		"seventypProductSaleAmount":$(this).getCol("seventypProductSaleAmount",false,"sum").toFixed(2),
		    		"amountPayable":$(this).getCol("amountPayable",false,"sum").toFixed(2),
		    		"cyzServiceCharge":$(this).getCol("cyzServiceCharge",false,"sum").toFixed(2),
		    		"saleGrossProfit":$(this).getCol("saleGrossProfit",false,"sum").toFixed(2)
		    		}); //将合计值显示出来
			}
      });
 	}

 	
 	function initGridByOpera(){
 		$("#gbox_remote_rowed").css("display","none");
 		$("#gbox_remote_rowed2").css("display","block");
 		gridObj = new biz.grid({
            id:"#remote_rowed2",/*html部分table id*/
            url: "<m:url value='/accountOperateIncome/listAccountOperateIncome.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
            footerrow:true,
            emptyrecords: "无记录可显示",
           	sortname:"create_time",
           	sortorder:"asc",
           	pager: '#remote_prowed2' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:15,//默认显示15条
            colModel:[
				{name : "id",hidden : true,key : true,label:"主键",index : "id"},
				{name : "storeName",label:"商户名称",index : "store_name"},	
				{name : "createDate",label:"日期",index : "create_date"},				
				{name : "createTime",label:"订单时点",index : "create_time"},				
				{name : "orderNo",label:"订单编号",index : "order_no"},				
				{name : "orginPrice",label:"原价",index : "orgin_price"},				
				{name : "discountPrice",label:"菜品折扣",index : "discount_price"},				
				{name : "afterDiscountPrice",label:"折扣菜金额",index : "after_discount_price"},				
				{name : "actualPrice",label:"结算特价",index : "actual_price"},				
				{name : "orderDistributionCharge",label:"订单上收取客户配送费",index : "order_distribution_charge"},				
				{name : "platformDistributionCharge",label:"平台收取客户配送费",index : "platform_distribution_charge"},				
				{name : "cyzDistributionCharge",label:"公司收取客户配送费",index : "cyz_distribution_charge"},				
				{name : "cyzActivitiesCharge",label:"公司承担线上活动费",index : "cyz_activities_charge"},	
				{name : "platformActivitiesCharge",label:"平台承担线上活动费",index : "platform_activities_charge"},
				{name : "platformServiceCharge",label:"平台服务费",index : "platform_service_charge"},		
				{name : "productSaleAmount",label:"产品销售金额",index : "product_sale_amount"},				
				{name : "amountReceivable",label:"应收平台结算金额",index : "amount_receivable"},				
				{name : "seventypProductSaleAmount",label:"70%结算金额",index : "seventyP_product_sale_amount"},				
				{name : "amountPayable",label:"应付店铺结算金额",index : "amount_payable"},				
				{name : "cyzServiceCharge",label:"公司收取店铺服务费",index : "cyz_service_charge"},				
				{name : "distributionActualPayment",label:"自配送实际支付金额",index : "distribution_actual_payment"},
				{name : "saleGrossProfit",label:"销售毛利",index : "sale_gross_profit"},				
				{name : "saleGrossProfitRate",label:"毛利率",index : "sale_gross_profit_rate"},	
				{name : "remark",label:"备注",index : "remark"},
				{name : "platformType",label:"平台类型",index : "platform_type",
					formatter:function(cellvalue, options, rowObject){
		 				 if (cellvalue=='elm') {return '饿了么';}
		 				 else if (cellvalue=='meituan'){return '美团';}
		 				 else if (cellvalue=='baidu'){return '百度';}
				}},			
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
    		},
	  		gridComplete:function(){
		    	$(".ui-jqgrid-sdiv").show();
		    	$(this).footerData("set",{
		    		"rn":"合计",
		    		"orginPrice":$(this).getCol("orginPrice",false,"sum").toFixed(2),
		    		"discountPrice":$(this).getCol("discountPrice",false,"sum").toFixed(2),
		    		"afterDiscountPrice":$(this).getCol("afterDiscountPrice",false,"sum").toFixed(2),
		    		"actualPrice":$(this).getCol("actualPrice",false,"sum").toFixed(2),
		    		"cyzDistributionCharge":$(this).getCol("cyzDistributionCharge",false,"sum").toFixed(2),
		    		"cyzActivitiesCharge":$(this).getCol("cyzActivitiesCharge",false,"sum").toFixed(2),
		    		"platformActivitiesCharge":$(this).getCol("platformActivitiesCharge",false,"sum").toFixed(2),
		    		"platformServiceCharge":$(this).getCol("platformServiceCharge",false,"sum").toFixed(2),
		    		"productSaleAmount":$(this).getCol("productSaleAmount",false,"sum").toFixed(2),
		    		"amountReceivable":$(this).getCol("amountReceivable",false,"sum").toFixed(2),
		    		"seventypProductSaleAmount":$(this).getCol("seventypProductSaleAmount",false,"sum").toFixed(2),
		    		"amountPayable":$(this).getCol("amountPayable",false,"sum").toFixed(2),
		    		"cyzServiceCharge":$(this).getCol("cyzServiceCharge",false,"sum").toFixed(2),
		    		"saleGrossProfit":$(this).getCol("saleGrossProfit",false,"sum").toFixed(2)
		    		}); //将合计值显示出来
			}
      });
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
 	//导入运营明细数据
    function importData(){
    	ExpExcel.showImportOperaWin();
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
				<li><input type="text" name="storeName" id="storeName" class="search_choose"> <span>店铺名称:</span></li><!-- 输入框-->
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
				<li><input type="reset" class="reset_btn" onclick="resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="doSearch();" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<c:if test="${exportData}">
						<li>
							<a title="根据订单详细导出运营详细数据" href="javascript:;" onclick="exportData();"> 
								<i class="back_icon import_icon"> </i> 
								<span>导出数据</span>
							</a>
						</li>
						</c:if>
						<c:if test="${importData}">
							<li>
								<a title="导入运营详细数据，计算运营汇总信息" href="javascript:;" onclick="importData();"> 
									<i class="back_icon import_icon"> </i> 
									<span>导入修改数据</span>
								</a>
							</li>
						</c:if> 
						<li>
							<a title="根据订单详细显示运营数据" href="javascript:;" onclick="initGridByOrder();"> 
								<i class="back_icon import_icon"> </i> 
								<span>查看计算数据</span>
							</a>
						</li>
						<li>
							<a title="根据导入数据显示运营数据" href="javascript:;" onclick="initGridByOpera();"> 
								<i class="back_icon import_icon"> </i> 
								<span>查看导入数据</span>
							</a>
						</li>
					</ul>
				</div>
	
			<!--功能按钮end-->
				<div class="listtable_box">
					<!--此处放表格-->
				<table  id="remote_rowed" ></table>
				<div  id="remote_prowed"></div>		
				<table  id="remote_rowed2" ></table>
				<div  id="remote_prowed2"></div>	
				</div>
		</div>
	</div>
</body>
</html>
