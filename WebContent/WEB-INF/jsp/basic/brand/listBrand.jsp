<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<title></title>
<style type="text/css">
	#breadcrumbs{
		display:none;
	}
</style>
<script type="text/javascript">
var gridObj = {};
var Model = {
		url: "<m:url value='/brand/listBrand.do'/>",
		colModel:[
					{name : "brandId",hidden : true,key : true,label:"品牌ID(主键)",index : "BRAND_ID"},				
					{name : "brandName",label:"品牌名称",index : "BRAND_NAME"},				
					{name : "brandManager",label:"品牌负责人",index : "BRAND_MANAGER"},				
					{name : "brandManagerTel",label:"负责人电话",index : "BRAND_MANAGER_TEL"},				
					{name : "industryName",label:"所属行业",index : "INDUSTRY_ID"},				
					{name : "categoryName",label:"所属品类",index : "CATEGORY_ID"},				
					{name : "contactName",label:"对接人",index : "CONTACT_NAME"},				
					{name : "contactTel",label:"对接人电话",index : "CONTACT_TEL"},				
					{name : "merchantName",label:"招商人",index : "MERCHANT_NAME"},				
					{name : "merchantTel",label:"招商人电话",index : "MERCHANT_TEL"},				
					{name : "signContractDate",label:"合同签订时间",index : "SIGN_CONTRACT_DATE"},				
					{name : "createDate",label:"创建时间",index : "CREATE_DATE"}				
	           	]
		};
	$(function(){
  		gridObj = List.createGrid(Model.url,Model.colModel,"BRAND_ID", false);
    });
	  //新增的弹出框  
	var add_iframe_dialog;
	//修改的弹出框
	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
	function add(){
		var url = baseUrl+'/brand/toAddBrand.do';
		var title = "餐饮品牌增加";
		add_iframe_dialog = Add.create(url, title);
		List.openDialog(add_iframe_dialog);
	}
	function closeAdd(){
		List.closeDialog(add_iframe_dialog);
	}
	function edit(){
		var key = ICSS.utils.getSelectRowData('brandId');
		var url = baseUrl+'/brand/toEditBrand.do';
		var title = "餐饮品牌编辑";
		edit_iframe_dialog = Edit.create(key, url, title);
		List.openDialog(edit_iframe_dialog);
	}
	function closeEdit(){
		List.closeDialog(edit_iframe_dialog);
	}
	function batchDelete(){
		var id = ICSS.utils.getSelectRowData('brandId');
		var url = baseUrl+'/brand/deleteBrand.do';
		List.batchDelete(id, url);
	}
	function show(){
		var key = ICSS.utils.getSelectRowData('brandId');
		var url = baseUrl+'/brand/toShowBrand.do';
		var title = "餐饮品牌详细";
		show_iframe_dialog = Show.create(key, url, title);
		List.openDialog(show_iframe_dialog);
	}
	function closeShow(){
		List.closeDialog(show_iframe_dialog);
	}
    </script>
</head>
<body style="height:100%;">

	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<c:if test="${add}">
							<li><a title="<m:message code="button.add"/>" href="javascript:;"
								onclick="add()"> <i class="icon_bg icon_add"> </i> <span><m:message
											code="button.add" /></span>
							</a></li>
						</c:if>
						<c:if test="${edit}">
							<li><a title="<m:message code="button.edit"/>" href="javascript:;"
								onclick="edit()"><i class="icon_bg icon_edit"></i> <span>
								<m:message code="button.edit" /></span> </a></li>
						</c:if>
						<c:if test="${delete}">
							<li><a title="<m:message code="button.delete"/>" href="javascript:;" 
							onclick="batchDelete();"> <i class="icon_bg icon_del"></i> <span><m:message
											code="button.delete" /></span>
							</a></li>
						</c:if>
						<li><a title="<m:message code="button.view"/>" href="javascript:"
							onclick="show()"> <i class="icon_bg icon_ckxq"></i> <span><m:message
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
