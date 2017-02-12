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
		if(!biz.validate("valid",$('#productFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/product/addProduct.do'/>",
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
		$('#productFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#productFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="productFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_productClassId" name="productClassId" type="text" value="${product.productClassId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">产品ID(主键)：</td>
				<td class="inputTd">
					<input id="edit_productId" name="productId" type="text" class="text" value="${product.productId}"/>
				</td>
				<td class="inputLabelTd">产品名称：</td>
				<td class="inputTd">
					<input id="edit_productName" name="productName" type="text" class="text" value="${product.productName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">产品图片地址：</td>
				<td class="inputTd">
					<input id="edit_productImagePath" name="productImagePath" type="text" class="text" value="${product.productImagePath}"/>
				</td>
				<td class="inputLabelTd">产品单价：</td>
				<td class="inputTd">
					<input id="edit_productUnitPrice" name="productUnitPrice" type="text" class="text" value="${product.productUnitPrice}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">库存数量：</td>
				<td class="inputTd">
					<input id="edit_productStocks" name="productStocks" type="text" class="text" value="${product.productStocks}"/>
				</td>
				<td class="inputLabelTd">产品状态：</td>
				<td class="inputTd">
					<input id="edit_productStatus" name="productStatus" type="text" class="text" value="${product.productStatus}"/>
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
