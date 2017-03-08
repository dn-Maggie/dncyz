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
				<td class="inputLabelTd">创建日期：</td>
				<td class="inputTd">${accountOrderDetail.createDate}</td>
				<td class="inputLabelTd">：</td>
				<td class="inputTd">${accountOrderDetail.storeId}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">账单编号：</td>
				<td class="inputTd">${accountOrderDetail.checkNo}</td>
				<td class="inputLabelTd">订单类型：</td>
				<td class="inputTd">${accountOrderDetail.orderType}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单创建时间：</td>
				<td class="inputTd">${accountOrderDetail.orderTime}</td>
				<td class="inputLabelTd">订单完成时间：</td>
				<td class="inputTd">${accountOrderDetail.overTime}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">接单序号：</td>
				<td class="inputTd">${accountOrderDetail.orderIndex}</td>
				<td class="inputLabelTd">订单号：</td>
				<td class="inputTd">${accountOrderDetail.orderNo}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">菜价：</td>
				<td class="inputTd">${accountOrderDetail.prices}</td>
				<td class="inputLabelTd">餐盒费：</td>
				<td class="inputTd">${accountOrderDetail.mealFee}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">赠品补贴：</td>
				<td class="inputTd">${accountOrderDetail.giftAllowance}</td>
				<td class="inputLabelTd">商户承担活动补贴：</td>
				<td class="inputTd">${accountOrderDetail.activitiesSubsidies}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">商户承担代金券补贴：</td>
				<td class="inputTd">${accountOrderDetail.subsidyVouchers}</td>
				<td class="inputLabelTd">商户收取配送费：</td>
				<td class="inputTd">${accountOrderDetail.merchantCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">服务费费率：</td>
				<td class="inputTd">${accountOrderDetail.
serviceRate}</td>
				<td class="inputLabelTd">服务费：</td>
				<td class="inputTd">${accountOrderDetail.serviceCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">用户申请退单金额：</td>
				<td class="inputTd">${accountOrderDetail.refundAmount}</td>
				<td class="inputLabelTd">结算金额：</td>
				<td class="inputTd">${accountOrderDetail.settlementAmount}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">配送方式：</td>
				<td class="inputTd">${accountOrderDetail.distributionMode}</td>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">${accountOrderDetail.remark}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">饿了么承担活动补贴：</td>
				<td class="inputTd">${accountOrderDetail.elmActivitiesSubsidies}</td>
				<td class="inputLabelTd">饿了么承担代金券补贴：</td>
				<td class="inputTd">${accountOrderDetail.elmSubsidyVouchers}</td>
			</tr>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button" value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
