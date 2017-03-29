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
		if(!biz.validate("valid",$('#storePlatformRelFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/storePlatformRel/addStorePlatformRel.do'/>",
			type : "post",
				dataType:"json",
				success : function(d) {
					if(d.status){
						showMessage(d.message,"","",function(){
							window.parent.closeAdd();
				     		List.doSearch(window.parent.gridObj);
						});
					}else{
						showMessage(d.message);
					}
				}
		};
		// 将options传给ajaxForm
		$('#storePlatformRelFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storePlatformRelFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="storePlatformRelFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_platformId" name="platformId" type="text" value="${storePlatformRel.platformId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">关联ID（主键）：</td>
				<td class="inputTd">
					<input id="edit_relId" name="relId" type="text" class="text" value="${storePlatformRel.relId}"/>
				</td>
				<td class="inputLabelTd">店铺ID(主键)：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${storePlatformRel.storeId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺名称：</td>
				<td class="inputTd">
					<input id="edit_storeName" name="storeName" type="text" class="text" value="${storePlatformRel.storeName}"/>
				</td>
				<td class="inputLabelTd">平台编码（BD：百度外卖，MT：美团外卖，ELM：饿了么外卖）：</td>
				<td class="inputTd">
					<input id="edit_platformCode" name="platformCode" type="text" class="text" value="${storePlatformRel.platformCode}"/>
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
