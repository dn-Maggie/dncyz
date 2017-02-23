<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<script type="text/javascript">
$(function() {
	//绑定提交按钮click事件
	$("#submit").click(function() {
		if(!biz.validate("valid",$('#accountCheckFormEdit')[0])){
			showWarn("数据验证失败",3000);
			return;
		}
		var options = {
			url : "<m:url value='/accountCheck/addAccountCheck.do'/>",
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
		$('#accountCheckFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#accountCheckFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>

<div id="editDialog">
	<form id="accountCheckFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${accountCheck.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">结算日期：</td>
				<td class="inputTd">
					<input id="edit_accountTime" name="accountTime" type="text" class="text" value="${accountCheck.accountTime}"/>
				</td>
				<td class="inputLabelTd">饿了吗结算款：</td>
				<td class="inputTd">
					<input id="edit_elmSettlement" name="elmSettlement" type="text" class="text" value="${accountCheck.elmSettlement}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">百度结算款：</td>
				<td class="inputTd">
					<input id="edit_baiduSettlement" name="baiduSettlement" type="text" class="text" value="${accountCheck.baiduSettlement}"/>
				</td>
				<td class="inputLabelTd">美团结算款：</td>
				<td class="inputTd">
					<input id="edit_meituanSettlement" name="meituanSettlement" type="text" class="text" value="${accountCheck.meituanSettlement}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">合计结算金额：</td>
				<td class="inputTd">
					<input id="edit_totalSettlement" name="totalSettlement" type="text" class="text" value="${accountCheck.totalSettlement}"/>
				</td>
				<td class="inputLabelTd">饿了么扣回金额：</td>
				<td class="inputTd">
					<input id="edit_elmCost" name="elmCost" type="text" class="text" value="${accountCheck.elmCost}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">百度扣回金额：</td>
				<td class="inputTd">
					<input id="edit_baiduCost" name="baiduCost" type="text" class="text" value="${accountCheck.baiduCost}"/>
				</td>
				<td class="inputLabelTd">美团扣回金额：</td>
				<td class="inputTd">
					<input id="edit_meituanCost" name="meituanCost" type="text" class="text" value="${accountCheck.meituanCost}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实际应结算金额：</td>
				<td class="inputTd">
					<input id="edit_actualSettlement" name="actualSettlement" type="text" class="text" value="${accountCheck.actualSettlement}"/>
				</td>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">
					<input id="edit_remark" name="remark" type="text" class="text" value="${accountCheck.remark}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${accountCheck.storeId}"/>
				</td>
			<tr>
				<td class="inputTd" colspan="4" style="text-align:center;">
					<input id="submit" type="button" class="ti_bottom" value="保存"/>
				</td>
			</tr>
		</table>
    </div>
	</form>
</div>
</body>
</html>
