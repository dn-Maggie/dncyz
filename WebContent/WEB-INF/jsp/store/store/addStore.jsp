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
		if(!biz.validate("valid",$('#storeFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/store/addStore.do'/>",
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
		$('#storeFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storeFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="storeFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_storeId" name="storeId" type="text" value="${store.storeId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">店铺名称：</td>
				<td class="inputTd">
					<input id="edit_storeName" name="storeName" type="text" class="text" value="${store.storeName}"/>
				</td>
				<td class="inputLabelTd">所属品牌ID：</td>
				<td class="inputTd">
					<input id="edit_brandId" name="brandId" type="text" class="text" value="${store.brandId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺地址：</td>
				<td class="inputTd">
					<input id="edit_storeAddress" name="storeAddress" type="text" class="text" value="${store.storeAddress}"/>
				</td>
				<td class="inputLabelTd">营业时间起：</td>
				<td class="inputTd">
					<input id="edit_workTimeBegin" name="workTimeBegin" type="text" class="text" value="${store.workTimeBegin}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">营业时间起：</td>
				<td class="inputTd">
					<input id="edit_workTimeEnd" name="workTimeEnd" type="text" class="text" value="${store.workTimeEnd}"/>
				</td>
				<td class="inputLabelTd">店长姓名：</td>
				<td class="inputTd">
					<input id="edit_storeOwnerName" name="storeOwnerName" type="text" class="text" value="${store.storeOwnerName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店长电话：</td>
				<td class="inputTd">
					<input id="edit_storeOwnerTel" name="storeOwnerTel" type="text" class="text" value="${store.storeOwnerTel}"/>
				</td>
				<td class="inputLabelTd">是否可以提供发票：</td>
				<td class="inputTd">
					<input id="edit_proInvoiceFlag" name="proInvoiceFlag" type="text" class="text" value="${store.proInvoiceFlag}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">
					<input id="edit_remark" name="remark" type="text" class="text" value="${store.remark}"/>
				</td>
				<td class="inputLabelTd">运营开始时间：</td>
				<td class="inputTd">
					<input id="edit_operateDate" name="operateDate" type="text" class="text" value="${store.operateDate}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">结算方式：</td>
				<td class="inputTd">
					<input id="edit_settlementMethod" name="settlementMethod" type="text" class="text" value="${store.settlementMethod}"/>
				</td>
				<td class="inputLabelTd">店铺联系电话：</td>
				<td class="inputTd">
					<input id="edit_storeTel" name="storeTel" type="text" class="text" value="${store.storeTel}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片1：</td>
				<td class="inputTd">
					<input id="edit_realImagePath1" name="realImagePath1" type="text" class="text" value="${store.realImagePath1}"/>
				</td>
				<td class="inputLabelTd">实景图片2：</td>
				<td class="inputTd">
					<input id="edit_realImagePath2" name="realImagePath2" type="text" class="text" value="${store.realImagePath2}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片3：</td>
				<td class="inputTd">
					<input id="edit_realImagePath3" name="realImagePath3" type="text" class="text" value="${store.realImagePath3}"/>
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
