<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
var Model = {
		url:"<m:url value='/category/listCategory.do'/>",
		colModel:[
					{name : "categoryId",hidden : true,key : true,label:"品类ID(主键)",index : "CATEGORY_ID"},				
					{name : "categoryName",label:"品类名称",index : "CATEGORY_NAME"}				
	           	]
		};
	$(function(){
  		gridObj = List.createGrid(Model.url,Model.colModel,"CATEGORY_ID", false);
    });
    //新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
   	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
	
  	function add(){
  		var url = baseUrl+'/category/toAddCategory.do';
		var title = "品类增加";
		add_iframe_dialog = Add.create(url, title);
		List.openDialog(add_iframe_dialog);
  	}
  	function closeAdd(){
		List.closeDialog(add_iframe_dialog);
	}
    function edit(){
    	var key = ICSS.utils.getSelectRowData("categoryId");
		var url = baseUrl+'/category/toEditCategory.do';
		var title = "品类编辑";
		edit_iframe_dialog = Edit.create(key, url, title);
		List.openDialog(edit_iframe_dialog);
    }
    function closeEdit(){
		List.closeDialog(edit_iframe_dialog);
	}
    function show(){
    	var key = ICSS.utils.getSelectRowData("categoryId");
		var url = baseUrl+'/category/toShowCategory.do';
		var title = "品类详情";
		show_iframe_dialog = Show.create(key, url, title);
		List.openDialog(show_iframe_dialog);
    }
    function closeShow(){
		List.closeDialog(show_iframe_dialog);
	}
    function batchDelete(){
    	var id = ICSS.utils.getSelectRowData("categoryId");
		var url = baseUrl+'/category/deleteCategory.do';
		List.batchDelete(id, url);
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
