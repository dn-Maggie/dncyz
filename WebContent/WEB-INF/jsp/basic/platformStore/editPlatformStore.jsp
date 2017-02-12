<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
 <script type="text/javascript">
$(function() {
	//绑定提交按钮click事件
	$("#submit").click(function() {
		if(!biz.validate("valid",$('#platformStoreFormEdit')[0])){
			showWarn("数据验证失败",3000);
			return;
		}
		var options = {
			url : "<m:url value='/platformStore/updatePlatformStore.do'/>",
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
		$('#platformStoreFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#platformStoreFormEdit",
		rules:{
		}
	}); 
});

</script>
</head>
  
<body>
	<form id="platformStoreFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${platformStore.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">平台类别：</td>
				<td class="inputTd">
					<input id="edit_platformType" name="platformType" type="text" class="text" value="${platformStore.platformType}"/>
				</td>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${platformStore.storeId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台店铺序号：</td>
				<td class="inputTd">
					<input id="edit_platformStoreIndex" name="platformStoreIndex" type="text" class="text" value="${platformStore.platformStoreIndex}"/>
				</td>
				<td class="inputLabelTd">平台名称：</td>
				<td class="inputTd">
					<input id="edit_platformStoreName" name="platformStoreName" type="text" class="text" value="${platformStore.platformStoreName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">平台账号：</td>
				<td class="inputTd">
					<input id="edit_platformStoreUsername" name="platformStoreUsername" type="text" class="text" value="${platformStore.platformStoreUsername}"/>
				</td>
				<td class="inputLabelTd">平台密码，MD5加密：</td>
				<td class="inputTd">
					<input id="edit_platformStorePassword" name="platformStorePassword" type="text" class="text" value="${platformStore.platformStorePassword}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">评分：</td>
				<td class="inputTd">
					<input id="edit_platformStoreScore" name="platformStoreScore" type="text" class="text" value="${platformStore.platformStoreScore}"/>
				</td>
				<td class="inputLabelTd">市场经理：</td>
				<td class="inputTd">
					<input id="edit_marketingManager" name="marketingManager" type="text" class="text" value="${platformStore.marketingManager}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">市场经理电话：</td>
				<td class="inputTd">
					<input id="edit_marketingManagerTel" name="marketingManagerTel" type="text" class="text" value="${platformStore.marketingManagerTel}"/>
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
