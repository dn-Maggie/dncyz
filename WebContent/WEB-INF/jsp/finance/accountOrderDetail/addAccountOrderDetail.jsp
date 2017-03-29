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
		if(!biz.validate("valid",$('#accountOrderDetailFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/accountOrderDetail/addAccountOrderDetail.do'/>",
			type : "post",
				dataType:"json",
				success : function(d) {
					if(d.status){
						showMessage(d.message,"","",function(){
							window.parent.closeAdd();
				     		List.doSearch(window.parent.gridObj);
						});
					}else{
						showMessage(d.message);
					}
				}
		};
		// 将options传给ajaxForm
		$('#accountOrderDetailFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#accountOrderDetailFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="accountOrderDetailFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${accountOrderDetail.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">创建日期：</td>
				<td class="inputTd">
					<input id="edit_createDate" name="createDate" type="text" class="text" value="${accountOrderDetail.createDate}"/>
				</td>
				<td class="inputLabelTd">：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${accountOrderDetail.storeId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">账单编号：</td>
				<td class="inputTd">
					<input id="edit_checkNo" name="checkNo" type="text" class="text" value="${accountOrderDetail.checkNo}"/>
				</td>
				<td class="inputLabelTd">订单类型：</td>
				<td class="inputTd">
					<input id="edit_orderType" name="orderType" type="text" class="text" value="${accountOrderDetail.orderType}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单创建时间：</td>
				<td class="inputTd">
					<input id="edit_orderTime" name="orderTime" type="text" class="text" value="${accountOrderDetail.orderTime}"/>
				</td>
				<td class="inputLabelTd">订单完成时间：</td>
				<td class="inputTd">
					<input id="edit_overTime" name="overTime" type="text" class="text" value="${accountOrderDetail.overTime}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">接单序号：</td>
				<td class="inputTd">
					<input id="edit_orderIndex" name="orderIndex" type="text" class="text" value="${accountOrderDetail.orderIndex}"/>
				</td>
				<td class="inputLabelTd">订单号：</td>
				<td class="inputTd">
					<input id="edit_orderNo" name="orderNo" type="text" class="text" value="${accountOrderDetail.orderNo}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">菜价：</td>
				<td class="inputTd">
					<input id="edit_prices" name="prices" type="text" class="text" value="${accountOrderDetail.prices}"/>
				</td>
				<td class="inputLabelTd">餐盒费：</td>
				<td class="inputTd">
					<input id="edit_mealFee" name="mealFee" type="text" class="text" value="${accountOrderDetail.mealFee}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">赠品补贴：</td>
				<td class="inputTd">
					<input id="edit_giftAllowance" name="giftAllowance" type="text" class="text" value="${accountOrderDetail.giftAllowance}"/>
				</td>
				<td class="inputLabelTd">商户承担活动补贴：</td>
				<td class="inputTd">
					<input id="edit_activitiesSubsidies" name="activitiesSubsidies" type="text" class="text" value="${accountOrderDetail.activitiesSubsidies}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">商户承担代金券补贴：</td>
				<td class="inputTd">
					<input id="edit_subsidyVouchers" name="subsidyVouchers" type="text" class="text" value="${accountOrderDetail.subsidyVouchers}"/>
				</td>
				<td class="inputLabelTd">商户收取配送费：</td>
				<td class="inputTd">
					<input id="edit_merchantCharge" name="merchantCharge" type="text" class="text" value="${accountOrderDetail.merchantCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">服务费费率：</td>
				<td class="inputTd">
					<input id="edit_
serviceRate" name="
serviceRate" type="text" class="text" value="${accountOrderDetail.
serviceRate}"/>
				</td>
				<td class="inputLabelTd">服务费：</td>
				<td class="inputTd">
					<input id="edit_serviceCharge" name="serviceCharge" type="text" class="text" value="${accountOrderDetail.serviceCharge}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">用户申请退单金额：</td>
				<td class="inputTd">
					<input id="edit_refundAmount" name="refundAmount" type="text" class="text" value="${accountOrderDetail.refundAmount}"/>
				</td>
				<td class="inputLabelTd">结算金额：</td>
				<td class="inputTd">
					<input id="edit_settlementAmount" name="settlementAmount" type="text" class="text" value="${accountOrderDetail.settlementAmount}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">配送方式：</td>
				<td class="inputTd">
					<input id="edit_distributionMode" name="distributionMode" type="text" class="text" value="${accountOrderDetail.distributionMode}"/>
				</td>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">
					<input id="edit_remark" name="remark" type="text" class="text" value="${accountOrderDetail.remark}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">饿了么承担活动补贴：</td>
				<td class="inputTd">
					<input id="edit_elmActivitiesSubsidies" name="elmActivitiesSubsidies" type="text" class="text" value="${accountOrderDetail.elmActivitiesSubsidies}"/>
				</td>
				<td class="inputLabelTd">饿了么承担代金券补贴：</td>
				<td class="inputTd">
					<input id="edit_elmSubsidyVouchers" name="elmSubsidyVouchers" type="text" class="text" value="${accountOrderDetail.elmSubsidyVouchers}"/>
				</td>
			</tr>
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
