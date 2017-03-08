<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<script type="text/javascript">
$(function() {
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});
		showMessage("正在处理...");
		if(!biz.validate("valid",$('#accountOperateIncomeFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/accountOperateIncome/addAccountOperateIncome.do'/>",
			type : "post",
				dataType:"json",
				success : function(d) {
					if(d.status){
						showMessage(d.message,"","",function(){
							window.parent.closeAdd();
				     		window.parent.doSearch();
						});
					}else{
						showMessage(d.message);
					}
				}
		};
		// 将options传给ajaxForm
		$('#accountOperateIncomeFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#accountOperateIncomeFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="accountOperateIncomeFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${accountOperateIncome.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">日期：</td>
				<td class="inputTd">
					<input id="edit_createDate" name="createDate" type="text" class="text" value="${accountOperateIncome.createDate}"/>
				</td>
				<td class="inputLabelTd">订单时点：</td>
				<td class="inputTd">
					<input id="edit_createTime" name="createTime" type="text" class="text" value="${accountOperateIncome.createTime}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单编号：</td>
				<td class="inputTd">
					<input id="edit_orderNo" name="orderNo" type="text" class="text" value="${accountOperateIncome.orderNo}"/>
				</td>
				<td class="inputLabelTd">原价：</td>
				<td class="inputTd">
					<input id="edit_orginPrice" name="orginPrice" type="text" class="text" value="${accountOperateIncome.orginPrice}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">菜品折扣：</td>
				<td class="inputTd">
					<input id="edit_discountPrice" name="discountPrice" type="text" class="text" value="${accountOperateIncome.discountPrice}"/>
				</td>
				<td class="inputLabelTd">折扣后菜价格：</td>
				<td class="inputTd">
					<input id="edit_afterDiscountPrice" name="afterDiscountPrice" type="text" class="text" value="${accountOperateIncome.afterDiscountPrice}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实际结算折扣菜金额：</td>
				<td class="inputTd">
					<input id="edit_actualPrice" name="actualPrice" type="text" class="text" value="${accountOperateIncome.actualPrice}"/>
				</td>
				<td class="inputLabelTd">订单上收取客户配送费：</td>
				<td class="inputTd">
					<input id="edit_orderDistributionCharge" name="orderDistributionCharge" type="text" class="text" value="${accountOperateIncome.orderDistributionCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台收取客户配送费：</td>
				<td class="inputTd">
					<input id="edit_platformDistributionCharge" name="platformDistributionCharge" type="text" class="text" value="${accountOperateIncome.platformDistributionCharge}"/>
				</td>
				<td class="inputLabelTd">公司收取客户配送费：</td>
				<td class="inputTd">
					<input id="edit_cyzDistributionCharge" name="cyzDistributionCharge" type="text" class="text" value="${accountOperateIncome.cyzDistributionCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">无效单：</td>
				<td class="inputTd">
					<input id="edit_invalidNum" name="invalidNum" type="text" class="text" value="${accountOperateIncome.invalidNum}"/>
				</td>
				<td class="inputLabelTd">有效单：</td>
				<td class="inputTd">
					<input id="edit_validNum" name="validNum" type="text" class="text" value="${accountOperateIncome.validNum}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">产品销售金额：</td>
				<td class="inputTd">
					<input id="edit_productSaleAmount" name="productSaleAmount" type="text" class="text" value="${accountOperateIncome.productSaleAmount}"/>
				</td>
				<td class="inputLabelTd">应收平台结算金额：</td>
				<td class="inputTd">
					<input id="edit_amountReceivable" name="amountReceivable" type="text" class="text" value="${accountOperateIncome.amountReceivable}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">70%结算金额：</td>
				<td class="inputTd">
					<input id="edit_seventypProductSaleAmount" name="seventypProductSaleAmount" type="text" class="text" value="${accountOperateIncome.seventypProductSaleAmount}"/>
				</td>
				<td class="inputLabelTd">折扣菜退还佣金：</td>
				<td class="inputTd">
					<input id="edit_discountBackCommission" name="discountBackCommission" type="text" class="text" value="${accountOperateIncome.discountBackCommission}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">应付店铺结算金额：</td>
				<td class="inputTd">
					<input id="edit_amountPayable" name="amountPayable" type="text" class="text" value="${accountOperateIncome.amountPayable}"/>
				</td>
				<td class="inputLabelTd">公司收取店铺服务费：</td>
				<td class="inputTd">
					<input id="edit_cyzServiceCharge" name="cyzServiceCharge" type="text" class="text" value="${accountOperateIncome.cyzServiceCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">公司承担线上活动费：</td>
				<td class="inputTd">
					<input id="edit_cyzActivitiesCharge" name="cyzActivitiesCharge" type="text" class="text" value="${accountOperateIncome.cyzActivitiesCharge}"/>
				</td>
				<td class="inputLabelTd">公司收入：</td>
				<td class="inputTd">
					<input id="edit_cyzAllIncome" name="cyzAllIncome" type="text" class="text" value="${accountOperateIncome.cyzAllIncome}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">销售毛利：</td>
				<td class="inputTd">
					<input id="edit_saleGrossProfit" name="saleGrossProfit" type="text" class="text" value="${accountOperateIncome.saleGrossProfit}"/>
				</td>
				<td class="inputLabelTd">毛利率：</td>
				<td class="inputTd">
					<input id="edit_saleGrossProfitRate" name="saleGrossProfitRate" type="text" class="text" value="${accountOperateIncome.saleGrossProfitRate}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">自配送实际支付金额：</td>
				<td class="inputTd">
					<input id="edit_distributionActualPayment" name="distributionActualPayment" type="text" class="text" value="${accountOperateIncome.distributionActualPayment}"/>
				</td>
				<td class="inputLabelTd">平台承担线上活动费：</td>
				<td class="inputTd">
					<input id="edit_platformActivitiesCharge" name="platformActivitiesCharge" type="text" class="text" value="${accountOperateIncome.platformActivitiesCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台服务费：</td>
				<td class="inputTd">
					<input id="edit_platformServiceCharge" name="platformServiceCharge" type="text" class="text" value="${accountOperateIncome.platformServiceCharge}"/>
				</td>
				<td class="inputLabelTd">应收取自配送金额：</td>
				<td class="inputTd">
					<input id="edit_shouldDistributionCharge" name="shouldDistributionCharge" type="text" class="text" value="${accountOperateIncome.shouldDistributionCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实际按10元/单自配送金额：</td>
				<td class="inputTd">
					<input id="edit_cyzDistributionChargeActual" name="cyzDistributionChargeActual" type="text" class="text" value="${accountOperateIncome.cyzDistributionChargeActual}"/>
				</td>
				<td class="inputLabelTd">按10元/单自配送金额补差：</td>
				<td class="inputTd">
					<input id="edit_diffDistributionCharge" name="diffDistributionCharge" type="text" class="text" value="${accountOperateIncome.diffDistributionCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台补贴：</td>
				<td class="inputTd">
					<input id="edit_platformSubsidy" name="platformSubsidy" type="text" class="text" value="${accountOperateIncome.platformSubsidy}"/>
				</td>
				<td class="inputLabelTd">平台类型：</td>
				<td class="inputTd">
					<input id="edit_platformType" name="platformType" type="text" class="text" value="${accountOperateIncome.platformType}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${accountOperateIncome.storeId}"/>
				</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input id="submit" type="button" class="ti_bottom" value="保存"/>
				</td>
			</tr>
		</table>
    </div>
	</form>
</body>
</html>
