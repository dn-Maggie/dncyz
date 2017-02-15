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
		if(!biz.validate("valid",$('#storeActivityFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/storeActivity/addStoreActivity.do'/>",
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
		$('#storeActivityFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storeActivityFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="storeActivityFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_storeActivityId" name="storeActivityId" type="text" value="${storeActivity.storeActivityId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${storeActivity.storeId}"/>
				</td>
				<td class="inputLabelTd">活动ID：</td>
				<td class="inputTd">
					<input id="edit_activityId" name="activityId" type="text" class="text" value="${storeActivity.activityId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动起始时间：</td>
				<td class="inputTd">
					<input id="edit_activityTimeBegin" name="activityTimeBegin" type="text" class="text" value="${storeActivity.activityTimeBegin}"/>
				</td>
				<td class="inputLabelTd">活动结束时间：</td>
				<td class="inputTd">
					<input id="edit_activityTimeEnd" name="activityTimeEnd" type="text" class="text" value="${storeActivity.activityTimeEnd}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动预算费用：</td>
				<td class="inputTd">
					<input id="edit_activityExpectedBudget" name="activityExpectedBudget" type="text" class="text" value="${storeActivity.activityExpectedBudget}"/>
				</td>
				<td class="inputLabelTd">活动预计回报：</td>
				<td class="inputTd">
					<input id="edit_activityExpectedReturn" name="activityExpectedReturn" type="text" class="text" value="${storeActivity.activityExpectedReturn}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动状态：</td>
				<td class="inputTd">
					<input id="edit_activityStatus" name="activityStatus" type="text" class="text" value="${storeActivity.activityStatus}"/>
				</td>
				<td class="inputLabelTd">活动实际价值：</td>
				<td class="inputTd">
					<input id="edit_activityActualProfit" name="activityActualProfit" type="text" class="text" value="${storeActivity.activityActualProfit}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动执行人：</td>
				<td class="inputTd">
					<input id="edit_activityExecutor" name="activityExecutor" type="text" class="text" value="${storeActivity.activityExecutor}"/>
				</td>
				<td class="inputLabelTd">活动执行时间：</td>
				<td class="inputTd">
					<input id="edit_activityExecuteTime" name="activityExecuteTime" type="text" class="text" value="${storeActivity.activityExecuteTime}"/>
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
