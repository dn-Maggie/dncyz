<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script type="text/javascript">
$(function() {
	
	new biz.select({//状态下拉
	    id:"#edit_activityType",
	    url:"<m:url value='/dictInfo/getDictByTypeCode.do?dictTypeCode=activityType'/>",
	});
	
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});
		showMessage("正在处理...");
		if(!biz.validate("valid",$('#activityFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/activity/addActivity.do'/>",
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
		$('#activityFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#activityFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="activityFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_activityId" name="activityId" type="text" value="${activity.activityId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">活动名称：</td>
				<td class="inputTd">
					<input id="edit_activityName" name="activityName" type="text" class="text" value="${activity.activityName}"/>
				</td>
				<td class="inputLabelTd">活动类型：</td>
				<td class="inputTd">
					<select class="search_select" name="activityType" id="edit_activityType">
					</select>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动描述：</td>
				<td class="inputTd">
					<input id="edit_activityDesc" name="activityDesc" type="text" class="text" value="${activity.activityDesc}"/>
				</td>
				<td class="inputLabelTd">活动预计价值：</td>
				<td class="inputTd">
					<input id="edit_activityExpectedProfit" name="activityExpectedProfit" type="text" class="text" value="${activity.activityExpectedProfit}"/>
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
