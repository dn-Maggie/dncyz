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
		if(!biz.validate("valid",$('#productListFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/productList/addProductList.do'/>",
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
		$('#productListFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#productListFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="productListFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_productListId" name="productListId" type="text" value="${productList.productListId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">订单ID：</td>
				<td class="inputTd">
					<input id="edit_orderId" name="orderId" type="text" class="text" value="${productList.orderId}"/>
				</td>
				<td class="inputLabelTd">产品ID：</td>
				<td class="inputTd">
					<input id="edit_productId" name="productId" type="text" class="text" value="${productList.productId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">数量：</td>
				<td class="inputTd">
					<input id="edit_productCount" name="productCount" type="text" class="text" value="${productList.productCount}"/>
				</td>
				<td class="inputLabelTd">单价：</td>
				<td class="inputTd">
					<input id="edit_productUnitPrice" name="productUnitPrice" type="text" class="text" value="${productList.productUnitPrice}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">金额：</td>
				<td class="inputTd">
					<input id="edit_productCost" name="productCost" type="text" class="text" value="${productList.productCost}"/>
				</td>
				<td class="inputLabelTd">订单产品列表状态：</td>
				<td class="inputTd">
					<input id="edit_productListStatus" name="productListStatus" type="text" class="text" value="${productList.productListStatus}"/>
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
