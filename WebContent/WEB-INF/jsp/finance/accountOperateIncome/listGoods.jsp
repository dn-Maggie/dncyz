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
//格式化cell
function cellFormat(value, options, rData){
	if(rData.raw){
		return value;
	}else if(options.colModel.calculate.indexOf("rData")>0){
		return eval(options.colModel.calculate);
	}return value;
};
//菜品数量表表头
var goodsQuantityModel = {url: "<m:url value='/accountOrderDetail/listAccountSaleGoods.do'/>",
						colModel:[
						{name : "id",hidden : true,key : true,label:"主键",index : "id"},						
						/* {name : "storeName",label:"商户名称",index : "store_name"}, */	
						{name : "createDate",label:"日期",index : "create_date"},		
						{name : "goodsName",label:"商品名称"},	
						{name : "goodsQuality",label:"销售量",isBasic:true},	
						{name : "goodsPrice",label:"结算单价",isBasic:true},	
						{name : "",label:"销售额",calculate:"rData['goodsQuality'] * rData['goodsPrice']",editFlag:true,
							formatter : cellFormat},	
        				{name : "platformType",label:"平台类型",index : "platform_type",calculate:"value!='elm'?value!='meituan'?'百度':'美团':'饿了么';",
							},
				       	]};
	$(function(){
			initGrid("goodsQuantity");
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
		gridObj = Finance.createGrid(ways,localStorageModel,false,false);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
	}
	
	//config grid
	function loadConfigGrid(ways,colModel){
		$(".listtable_box").html("");
		$(".listtable_box").html('<table id="'+ways+'" ></table><div id="'+ways+'prowed"></div>');
		gridObj = Finance.loadConfigGrid(ways,colModel,false,false);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('isBasic');
		$("#"+ways).setColProp('editFlag');
	}
	//配置的弹出框
	var config_iframe_dialog;
	//关闭配置页面，供子页面调用
  	function closeConfig(){
  		config_iframe_dialog.close();
  	}
 	//生成运营汇总表
    function genTotal(){
    	var tableId = $('.listtable_box').find('table.ui-jqgrid-btable').attr('id');
    	var orderSaleRate = eval(tableId+"orderSaleRate");
   		$ .ajax({
   			type: "post",
   			data:{orderSaleRate:orderSaleRate,
   					id:tableId},
			url: baseUrl+"/accountOperaTotal/addTotalByOperaDetail.do?type="+tableId,
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
				 <li><select class="search_select" name="platformType" id="platformType"><option value=""></option>
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
					<table  id="goodsQuantity" ></table>
					<div  id="goodsQuantityprowed"></div>	
				</div>
		</div>
	</div>
</body>
</html>
