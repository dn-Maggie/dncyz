<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
 <script type="text/javascript">
$(function() {
	//绑定提交按钮click事件
	$("#submit").click(function() {
		if(!biz.validate("valid",$('#storeProductFormEdit')[0])){
			showWarn("数据验证失败",3000);
			return;
		}
		var options = {
			url : "<m:url value='/storeProduct/updateStoreProduct.do'/>",
			type : "post",
				dataType:"json",
				success : function(d) {
					if(d.status){
						showMessage(d.message,"","",function(){
							window.parent.closeEdit();
				     		window.parent.doSearch();
						});
					}else{
						showMessage(d.message);
					}
				}
		};
		// 将options传给ajaxForm
		$('#storeProductFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storeProductFormEdit",
		rules:{
		}
	}); 
});

</script>
</head>
  
<body>
	<form id="storeProductFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${storeProduct.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${storeProduct.storeId}"/>
				</td>
				<td class="inputLabelTd">产品分类ID：</td>
				<td class="inputTd">
					<input id="edit_productClassId" name="productClassId" type="text" class="text" value="${storeProduct.productClassId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">产品类名：</td>
				<td class="inputTd">
					<input id="edit_productClassName" name="productClassName" type="text" class="text" value="${storeProduct.productClassName}"/>
				</td>
				<td class="inputLabelTd">产品ID：</td>
				<td class="inputTd">
					<input id="edit_productId" name="productId" type="text" class="text" value="${storeProduct.productId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">产品名称：</td>
				<td class="inputTd">
					<input id="edit_productName" name="productName" type="text" class="text" value="${storeProduct.productName}"/>
				</td>
				<td class="inputLabelTd">产品图片地址：</td>
				<td class="inputTd">
					<input id="edit_productImagePath" name="productImagePath" type="text" class="text" value="${storeProduct.productImagePath}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">产品单价：</td>
				<td class="inputTd">
					<input id="edit_productUnitPrice" name="productUnitPrice" type="text" class="text" value="${storeProduct.productUnitPrice}"/>
				</td>
				<td class="inputLabelTd">库存数量：</td>
				<td class="inputTd">
					<input id="edit_productStocks" name="productStocks" type="text" class="text" value="${storeProduct.productStocks}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">产品状态：</td>
				<td class="inputTd">
					<input id="edit_productStatus" name="productStatus" type="text" class="text" value="${storeProduct.productStatus}"/>
				</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input id="submit" type="button" class="ti_bottom" value="<m:message code='button.save' />"/>
				</td>
			</tr>
		</table>
        </div>
	</form>
</body>
</html>
