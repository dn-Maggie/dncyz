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
				<td class="inputLabelTd">订单来源,来自数据字典：</td>
				<td class="inputTd">${order.orderSource}</td>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">${order.storeId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单时间：</td>
				<td class="inputTd">${order.orderTime}</td>
				<td class="inputLabelTd">订单人：</td>
				<td class="inputTd">${order.orderPersonName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单人电话：</td>
				<td class="inputTd">${order.orderPersonTel}</td>
				<td class="inputLabelTd">订单产品列表ID：</td>
				<td class="inputTd">${order.productListId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">配送费：</td>
				<td class="inputTd">${order.deliveryCost}</td>
				<td class="inputLabelTd">餐盒费：</td>
				<td class="inputTd">${order.foodboxCost}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">立减优惠：</td>
				<td class="inputTd">${order.privilege}</td>
				<td class="inputLabelTd">红包抵扣：</td>
				<td class="inputTd">${order.deduction}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单状态：</td>
				<td class="inputTd">${order.orderStatus}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
