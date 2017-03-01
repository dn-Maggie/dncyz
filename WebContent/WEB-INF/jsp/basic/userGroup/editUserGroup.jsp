<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
 <script type="text/javascript">
$(function() {
	//绑定提交按钮click事件
	$("#submit").click(function() {
		if(!biz.validate("valid",$('#userGroupFormEdit')[0])){
			showWarn("数据验证失败",3000);
			return;
		}
		var options = {
			url : "<m:url value='/userGroup/updateUserGroup.do'/>",
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
		$('#userGroupFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#userGroupFormEdit",
		rules:{
		}
	}); 
});

</script>
</head>
  
<body>
	<form id="userGroupFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${userGroup.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">组别名：</td>
				<td class="inputTd">
					<input id="edit_groupName" name="groupName" type="text" class="text" value="${userGroup.groupName}"/>
				</td>
				<td class="inputLabelTd">组别描述：</td>
				<td class="inputTd">
					<input id="edit_groupDesc" name="groupDesc" type="text" class="text" value="${userGroup.groupDesc}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">组别状态：</td>
				<td class="inputTd">
					<input id="edit_groupStates" name="groupStates" type="text" class="text" value="${userGroup.groupStates}"/>
				</td>
				<td class="inputLabelTd">创建者ID：</td>
				<td class="inputTd">
					<input id="edit_groupCreater" name="groupCreater" type="text" class="text" value="${userGroup.groupCreater}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">更新者ID：</td>
				<td class="inputTd">
					<input id="edit_groupUpdater" name="groupUpdater" type="text" class="text" value="${userGroup.groupUpdater}"/>
				</td>
				<td class="inputLabelTd">创建时间：</td>
				<td class="inputTd">
					<input id="edit_groupCreateTime" name="groupCreateTime" type="text" class="text" value="${userGroup.groupCreateTime}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">更新时间：</td>
				<td class="inputTd">
					<input id="edit_groupUpdateTime" name="groupUpdateTime" type="text" class="text" value="${userGroup.groupUpdateTime}"/>
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
