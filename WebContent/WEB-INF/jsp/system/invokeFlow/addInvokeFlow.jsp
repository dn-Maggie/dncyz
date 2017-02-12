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
		if(!biz.validate("valid",$('#invokeFlowFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/invokeFlow/addInvokeFlow.do'/>",
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
		$('#invokeFlowFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#invokeFlowFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="invokeFlowFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_flowId" name="flowId" type="text" value="${invokeFlow.flowId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">平台ID（主键）：</td>
				<td class="inputTd">
					<input id="edit_platformId" name="platformId" type="text" class="text" value="${invokeFlow.platformId}"/>
				</td>
				<td class="inputLabelTd">功能ID（主键）：</td>
				<td class="inputTd">
					<input id="edit_opId" name="opId" type="text" class="text" value="${invokeFlow.opId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">调用外卖平台接口url：</td>
				<td class="inputTd">
					<input id="edit_url" name="url" type="text" class="text" value="${invokeFlow.url}"/>
				</td>
				<td class="inputLabelTd">接口调用顺序：</td>
				<td class="inputTd">
					<input id="edit_invokeIndex" name="invokeIndex" type="text" class="text" value="${invokeFlow.invokeIndex}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台描述：</td>
				<td class="inputTd">
					<input id="edit_remark" name="remark" type="text" class="text" value="${invokeFlow.remark}"/>
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
