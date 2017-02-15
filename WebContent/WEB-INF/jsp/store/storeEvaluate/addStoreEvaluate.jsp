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
		if(!biz.validate("valid",$('#storeEvaluateFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/storeEvaluate/addStoreEvaluate.do'/>",
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
		$('#storeEvaluateFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storeEvaluateFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="storeEvaluateFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_evaluateId" name="evaluateId" type="text" value="${storeEvaluate.evaluateId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">评价产品ID：</td>
				<td class="inputTd">
					<input id="edit_productId" name="productId" type="text" class="text" value="${storeEvaluate.productId}"/>
				</td>
				<td class="inputLabelTd">渠道ID：</td>
				<td class="inputTd">
					<input id="edit_channelId" name="channelId" type="text" class="text" value="${storeEvaluate.channelId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">星级：</td>
				<td class="inputTd">
					<input id="edit_starLevel" name="starLevel" type="text" class="text" value="${storeEvaluate.starLevel}"/>
				</td>
				<td class="inputLabelTd">评价内容：</td>
				<td class="inputTd">
					<input id="edit_evaluateContent" name="evaluateContent" type="text" class="text" value="${storeEvaluate.evaluateContent}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">回复内容：</td>
				<td class="inputTd">
					<input id="edit_replyContent" name="replyContent" type="text" class="text" value="${storeEvaluate.replyContent}"/>
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
