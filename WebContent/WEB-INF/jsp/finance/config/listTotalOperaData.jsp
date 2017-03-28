<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<style>
	.ui-jqgrid-sortable{
		font-weight:normal;
	}
</style>
<title></title>
<script type="text/javascript">
var gridObj = {};
//浅运营汇总表表头         
var simpleTotalModel = {url: "<m:url value='/accountOperateIncome/listAllFromOrderDetail.do'/>",
					colModel:[
					{name : "storeName",label:"商户名称",index : "store_name"},	
					{name : "createDate",label:"日期",index : "create_date"},		
                  	{name : "allinvalidNum",label:"无效单"},				
	 				{name : "allvalidNum",label:"有效单"},	 
	 				{name : "allproductSaleAmount",label:"产品销售金额"},				
	 				{name : "",label:"应收平台结算金额"},	
	 				{name : "",label:"应付店铺结算金额"},				
	 				{name : "",label:"公司收入"},	
	 				{name : "",label:"销售毛利"},				
	 				{name : "",label:"按12.5元/单自配送金额"},	
	 				{name : "",label:"按12.5元/单自配送补差"},	
	 				{name : "",label:"收取自配送金额"},
	 				{name : "",label:"饿了吗平台补贴 "},
	 				{name : "",label:"对外支付饿了吗平台补贴服务费"},
	 				{name : "",label:"竞价费用+短信推广"},
	 				{name : "",label:"实际运营毛利"},
        				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editable:true,
							formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
				       	]};
//深运营汇总表表头
var deepTotalModel = {url: "<m:url value='/accountOperateIncome/listAllFromOrderDetail.do'/>",
					colModel:[
					{name : "storeName",label:"商户名称",index : "store_name"},	
					{name : "createDate",label:"日期",index : "create_date"},		
                  	{name : "allinvalidNum",label:"无效单"},				
	 				{name : "allvalidNum",label:"有效单"},	 
	 				{name : "allproductSaleAmount",label:"产品销售金额"},				
	 				{name : "",label:"应收平台结算金额"},	
	 				{name : "",label:"应付店铺结算金额"},				
	 				{name : "",label:"公司收入"},	
	 				{name : "",label:"销售毛利"},				
	 				{name : "",label:"按12.5元/单自配送金额"},	
	 				{name : "",label:"按12.5元/单自配送补差"},	
	 				{name : "",label:"收取自配送金额"},
	 				{name : "",label:"饿了吗平台补贴 "},
	 				{name : "",label:"对外支付饿了吗平台补贴服务费"},
	 				{name : "",label:"竞价费用+短信推广"},
	 				{name : "",label:"实际运营毛利"},
	 				{name : "remark",label:"备注（运营开始/截止）",index : "remark"},
	 				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",editable:true,
					formatter : function(value, options, rData){return eval(options.colModel.calculate);}},
			       	]};
		$(function(){
			initGrid("simpleTotal");
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
	        url: eval(ways+"Model.url"),
	       	sortname:"create_date",
	       	sortorder:"asc",
	       	pager: "#"+ways+"prowed",
	        colModel:localStorage.getItem(ways+"Model")?JSON.parse(localStorage.getItem(ways+"Model")):eval(ways+"Model.colModel"),
			serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
				$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
				return obj;
			},
		 	datatype: "json",/*数据类型，设置为json数据，默认为json*/
	        emptyrecords: "无记录可显示",
	        rowList:[10,15,50,100],//每页显示记录数
			rowNum:15,//默认显示15条
	      });
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('editable');
	}
	
	//config grid
	function loadConfigGrid(ways,colModel){
		$(".listtable_box").html("");
		$(".listtable_box").html('<table id="'+ways+'" ></table><div id="'+ways+'prowed"></div>');
		gridObj = new biz.grid({
	        id:"#"+ways,
	        url: eval(ways+"Model.url"),
	       	sortname:"create_date",
	       	sortorder:"asc",
	       	pager: '#'+ways+'prowed',
	        colModel:colModel,
			serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
				$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
				return obj;
			},
		 	datatype: "json",/*数据类型，设置为json数据，默认为json*/
	        emptyrecords: "无记录可显示",
	        rowList:[10,15,50,100],//每页显示记录数
			rowNum:15,//默认显示15条
	      });
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('editable');
	}
	//配置的弹出框
	var config_iframe_dialog;
	function configGrid(tableName,tableId){
			var url="<m:url value='/accountOperateIncome/toConfigGridTitle.do'/>";
			config_iframe_dialog = new biz.dialog({
				id:$('<div id="addwindow_iframe" ></div>').html('<iframe id="iframeAdd"  class="'+tableId+'" name="iframeAdd" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
				modal: true,
				width: $(window).width()*0.9,
				height: 600,
				title: tableName+"表头配置"
			});
			config_iframe_dialog.open();
	  	}
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
    
    //配置表头
    function configTitle(tableName,tableId){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id');
    	var tableName = $('.tableTab.checked').find('span').text();
    	configGrid(tableName,tableId);
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
					 <option value="elm">饿了么</option><option value="meituan">美团</option><option value="baidu">百度</option>
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
						<c:if test="${configTitle}">
							<li>
								<a title="配置表头标题" href="javascript:;" onclick="configTitle();"> 
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
