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
				<td class="inputLabelTd">平台ID：</td>
				<td class="inputTd">${storeFlux.platformId}</td>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">${storeFlux.storeId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">曝光量：</td>
				<td class="inputTd">${storeFlux.storeExposure}</td>
				<td class="inputLabelTd">进店人数：</td>
				<td class="inputTd">${storeFlux.storeVisitorNum}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">下单数：</td>
				<td class="inputTd">${storeFlux.storeOrderNum}</td>
				<td class="inputLabelTd">品类入口餐厅列表流量：</td>
				<td class="inputTd">${storeFlux.fluxInCategory}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">首页餐厅列表流量：</td>
				<td class="inputTd">${storeFlux.fluxInHomepage}</td>
				<td class="inputLabelTd">订单详情页流量：</td>
				<td class="inputTd">${storeFlux.fluxInDetaile}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动页流量：</td>
				<td class="inputTd">${storeFlux.fluxInActivity}</td>
				<td class="inputLabelTd">收藏餐厅流量：</td>
				<td class="inputTd">${storeFlux.fluxInCollect}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">搜索流量：</td>
				<td class="inputTd">${storeFlux.fluxInSearch}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
