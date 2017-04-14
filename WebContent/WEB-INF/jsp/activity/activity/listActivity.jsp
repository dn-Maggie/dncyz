<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
var Model = {
		url:"<m:url value='/activity/listActivity.do'/>",
		colModel:[
					{name : "activityId",hidden : true,key : true,label:"活动ID(主键)",index : "ACTIVITY_ID"},				
					{name : "activityName",label:"活动名称",index : "ACTIVITY_NAME"},				
					{name : "activityType",label:"活动类型",index : "ACTIVITY_TYPE"
						,formatter:GridColModelForMatter.activityType},				
					{name : "activityDesc",label:"活动描述",index : "ACTIVITY_DESC"},				
					{name : "activityExpectedProfit",label:"活动预计价值",index : "ACTIVITY_EXPECTED_PROFIT"}				
	           	]
}
	$(function(){
		gridObj = List.createGrid(Model.url,Model.colModel,"ACTIVITY_ID", false);
    });
	function show(){
		var key = ICSS.utils.getSelectRowData('activityId');
		var url = baseUrl+'/activity/toShowActivity.do';
		var title = "活动详情";
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
			 <div class="search border-bottom">
				<ul>
				<li>
				<span>关键字:</span>
					<input type="text" name="platformType" id="platformType" class="search_choose" placeholder="平台名称">
				</li>
				<li>
					<input type="text" name="activityName" id="activityName" class="search_choose" placeholder="活动名称">
				</li>
				<li>
					<input type="text" name="activityCategory" id="activityCategory" class="search_choose" placeholder="活动类型">
				</li>
				<li>
					<input type="reset" class="reset_btn" onclick="List.resetForm('queryForm')" value="重置">
				<input type="button" class="search_btn mr22 " onclick="List.doSearch(gridObj);" value="查询"></li>
			</ul>
		   </div>
	    </form>
		<div class="listplace">
				<div class="list_btn_bg fl">
					<ul>
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
