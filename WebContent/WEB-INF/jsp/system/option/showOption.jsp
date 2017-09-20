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
				<td class="inputLabelTd">功能编码（GET_ORDER：获取订单，CONFIRM_ORDER:确认订单，CANCEL_ORDER：取消订单）：</td>
				<td class="inputTd">${option.opCode}</td>
				<td class="inputLabelTd">操作名称：</td>
				<td class="inputTd">${option.opName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台描述：</td>
				<td class="inputTd">${option.remark}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
