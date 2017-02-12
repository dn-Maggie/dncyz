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
		if(!biz.validate("valid",$('#storeFluxFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/storeFlux/addStoreFlux.do'/>",
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
		$('#storeFluxFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storeFluxFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="storeFluxFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_fluxId" name="fluxId" type="text" value="${storeFlux.fluxId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">平台ID：</td>
				<td class="inputTd">
					<input id="edit_platformId" name="platformId" type="text" class="text" value="${storeFlux.platformId}"/>
				</td>
				<td class="inputLabelTd">店铺ID：</td>
				<td class="inputTd">
					<input id="edit_storeId" name="storeId" type="text" class="text" value="${storeFlux.storeId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">曝光量：</td>
				<td class="inputTd">
					<input id="edit_storeExposure" name="storeExposure" type="text" class="text" value="${storeFlux.storeExposure}"/>
				</td>
				<td class="inputLabelTd">进店人数：</td>
				<td class="inputTd">
					<input id="edit_storeVisitorNum" name="storeVisitorNum" type="text" class="text" value="${storeFlux.storeVisitorNum}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">下单数：</td>
				<td class="inputTd">
					<input id="edit_storeOrderNum" name="storeOrderNum" type="text" class="text" value="${storeFlux.storeOrderNum}"/>
				</td>
				<td class="inputLabelTd">品类入口餐厅列表流量：</td>
				<td class="inputTd">
					<input id="edit_fluxInCategory" name="fluxInCategory" type="text" class="text" value="${storeFlux.fluxInCategory}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">首页餐厅列表流量：</td>
				<td class="inputTd">
					<input id="edit_fluxInHomepage" name="fluxInHomepage" type="text" class="text" value="${storeFlux.fluxInHomepage}"/>
				</td>
				<td class="inputLabelTd">订单详情页流量：</td>
				<td class="inputTd">
					<input id="edit_fluxInDetaile" name="fluxInDetaile" type="text" class="text" value="${storeFlux.fluxInDetaile}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动页流量：</td>
				<td class="inputTd">
					<input id="edit_fluxInActivity" name="fluxInActivity" type="text" class="text" value="${storeFlux.fluxInActivity}"/>
				</td>
				<td class="inputLabelTd">收藏餐厅流量：</td>
				<td class="inputTd">
					<input id="edit_fluxInCollect" name="fluxInCollect" type="text" class="text" value="${storeFlux.fluxInCollect}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">搜索流量：</td>
				<td class="inputTd">
					<input id="edit_fluxInSearch" name="fluxInSearch" type="text" class="text" value="${storeFlux.fluxInSearch}"/>
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
