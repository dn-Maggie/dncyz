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
				<td class="inputLabelTd">日期：</td>
				<td class="inputTd">${accountOperateIncome.createDate}</td>
				<td class="inputLabelTd">订单时点：</td>
				<td class="inputTd">${accountOperateIncome.createTime}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单编号：</td>
				<td class="inputTd">${accountOperateIncome.orderNo}</td>
				<td class="inputLabelTd">原价：</td>
				<td class="inputTd">${accountOperateIncome.orginPrice}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">菜品折扣：</td>
				<td class="inputTd">${accountOperateIncome.discountPrice}</td>
				<td class="inputLabelTd">折扣后菜价格：</td>
				<td class="inputTd">${accountOperateIncome.afterDiscountPrice}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实际结算折扣菜金额：</td>
				<td class="inputTd">${accountOperateIncome.actualPrice}</td>
				<td class="inputLabelTd">订单上收取客户配送费：</td>
				<td class="inputTd">${accountOperateIncome.orderDistributionCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台收取客户配送费：</td>
				<td class="inputTd">${accountOperateIncome.platformDistributionCharge}</td>
				<td class="inputLabelTd">公司收取客户配送费：</td>
				<td class="inputTd">${accountOperateIncome.cyzDistributionCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">无效单：</td>
				<td class="inputTd">${accountOperateIncome.invalidNum}</td>
				<td class="inputLabelTd">有效单：</td>
				<td class="inputTd">${accountOperateIncome.validNum}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">产品销售金额：</td>
				<td class="inputTd">${accountOperateIncome.productSaleAmount}</td>
				<td class="inputLabelTd">应收平台结算金额：</td>
				<td class="inputTd">${accountOperateIncome.amountReceivable}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">70%结算金额：</td>
				<td class="inputTd">${accountOperateIncome.seventypProductSaleAmount}</td>
				<td class="inputLabelTd">折扣菜退还佣金：</td>
				<td class="inputTd">${accountOperateIncome.discountBackCommission}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">应付店铺结算金额：</td>
				<td class="inputTd">${accountOperateIncome.amountPayable}</td>
				<td class="inputLabelTd">公司收取店铺服务费：</td>
				<td class="inputTd">${accountOperateIncome.cyzServiceCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">公司承担线上活动费：</td>
				<td class="inputTd">${accountOperateIncome.cyzActivitiesCharge}</td>
				<td class="inputLabelTd">公司收入：</td>
				<td class="inputTd">${accountOperateIncome.cyzAllIncome}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">销售毛利：</td>
				<td class="inputTd">${accountOperateIncome.saleGrossProfit}</td>
				<td class="inputLabelTd">毛利率：</td>
				<td class="inputTd">${accountOperateIncome.saleGrossProfitRate}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">自配送实际支付金额：</td>
				<td class="inputTd">${accountOperateIncome.distributionActualPayment}</td>
				<td class="inputLabelTd">平台承担线上活动费：</td>
				<td class="inputTd">${accountOperateIncome.platformActivitiesCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台服务费：</td>
				<td class="inputTd">${accountOperateIncome.platformServiceCharge}</td>
				<td class="inputLabelTd">应收取自配送金额：</td>
				<td class="inputTd">${accountOperateIncome.shouldDistributionCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实际按10元/单自配送金额：</td>
				<td class="inputTd">${accountOperateIncome.cyzDistributionChargeActual}</td>
				<td class="inputLabelTd">按10元/单自配送金额补差：</td>
				<td class="inputTd">${accountOperateIncome.diffDistributionCharge}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台补贴：</td>
				<td class="inputTd">${accountOperateIncome.platformSubsidy}</td>
				<td class="inputLabelTd">平台类型：</td>
				<td class="inputTd">${accountOperateIncome.platformType}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">${accountOperateIncome.storeId}</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input class="ti_bottom"  type="button" id="close_button" value="关闭"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
