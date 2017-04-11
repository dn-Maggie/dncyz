<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
var Model = {
	url: "<m:url value='/operaDate/listSpecialFood.do'/>",
	colModel:[
		{name : "id",hidden : true,key : true,label:"主键",index : "id"},		
		/* {name : "storeId",label:"店铺ID",index : "store_id"},		
		{name : "storeName",label:"店铺名称",index : "store_name"},		 */
		{name : "specialOfferFoodName",label:"特价菜品",index : "special_offer_food_name"},		
		{name : "createDate",label:"日期",index : "create_date"},		
		{name : "saleNum",label:"销量",index : "sale_num"},		
		{name : "orginPrice",label:"原单价",index : "orgin_price"},		
		{name : "settlementPrice",label:"结算单价",index : "settlement_price"},	
		{name : "specialOfferOrginPrice",label:"特价菜原价",index : "special_offer_orgin_price"},		
		{name : "specialOfferSettlement",label:"特价菜结算",index : "special_offer_settlement"},	
		{name : "platformType",label:"平台类型",index : "platform_type"}      
		],
	};
	$(function(){
  		gridObj = List.createGrid(Model.url,Model.colModel,"id", false);
    });
    //新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
   	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
  	
  	function add(){
		var url= baseUrl+'/accountSpecialFood/toAddAccountSpecialFood.do';
		var title = "特价菜结算增加";
		add_iframe_dialog = Add.create(url, title);
		List.openDialog(add_iframe_dialog);
  	}
  	
  	//关闭新增页面，供子页面调用
  	function closeAdd(){
		List.closeDialog(add_iframe_dialog);
  	}
  	
    function edit(){
		var key = ICSS.utils.getSelectRowData("id");
		var url=baseUrl+'/accountSpecialFood/toEditAccountSpecialFood.do';
		var title = "特价菜结算编辑";
		edit_iframe_dialog = Edit.create(key, url, title);
  		List.openDialog(edit_iframe_dialog);
    }
    
    //关闭编辑页面，供子页面调用
    function closeEdit(){
    	List.closeDialog(edit_iframe_dialog);
    }
    
    function show(){
    	var key = ICSS.utils.getSelectRowData("id");
		var url= baseUrl+'/accountSpecialFood/toShowAccountSpecialFood.do';
		var title = "特价菜结算详情";
		show_iframe_dialog = Show.create(key, url, title);
		List.openDialog(show_iframe_dialog);
    }
    
    //关闭查看页面，供子页面调用
    function closeShow(){
    	List.closeDialog(show_iframe_dialog);
    }
    //删除
    function batchDelete(){
    	var id = ICSS.utils.getSelectRowData("id");
    	var url = baseUrl+'/accountSpecialFood/deleteAccountSpecialFood.do';
    	List.batchDelete(id, url);
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
