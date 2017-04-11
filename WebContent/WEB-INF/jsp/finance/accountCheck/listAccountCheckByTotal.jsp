<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script src="<%=request.getContextPath() %>/js/extend/finance.js"></script>
<title></title>
<script type="text/javascript">
var checkModel = {url: "<m:url value='/accountCheck/listTotalAccountCheck.do'/>",
				  colModel:[
					/* {name : "storeName",label:"商户名称",index : "store_name"}, */	
					{name : "createDate",label:"日期",index : "create_date"},				
					{name : "elmspecialOffer",label:"折扣菜金额"},	//特价菜结算			
					{name : "elmactualPrice",label:"饿了么结算款"},	//原价菜金额
					{name : "bdspecialOffer",label:"折扣菜金额"},				
					{name : "bdactualPrice",label:"百度结算款"},
					{name : "mtspecialOffer",label:"折扣菜金额"},				
					{name : "mtactualPrice",label:"美团结算款"},
					{name : "",label:"三平台小计"},		
					{name : "",label:"70%结算"},		
					{name : "",label:"特价菜结算"},		
					{name : "",label:"调整金额"},		
					{name : "",label:"实际结算"},		
					{name : "",label:"备注"},		
					{name : "elmRecieve",label:"饿了么平台到账"},	
					{name : "bdRecieve",label:"百度平台到账"},
					{name : "mtRecieve",label:"美团平台到账"},
					{name : "specialOffer",label:"其他（线下支付、商米扣款）"},	
					{name : "elmSettlement",label:"饿了么结算金额"},	
					{name : "bdSettlement",label:"百度结算金额"},
					{name : "mtSettlement",label:"美团结算金额"},
					{name : "specialOffer",label:"合计"},		
	           		]}
var gridObj = {};
	$(function(){
		initGrid("check");
		Finance.changeTabMenu();
    });
  	//导出财务总数据
 	function exportData(){
 		ExpExcel.showWin(gridObj,baseUrl+"/accountCheck/exportExcel.do",'grid',gridObj.id);
 	}
 	//初始化grid
	function initGrid(ways){
		gridObj = Finance.createGrid(ways,eval(ways+"Model.colModel"),false,true);
		$("#"+ways).setColProp('calculate');
		$("#"+ways).setColProp('editFlag');
		if(ways="check"){
			jQuery("#check").jqGrid('setGroupHeaders', {
		    useColSpanStyle: true, 
		    groupHeaders:[
			   {startColumnName: 'elmspecialOffer', numberOfColumns:2, titleText: '饿了么'},
			   {startColumnName: 'bdspecialOffer', numberOfColumns:2, titleText: '百度'},
			   {startColumnName: 'mtspecialOffer', numberOfColumns:2, titleText: '美团'},
			   {startColumnName: 'elmRecieve', numberOfColumns:4, titleText: '调整金额'},
			   {startColumnName: 'elmSettlement', numberOfColumns:4, titleText: '各平台商家结算金额'},
		    ]
		  });
		}
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
							<a title="导出数据" href="javascript:;" onclick="exportData();"> 
								<i class="back_icon import_icon"> </i> 
								<span>导出数据</span>
							</a>
						</li>
				</ul>
			</div>
			<!--功能按钮end-->
			<div class="listtable_box">
				<!--此处放表格-->
			<table  id="check"></table>
			<div  id="checkprowed"></div>		
			</div>
		</div>
	</div>
</body>
</html>
