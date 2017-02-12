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
		if(!biz.validate("valid",$('#orderFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/order/addOrder.do'/>",
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
		$('#orderFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#orderFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="orderFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_orderId" name="orderId" type="text" value="${order.orderId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">订单来源,来自数据字典：</td>
				<td class="inputTd">
					<input id="edit_orderSource" name="orderSource" type="text" class="text" value="${order.orderSource}"/>
				</td>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${order.storeId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单时间：</td>
				<td class="inputTd">
					<input id="edit_orderTime" name="orderTime" type="text" class="text" value="${order.orderTime}"/>
				</td>
				<td class="inputLabelTd">订单人：</td>
				<td class="inputTd">
					<input id="edit_orderPersonName" name="orderPersonName" type="text" class="text" value="${order.orderPersonName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单人电话：</td>
				<td class="inputTd">
					<input id="edit_orderPersonTel" name="orderPersonTel" type="text" class="text" value="${order.orderPersonTel}"/>
				</td>
				<td class="inputLabelTd">订单产品列表ID：</td>
				<td class="inputTd">
					<input id="edit_productListId" name="productListId" type="text" class="text" value="${order.productListId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">配送费：</td>
				<td class="inputTd">
					<input id="edit_deliveryCost" name="deliveryCost" type="text" class="text" value="${order.deliveryCost}"/>
				</td>
				<td class="inputLabelTd">餐盒费：</td>
				<td class="inputTd">
					<input id="edit_foodboxCost" name="foodboxCost" type="text" class="text" value="${order.foodboxCost}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">立减优惠：</td>
				<td class="inputTd">
					<input id="edit_privilege" name="privilege" type="text" class="text" value="${order.privilege}"/>
				</td>
				<td class="inputLabelTd">红包抵扣：</td>
				<td class="inputTd">
					<input id="edit_deduction" name="deduction" type="text" class="text" value="${order.deduction}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">订单状态：</td>
				<td class="inputTd">
					<input id="edit_orderStatus" name="orderStatus" type="text" class="text" value="${order.orderStatus}"/>
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
