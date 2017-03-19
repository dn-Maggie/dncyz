<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<style>
	.ui-th-column, .ui-jqgrid .ui-jqgrid-htable th.ui-th-column{
		white-space:normal; 
	}
	.header-context-menu{
		padding:10px;
		border:1px solid #bbb;
		background-color:#eee;
		position:absolute;
		top:0px;
		left:0px;
		z-index:999;
		display:none;
	}
	.ui-jqgrid-sortable{
		font-weight:normal;
	}
	.header-context-menu .headers{
		padding:0;
		margin:0;
		list-style:none;
	}
	.header-context-menu .headers li:hover{
		background-color:rgb(152, 152, 152);
		color:#fff;
	}
	.header-context-menu .headers li label{
		padding-left:10px;
		width:100%;
	}
	.header-context-menu .headers li label b{
		font-weight:normal;
		margin-left:10px;
		top:3px;
		position:relative;
	}
</style>
<title></title>
<script type="text/javascript">
var gridObj = {};
//底价运营表表头         
var basePriceModel =  {url: "<m:url value='/accountOperateIncome/listAllFromOrderDetail.do'/>",
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
        				{name : "allcyzDistributionCharge",label:"自配送实际支付金额"},
        				{name : "allplatformActivitiesSubsidies",label:"平台承担线上活动费"},
	       				{name : "allactivitiesSubsidyBycompany",label:"公司承担线上活动费"},
	       				{name : "allserviceCharge",label:"平台服务费"},
	       				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editable:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
				       	]};
//销售额比例抽佣运营表表头         
var salesRateModel = {url: "<m:url value='/accountOperateIncome/listAllFromOrderDetail.do'/>",
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
        				{name : "allcyzDistributionCharge",label:"自配送实际支付金额"},
        				{name : "allplatformActivitiesSubsidies",label:"平台承担线上活动费"},
	       				{name : "allactivitiesSubsidyBycompany",label:"公司承担线上活动费"},
	       				{name : "allserviceCharge",label:"平台服务费"},
		  				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editable:true,
								formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
				       	]};
//平台到账抽佣运营表表头            		
var platformAccountModel = {
						url: "<m:url value='/accountOperateIncome/listAllFromOrderDetail.do'/>",
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
        				{name : "allcyzDistributionCharge",label:"自配送实际支付金额"},
        				{name : "allplatformActivitiesSubsidies",label:"平台承担线上活动费"},
	       				{name : "allactivitiesSubsidyBycompany",label:"公司承担线上活动费"},
	       				{name : "allserviceCharge",label:"平台服务费"},
        				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editable:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
				       	]};				      
//深运营表表头         
var deepOperationModel ={url: "<m:url value='/accountOrderDetail/listAccountOrderDetail.do'/>",
						colModel:[
						{name : "storeName",label:"商户名称",index : "store_name"},		
						{name : "createDate",label:"日期",index : "create_date"},		
						{name : "allinvalidNum",label:"无效单"},				
	        			{name : "allvalidNum",label:"有效单"},	
						{name : "productSaleAmount",label:"产品销售金额",calculate:"rData['mealFee'] + rData['prices'] - rData['activitiesSubsidyBymerchant']",editable:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
						{name : "settlementAmount",label:"应收平台结算金额",index : "settlement_amount"},				
						{name : "amountPayable",label:"品牌商家应收",index : "amount_payable",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*0.7+rData['activitiesSubsidyBymerchant']",editable:true,
			      			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
		      			{name : "",label:"运营应收",calculate:"(rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*0.7",editable:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
						{name : "",label:"运营实收",calculate:"rData['prices']+rData['mealFee']-((rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*0.7+rData['activitiesSubsidyBymerchant'])-(rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant'])-rData['serviceCharge']",editable:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
						{name : "",label:"运营收取客户配送费",calculate:"(rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant'])*(1-0.7)",editable:true,
		       				formatter : function(value, options, rData){return eval(options.colModel.calculate);}},				
	       				{name : "",label:"运营承担线上活动费"},				
						{name : "",label:"工厂应收",calculate:"(rData['prices']+rData['mealFee']-((rData['mealFee']+rData['prices']-rData['activitiesSubsidyBymerchant']-(rData['specialOffer']>0?rData['specialOffer']:rData['foodDiscount']))*0.7+rData['activitiesSubsidyBymerchant'])-(rData['merchantActivitiesSubsidies']-rData['activitiesSubsidyBymerchant'])-rData['serviceCharge'])/((rData['prices']+rData['mealFee']-rData['activitiesSubsidyBymerchant'])*(1-0.7))",editable:true,
			     			formatter : function(value, options, rData){return eval(options.colModel.calculate);}},	
		     			{name : "",label:"平台承担线上活动费",},
		     			{name : "",label:"平台服务费",},
						{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editable:true,
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
	//初始化grid
	function initGrid(ways){
		gridObj = new biz.grid({
	        id:"#"+ways,
	        autoScroll:false,   
	        footerrow:true,
	        url: eval(ways+"Model.url"),
	       	sortname:"create_date",
	       	sortorder:"asc",
	       	pager: "#"+ways+"prowed",
	        colModel:eval(ways+"Model.colModel"),
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
			 	$(".ui-jqgrid-sdiv").show();
		    	$(this).footerData("set",{
		    		"rn":"合计",
		    		"allinvalidNum":$(this).getCol("allinvalidNum",false,"sum"),
		    		"allvalidNum":$(this).getCol("allvalidNum",false,"sum"),
		    		"allproductSaleAmount":$(this).getCol("allproductSaleAmount",false,"sum").toFixed(2),
		    		"allamountReceivable":$(this).getCol("allamountReceivable",false,"sum").toFixed(2),
		    		"allamountPayable":$(this).getCol("allamountPayable",false,"sum").toFixed(2), 
		    		"allcyzServiceCharge":$(this).getCol("allcyzServiceCharge",false,"sum").toFixed(2), 
		    		"allsaleGrossProfit":$(this).getCol("allsaleGrossProfit",false,"sum").toFixed(2), 
		    	 	"allcyzDistributionCharge":$(this).getCol("allcyzDistributionCharge",false,"sum").toFixed(2) 
		    		}); //将合计值显示出来
			}  
	      });
		$("#"+ways).setColProp('calculate');
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
