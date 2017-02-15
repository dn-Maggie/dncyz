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
	$('.number').ace_spinner({value:0,min:0,max:200000,step:1, touch_spinner: true, icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('.timepicker').timepicker({
		minuteStep: 1,
		showSeconds: true,
		showMeridian: false
	}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	new biz.select({//状态下拉
	    id:"#edit_settlementMethod",
	    url:"<m:url value='/dictInfo/getDictByTypeCode.do?dictTypeCode=settlementMethod'/>",
	});
	
	
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});
		showMessage("正在处理...");
		if(!biz.validate("valid",$('#storeFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/store/addStore.do'/>",
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
		$('#storeFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#storeFormEdit",
		rules:{
			"storeName":{required : true},
			"storeAddress":{required : true},
			"workTimeBegin":{required : true},
			"workTimeEnd":{required : true},
			"storeOwnerTel" : {
				required : true,
				maxlength : 11,
				naturalnum:true
			},
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="storeFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_storeId" name="storeId" type="text" value="${store.storeId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">店铺名称：</td>
				<td class="inputTd">
					<input id="edit_storeName" name="storeName" type="text" class="text" value="${store.storeName}"/>
				</td>
				<td class="inputLabelTd">所属品牌：</td>
				<td class="inputTd">
					<select class="search_select choose_select" name="brandId" id="edit_brandId">
						<option value="">--请选择--</option>
						<c:forEach var="brand" items="${brand}">
							<option value="${brand.brandId}"> <c:out value="${brand.brandName}"></c:out> </option>
			             </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺地址：</td>
				<td class="inputTd">
					<input id="edit_storeAddress" name="storeAddress" type="text" class="text" value="${store.storeAddress}"/>
				</td>
				<td class="inputLabelTd">营业时间起：</td>
				<td class="inputTd">
					<div class="input-group bootstrap-timepicker">
						<input class="timepicker text" name="workTimeBegin" id="edit_workTimeBegin" type="text" />
						<span>
							<i class="icon-time bigger-110"></i>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">营业时间止：</td>
				<td class="inputTd">
					<div class="input-group bootstrap-timepicker">
						<input class="timepicker text" name="workTimeEnd" id="edit_workTimeEnd" type="text" />
						<span>
							<i class="icon-time bigger-110"></i>
						</span>
					</div>
				</td>
				<td class="inputLabelTd">店长姓名：</td>
				<td class="inputTd">
					<input id="edit_storeOwnerName" name="storeOwnerName" type="text" class="text" value="${store.storeOwnerName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店长电话：</td>
				<td class="inputTd">
					<span class="input-icon">
						<input id="edit_storeOwnerTel" name="storeOwnerTel" type="text" class="text" value="${store.storeOwnerTel}"/>
						<i class="icon-phone green"></i>
					</span>
				</td>
				<td class="inputLabelTd">是否可以提供发票：</td>
				<td class="inputTd">
					<label>
						<input id="edit_proInvoiceFlag" name="proInvoiceFlag" class="ace ace-switch ace-switch-5" type="checkbox" />
						<span class="lbl"></span>
					</label>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">
					<input id="edit_remark" name="remark" type="text" class="text" value="${store.remark}"/>
				</td>
				<td class="inputLabelTd">运营开始时间：</td>
				<td class="inputTd">
					<div class="input-group">
						<input class="date-picker text" name="operateDate" id="edit_operateDate" type="text" data-date-format="yyyy-mm-dd" />
						<span>
							<i class="icon-calendar bigger-110"></i>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">结算方式：</td>
				<td class="inputTd">
					<select class="search_select" name="settlementMethod" id="edit_settlementMethod">
					</select>
				</td>
				<td class="inputLabelTd">店铺联系电话：</td>
				<td class="inputTd">
					<span class="input-icon">
						<input id="edit_storeTel" name="storeTel" type="text" class="text" value="${store.storeTel}"/>
						<i class="icon-phone green"></i>
					</span>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片1：</td>
				<td class="inputTd">
					<input id="edit_realImagePath1" name="realImagePath1" type="text" class="text" value="${store.realImagePath1}"/>
				</td>
				<td class="inputLabelTd">实景图片2：</td>
				<td class="inputTd">
					<input id="edit_realImagePath2" name="realImagePath2" type="text" class="text" value="${store.realImagePath2}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片3：</td>
				<td class="inputTd">
					<input id="edit_realImagePath3" name="realImagePath3" type="text" class="text" value="${store.realImagePath3}"/>
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
