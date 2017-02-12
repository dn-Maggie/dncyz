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
				<td class="inputLabelTd">平台类别：</td>
				<td class="inputTd">${platformStore.platformType}</td>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">${platformStore.storeId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台店铺序号：</td>
				<td class="inputTd">${platformStore.platformStoreIndex}</td>
				<td class="inputLabelTd">平台名称：</td>
				<td class="inputTd">${platformStore.platformStoreName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台账号：</td>
				<td class="inputTd">${platformStore.platformStoreUsername}</td>
				<td class="inputLabelTd">平台密码，MD5加密：</td>
				<td class="inputTd">${platformStore.platformStorePassword}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">评分：</td>
				<td class="inputTd">${platformStore.platformStoreScore}</td>
				<td class="inputLabelTd">市场经理：</td>
				<td class="inputTd">${platformStore.marketingManager}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">市场经理电话：</td>
				<td class="inputTd">${platformStore.marketingManagerTel}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
