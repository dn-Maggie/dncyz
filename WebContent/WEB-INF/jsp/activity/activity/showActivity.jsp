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
				<td class="inputLabelTd">活动名称：</td>
				<td class="inputTd">${activity.activityName}</td>
				<td class="inputLabelTd">活动类型：</td>
				<td class="inputTd">${activity.activityType}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动描述：</td>
				<td class="inputTd">${activity.activityDesc}</td>
				<td class="inputLabelTd">活动预计价值：</td>
				<td class="inputTd">${activity.activityExpectedProfit}</td>
			</tr>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button" value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
