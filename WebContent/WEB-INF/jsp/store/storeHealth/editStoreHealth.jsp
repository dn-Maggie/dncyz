<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
 <script type="text/javascript">
$(function() {
	//绑定提交按钮click事件
	$("#submit").click(function() {
		if(!biz.validate("valid",$('#storeHealthFormEdit')[0])){
			showWarn("数据验证失败",3000);
			return;
		}
		var options = {
			url : "<m:url value='/storeHealth/updateStoreHealth.do'/>",
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
		$('#storeHealthFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storeHealthFormEdit",
		rules:{
		}
	}); 
});

</script>
</head>
  
<body>
	<form id="storeHealthFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_id" name="id" type="text" value="${storeHealth.id}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${storeHealth.storeId}"/>
				</td>
				<td class="inputLabelTd">评估时间：</td>
				<td class="inputTd">
					<input id="edit_assessDate" name="assessDate" type="text" class="text" value="${storeHealth.assessDate}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">评估人：</td>
				<td class="inputTd">
					<input id="edit_assessors" name="assessors" type="text" class="text" value="${storeHealth.assessors}"/>
				</td>
				<td class="inputLabelTd">健康值：</td>
				<td class="inputTd">
					<input id="edit_healthValue" name="healthValue" type="text" class="text" value="${storeHealth.healthValue}"/>
				</td>
			</tr>
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
