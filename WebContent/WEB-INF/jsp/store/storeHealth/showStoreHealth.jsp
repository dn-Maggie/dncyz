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
				<td class="inputTd">${storeHealth.storeId}</td>
				<td class="inputLabelTd">评估时间：</td>
				<td class="inputTd">${storeHealth.assessDate}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">评估人：</td>
				<td class="inputTd">${storeHealth.assessors}</td>
				<td class="inputLabelTd">健康值：</td>
				<td class="inputTd">${storeHealth.healthValue}</td>
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
