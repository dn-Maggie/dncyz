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
				<td class="inputLabelTd">店铺名称：</td>
				<td class="inputTd">${store.storeName}</td>
				<td class="inputLabelTd">所属品牌ID：</td>
				<td class="inputTd">${store.brandId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺地址：</td>
				<td class="inputTd">${store.storeAddress}</td>
				<td class="inputLabelTd">营业时间起：</td>
				<td class="inputTd">${store.workTimeBegin}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">营业时间起：</td>
				<td class="inputTd">${store.workTimeEnd}</td>
				<td class="inputLabelTd">店长姓名：</td>
				<td class="inputTd">${store.storeOwnerName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店长电话：</td>
				<td class="inputTd">${store.storeOwnerTel}</td>
				<td class="inputLabelTd">是否可以提供发票：</td>
				<td class="inputTd">${store.proInvoiceFlag}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">${store.remark}</td>
				<td class="inputLabelTd">运营开始时间：</td>
				<td class="inputTd">${store.operateDate}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">结算方式：</td>
				<td class="inputTd">${store.settlementMethod}</td>
				<td class="inputLabelTd">店铺联系电话：</td>
				<td class="inputTd">${store.storeTel}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片1：</td>
				<td class="inputTd">${store.realImagePath1}</td>
				<td class="inputLabelTd">实景图片2：</td>
				<td class="inputTd">${store.realImagePath2}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片3：</td>
				<td class="inputTd">${store.realImagePath3}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
