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
				<td class="inputLabelTd">品牌名称：</td>
				<td class="inputTd">${brand.brandName}</td>
				<td class="inputLabelTd">品牌负责人：</td>
				<td class="inputTd">${brand.brandManager}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">负责人电话：</td>
				<td class="inputTd">${brand.brandManagerTel}</td>
				<td class="inputLabelTd">门店数量：</td>
				<td class="inputTd">${brand.storesNumber}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">所在省份：</td>
				<td class="inputTd">${brand.provinceCode}</td>
				<td class="inputLabelTd">所在地市：</td>
				<td class="inputTd">${brand.regionCode}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">所在区县：</td>
				<td class="inputTd">${brand.cityCode}</td>
				<td class="inputLabelTd">行业ID：</td>
				<td class="inputTd">${brand.industryId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">品类ID：</td>
				<td class="inputTd">${brand.categoryId}</td>
				<td class="inputLabelTd">对接人：</td>
				<td class="inputTd">${brand.contactName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">负责人电话：</td>
				<td class="inputTd">${brand.contactTel}</td>
				<td class="inputLabelTd">招商人：</td>
				<td class="inputTd">${brand.merchantName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">招商人电话：</td>
				<td class="inputTd">${brand.merchantTel}</td>
				<td class="inputLabelTd">合同签订时间：</td>
				<td class="inputTd">${brand.signContractDate}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">创建时间：</td>
				<td class="inputTd">${brand.createDate}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button"  value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
