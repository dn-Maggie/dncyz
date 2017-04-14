<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
var Model = {
		url:"<m:url value='/store/listStore.do'/>",
	 	colModel:[
			{name : "storeId",hidden : true,key : true,label:"店铺ID",index : "STORE_ID"},				
			{name : "storeName",label:"店铺名称",index : "STORE_NAME"},				
			{name : "brandName",label:"所属品牌",index : "BRAND_ID"},				
			{name : "storeAddress",label:"店铺地址",index : "STORE_ADDRESS"},				
			{name : "workTimeBegin",label:"营业时间起",index : "WORK_TIME_BEGIN"},				
			{name : "workTimeEnd",label:"营业时间起",index : "WORK_TIME_END"},				
			{name : "storeOwnerName",label:"店长姓名",index : "STORE_OWNER_NAME"},				
			{name : "storeOwnerTel",label:"店长电话",index : "STORE_OWNER_TEL"},				
			{name : "proInvoiceFlag",label:"是否可以提供发票",index : "PRO_INVOICE_FLAG"
				,formatter:GridColModelForMatter.yesno},				
			{name : "remark",label:"备注",index : "REMARK"},				
			{name : "operateDate",label:"运营开始时间",index : "OPERATE_DATE"},				
			{name : "settlementMethod",label:"结算方式",index : "SETTLEMENT_METHOD"
				,formatter:GridColModelForMatter.settlementMethod},				
			{name : "storeTel",label:"店铺联系电话",index : "STORE_TEL"},				
          	],
		};
	$(function(){
		gridObj = List.createGrid(Model.url,Model.colModel,"STORE_NAME", false);
    });

	//新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
   	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
  	
  	function add(){
		var url="<m:url value='/store/toAddStore.do'/>";
		var title = "店铺增加";
		add_iframe_dialog = Add.create(url, title);
		List.openDialog(add_iframe_dialog);
  	}
  	function closeAdd(){
		List.closeDialog(add_iframe_dialog);
	}
  	
    function edit(){
		var key = ICSS.utils.getSelectRowData("storeId");
		var url = baseUrl+'/store/toEditStore.do';
		var title ="店铺编辑";
		edit_iframe_dialog = Edit.create(key, url, title);
		List.openDialog(edit_iframe_dialog);
    }
    function closeEdit(){
		List.closeDialog(edit_iframe_dialog);
	}
    function show(){
    	var key = ICSS.utils.getSelectRowData("storeId");
    	var url = baseUrl+'/store/toShowStore.do';
		var title = "店铺详情";
		show_iframe_dialog = Show.create(key, url, title);
		List.openDialog(show_iframe_dialog);
    }
    function closeShow(){
		List.closeDialog(show_iframe_dialog);
	}
    //删除
    function batchDelete(){
    	var id = ICSS.utils.getSelectRowData("storeId");
    	var url = baseUrl+'/store/deleteStore.do';
    	List.batchDelete(id, url);
    }
    
 	// 打开产品资源界面
    function linkStoreProduct(){
   		var key = ICSS.utils.getSelectRowData("storeId");
   		if (key.indexOf(",") > -1 || key == "") {
   			showMessage("请选择一条数据");
   			return;
   		}
   		var url = baseUrl + '/store/toListStoreProduct.do?key=' + key;
   		productList_iframe_dialog = new biz.dialog(
   				{
   					id : $('<div id="sublist_window_iframe"></div>')
   						.html(
   						'<iframe id="iframeSublist" name="iframeSublist" src="'
  						+ url
   						+ '" width="100%" frameborder="no" border="0" height="97%"></iframe>'),
   					modal : true,
   					width : $(window).width()*0.8,
   					height : $(window).height()*0.8,
   					title : "店铺产品管理"
   				});
   		productList_iframe_dialog.open();
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
						<c:if test="${isAdmin}"><option value = "">所有店铺</option></c:if>
						<c:forEach var="store" items="${store}">
							<option value="${store.storeName}"> <c:out value="${store.storeName}"></c:out> </option>
		             	</c:forEach>
					</select>
				</li>
				<li><input type="text" name="storeOwnerName" id="storeOwnerName" class="search_choose" placeholder="店长姓名">
				</li>
				<li>	<input type="text" name="storeAddress" id="storeAddress" class="search_choose" placeholder="店铺地址">
				</li>
				<li>
					<input type="reset" class="reset_btn" onclick="List.resetForm('queryForm')" value="重置">
					<input type="button" class="search_btn mr22 " onclick="List.doSearch(gridobj);" value="查询"></li>
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<li><a title="<m:message code="button.add"/>" href="javascript:;" onclick="add();"> <i class="icon_bg icon_add"> </i> <span><m:message
							code="button.add" /></span>
						</a></li>
						<li><a title="<m:message code="button.edit"/>" href="javascript:;" onclick="edit();"><i class="icon_bg icon_edit"></i> <span><m:message
							code="button.edit" /></span> </a></li>
						<li><a title="<m:message code="button.delete"/>" href="javascript:;" onclick="batchDelete();"> <i class="icon_bg icon_del"></i> <span><m:message
							code="button.delete" /></span>
						</a></li>
						<li><a title="店铺产品关联" href="javascript:;" onclick="linkStoreProduct();"> <i class="back_icon resources_icon"></i> 
							<span>店铺产品关联</span>
						</a></li>
						<li><a title="<m:message code="button.view"/>" href="javascript:" onclick="show();">
							<i class="icon_bg icon_ckxq"></i> <span><m:message code="button.view" /></span>
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
