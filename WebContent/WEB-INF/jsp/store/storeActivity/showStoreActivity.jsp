<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<base href="<%=basePath%>">

<%@ include file="../../common/header.jsp"%>
<script type="text/javascript">
	$(function() {
		//绑定提交按钮click事件
		$("#close_button").click(function() {
			window.parent.closeShow();
		});
	});
</script>
</head>
  
<body>
	<div class="ui-table ui-widget ui-corner-all ui-border">
		<table class="table forview">
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">${storeActivity.storeId}</td>
				<td class="inputLabelTd">活动ID：</td>
				<td class="inputTd">${storeActivity.activityId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动起始时间：</td>
				<td class="inputTd">${storeActivity.activityTimeBegin}</td>
				<td class="inputLabelTd">活动结束时间：</td>
				<td class="inputTd">${storeActivity.activityTimeEnd}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动预算费用：</td>
				<td class="inputTd">${storeActivity.activityExpectedBudget}</td>
				<td class="inputLabelTd">活动预计回报：</td>
				<td class="inputTd">${storeActivity.activityExpectedReturn}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动状态：</td>
				<td class="inputTd">${storeActivity.activityStatus}</td>
				<td class="inputLabelTd">活动实际价值：</td>
				<td class="inputTd">${storeActivity.activityActualProfit}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动执行人：</td>
				<td class="inputTd">${storeActivity.activityExecutor}</td>
				<td class="inputLabelTd">活动执行时间：</td>
				<td class="inputTd">${storeActivity.activityExecuteTime}</td>
			</tr>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
