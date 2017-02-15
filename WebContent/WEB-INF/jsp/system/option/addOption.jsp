<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<script type="text/javascript">
$(function() {
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});showMessage("正在处理...");
		if(!biz.validate("valid",$('#optionFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/option/addOption.do'/>",
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
		$('#optionFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#optionFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="optionFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_opId" name="opId" type="text" value="${option.opId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">功能编码（GET_ORDER：获取订单，CONFIRM_ORDER:确认订单，CANCEL_ORDER：取消订单）：</td>
				<td class="inputTd">
					<input id="edit_opCode" name="opCode" type="text" class="text" value="${option.opCode}"/>
				</td>
				<td class="inputLabelTd">操作名称：</td>
				<td class="inputTd">
					<input id="edit_opName" name="opName" type="text" class="text" value="${option.opName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台描述：</td>
				<td class="inputTd">
					<input id="edit_remark" name="remark" type="text" class="text" value="${option.remark}"/>
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
