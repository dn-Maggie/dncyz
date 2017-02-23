<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<td class="inputLabelTd">结算日期：</td>
				<td class="inputTd">${accountCheck.accountTime}</td>
				<td class="inputLabelTd">饿了吗结算款：</td>
				<td class="inputTd">${accountCheck.elmSettlement}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">百度结算款：</td>
				<td class="inputTd">${accountCheck.baiduSettlement}</td>
				<td class="inputLabelTd">美团结算款：</td>
				<td class="inputTd">${accountCheck.meituanSettlement}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">合计结算金额：</td>
				<td class="inputTd">${accountCheck.totalSettlement}</td>
				<td class="inputLabelTd">饿了么扣回金额：</td>
				<td class="inputTd">${accountCheck.elmCost}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">百度扣回金额：</td>
				<td class="inputTd">${accountCheck.baiduCost}</td>
				<td class="inputLabelTd">美团扣回金额：</td>
				<td class="inputTd">${accountCheck.meituanCost}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实际应结算金额：</td>
				<td class="inputTd">${accountCheck.actualSettlement}</td>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">${accountCheck.remark}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">${accountCheck.storeId}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
