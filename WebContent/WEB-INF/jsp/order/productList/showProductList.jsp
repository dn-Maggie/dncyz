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
				<td class="inputLabelTd">订单ID：</td>
				<td class="inputTd">${productList.orderId}</td>
				<td class="inputLabelTd">产品ID：</td>
				<td class="inputTd">${productList.productId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">数量：</td>
				<td class="inputTd">${productList.productCount}</td>
				<td class="inputLabelTd">单价：</td>
				<td class="inputTd">${productList.productUnitPrice}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">金额：</td>
				<td class="inputTd">${productList.productCost}</td>
				<td class="inputLabelTd">订单产品列表状态：</td>
				<td class="inputTd">${productList.productListStatus}</td>
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
