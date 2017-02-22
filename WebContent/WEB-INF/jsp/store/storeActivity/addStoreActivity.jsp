<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script type="text/javascript">
$(function() {
	
	//select多选 初始化方法
	$(".choose_select").chosen(); 
	$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	new biz.select({//活动状态下拉
	    id:"#edit_activityStatus",
	    url:"<m:url value='/dictInfo/getDictByTypeCode.do?dictTypeCode=activityStatus'/>",
	});
	new biz.select({//活动类型下拉
	    id:"#edit_activityType",
	    url:"<m:url value='/dictInfo/getDictByTypeCode.do?dictTypeCode=activityType'/>",
	});
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});
		showMessage("正在处理...");
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
						$("#submit").prop('disabled', false).css({'cursor':'pointer'});
					}
				},
				error:function(){
					showWarn("数据插入失败",3000);
					$("#submit").prop('disabled', false).css({'cursor':'pointer'});
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
function getactivityIdByName(obj,value){
	var did = $("#activityList").find("option[value="+value+"]").data('aid')
	$(obj).parents('.inputTd').find("#edit_activityId").val(did);
}
</script>
</head>
  
<body>
	<form id="storeActivityFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_storeActivityId" name="storeActivityId" type="text" value="${storeActivity.storeActivityId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">活动类型：</td>
				<td class="inputTd">
					<select class="search_select" name="activityType" id="edit_activityType"></select>
				</td>
				<td class="inputLabelTd">活动名称：</td>
				<td class="inputTd">
					<input class="text" name="activityName" id="edit_activityName" list="activityList"
						oninput="getactivityIdByName(this,this.value);"/>
					<input type="hidden" name="activityId" id="edit_activityId">
					<datalist id="activityList">
						<c:forEach var="activity" items="${activity}">
							<option data-aid="${activity.activityId}" value="${activity.activityName}" label="${activity.activityName}"></option>
			             </c:forEach>
					</datalist>
					<%-- <select class="search_select choose_select" name="activityId" id="edit_activityId">
						<option value="">--请选择--</option>
						<c:forEach var="activity" items="${activity}">
							<option value="${activity.activityId}"> <c:out value="${activity.activityName}"></c:out> </option>
			             </c:forEach>
					</select> --%>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">活动起始时间：</td>
				<td class="inputTd">
					<div class="input-group">
						<input class="date-picker text" name="activityTimeBegin" id="edit_activityTimeBegin" type="text" data-date-format="yyyy-mm-dd" />
						<span>
							<i class="icon-calendar bigger-110"></i>
						</span>
					</div>
				</td>
				<td class="inputLabelTd">活动结束时间：</td>
				<td class="inputTd">
					<div class="input-group">
						<input class="date-picker text" name="activityTimeEnd" id="edit_activityTimeEnd" type="text" data-date-format="yyyy-mm-dd" />
						<span>
							<i class="icon-calendar bigger-110"></i>
						</span>
					</div>
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
				<!-- <td class="inputLabelTd">活动状态：</td>
				<td class="inputTd">
					<select class="search_select" name="activityStatus" id="edit_activityStatus">
					</select>
				</td> -->
				<td class="inputLabelTd">店铺名称：</td>
				<td class="inputTd">
					<select class="search_select choose_select" name="storeId" id="edit_storeId">
						<option value="">--请选择--</option>
						<c:forEach var="store" items="${store}">
							<option value="${store.storeId}"> <c:out value="${store.storeName}"></c:out> </option>
			             </c:forEach>
					</select>
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
					<div class="input-group">
						<input class="date-picker text" name="activityExecuteTime" id="edit_activityExecuteTime" type="text" data-date-format="yyyy-mm-dd" />
						<span>
							<i class="icon-calendar bigger-110"></i>
						</span>
					</div>
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
