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
				<td class="inputLabelTd">关联ID（主键）：</td>
				<td class="inputTd">${storePlatformRel.relId}</td>
				<td class="inputLabelTd">店铺ID(主键)：</td>
				<td class="inputTd">${storePlatformRel.storeId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺名称：</td>
				<td class="inputTd">${storePlatformRel.storeName}</td>
				<td class="inputLabelTd">平台编码（BD：百度外卖，MT：美团外卖，ELM：饿了么外卖）：</td>
				<td class="inputTd">${storePlatformRel.platformCode}</td>
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
