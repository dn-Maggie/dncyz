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
	$('.number').ace_spinner({value:0,min:0,max:999999,step:1, touch_spinner: true, icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('.money').ace_spinner({value:0,min:0,step:1, max:999999,touch_spinner: true, icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('.rate').ace_spinner({value:0,min:0,max:100,step:1,  on_sides: true, icon_up:'icon-plus smaller-75', icon_down:'icon-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
	$('.timepicker').timepicker({
		minuteStep: 1,
		showSeconds: true,
		showMeridian: false
	}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	 /* new biz.select({//状态下拉
	    id:"#edit_settlementMethod",
	    url:"<m:url value='/dictInfo/getDictByTypeCode.do?dictTypeCode=settlementMethod'/>", 
	});  */
	  
	$('input[type="file"]').ace_file_input({
		no_file:'请选择...',
		btn_choose:'选择',
		btn_change:'更换',
		droppable:false,
		onchange:null,
		thumbnail:false,
		whitelist:'gif|png|jpg|jpeg'
		//blacklist:'exe|php'
		//onchange:''
		//
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
		 	url : "<m:url value='/store/updateStore.do'/>",
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
				},
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
			/* "workTimeBegin":{required : true},
			"workTimeEnd":{required : true}, */
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
							<option value="${brand.brandId}" <c:if test="${brand.brandId==store.brandId}">selected</c:if>> <c:out value="${brand.brandName}"></c:out> </option>
			             </c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店铺地址：</td>
				<td class="inputTd">
					<input id="edit_storeAddress" name="storeAddress" type="text" class="text" value="${store.storeAddress}"/>
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
				<td class="inputLabelTd">营业时间起：</td>
				<td class="inputTd">
					<div class="input-group bootstrap-timepicker">
						<input class="timepicker text" name="workTimeBegin" id="edit_workTimeBegin" type="text" value="${store.workTimeBegin}"/>
						<span>
							<i class="icon-time bigger-110"></i>
						</span>
					</div>
				</td>
				<td class="inputLabelTd">营业时间止：</td>
				<td class="inputTd">
					<div class="input-group bootstrap-timepicker">
						<input class="timepicker text" name="workTimeEnd" id="edit_workTimeEnd" type="text" value="${store.workTimeEnd}"/>
						<span>
							<i class="icon-time bigger-110"></i>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">店长姓名：</td>
				<td class="inputTd">
					<input id="edit_storeOwnerName" name="storeOwnerName" type="text" class="text" value="${store.storeOwnerName}"/>
				</td>
				<td class="inputLabelTd">店长电话：</td>
				<td class="inputTd">
					<span class="input-icon">
						<input id="edit_storeOwnerTel" name="storeOwnerTel" type="text" class="text" value="${store.storeOwnerTel}"/>
						<i class="icon-phone green"></i>
					</span>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">结算方式：</td>
				<td class="inputTd">
					<select class="search_select" name="settlementMethod" id="edit_settlementMethod">
						<c:forEach var="settlementMethod" items="${settlementMethod}">
							<option value="${settlementMethod.dictCode}" <c:if test="${settlementMethod.dictCode==store.settlementMethod}">selected</c:if>> <c:out value="${settlementMethod.dictName}"></c:out> </option>
			             </c:forEach>
					</select>
				</td>
				<td class="inputLabelTd">是否可以提供发票：</td>
				<td class="inputTd">
					<label>
						<input id="edit_proInvoiceFlag" name="proInvoiceFlag" class="ace ace-switch ace-switch-5" type="checkbox" <c:if test='${store.proInvoiceFlag==on}'>checked</c:if>/>
						<span class="lbl"></span>
					</label>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">登记人：</td>
				<td class="inputTd">
					<input id="edit_registrant" name="registrant" type="text" class="text" value="${store.registrant}"/>
				</td>
				<td class="inputLabelTd">登记日期：</td>
				<td class="inputTd">
					<div class="input-group">
						<input class="date-picker text" name="registDate" id="edit_registDate" type="text" data-date-format="yyyy-mm-dd" value="${store.registDate}"/>
						<span>
							<i class="icon-calendar bigger-110"></i>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">运营开始时间：</td>
				<td class="inputTd">
					<div class="input-group">
						<input class="date-picker text" name="operateDate" id="edit_operateDate" type="text" data-date-format="yyyy-mm-dd" value="${store.operateDate}"/>
						<span>
							<i class="icon-calendar bigger-110"></i>
						</span>
					</div>
				</td>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">
					<input id="edit_remark" name="remark" type="text" class="text" value="${store.remark}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">大概店铺月销售额(万元)：</td>
				<td class="inputTd">
					<input id="edit_averageSales" name="averageSales" type="text" class="text money" value="${store.averageSales}"/>
				</td>
				<td class="inputLabelTd">饿了么平台月销售单量：</td>
				<td class="inputTd">
					<input id="edit_elmSale" name="elmSale" type="text" class="text number" value="${store.elmSale}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">美团平台月销售单量：</td>
				<td class="inputTd">
					<input id="edit_meituanSale" name="meituanSale" type="text" class="text number" value="${store.meituanSale}"/>
				</td>
				<td class="inputLabelTd">百度平台月销售单量：</td>
				<td class="inputTd">
					<input id="edit_baiduSale" name="baiduSale" type="text" class="text number" value="${store.baiduSale}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">饿了么平台佣金率(%)：</td>
				<td class="inputTd">
					<input id="edit_elmRate" name="elmRate" type="text" class="text rate" value="${store.elmRate}"/>
				</td>
				<td class="inputLabelTd">美团平台佣金率(%)：</td>
				<td class="inputTd">
					<input id="edit_meituanRate" name="meituanRate" type="text" class="text rate" value="${store.meituanRate}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">百度平台佣金率(%)：</td>
				<td class="inputTd">
					<input id="edit_baiduRate" name="baiduRate" type="text" class="text rate" value="${store.baiduRate}"/>
				</td>
				<td class="inputLabelTd">关联店铺账号：</td>
				<td class="inputTd">
					<select class="search_select" name="ownerUserId" id="edit_ownerUserId">
						<c:forEach items="${user}" var="user">
							<option value="${user.id}"<c:if test="${user.id==store.ownerUserId}">selected</c:if>><c:out value="${user.userAccount}"></c:out></option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片1：</td>
				<td class="inputTd">
					<input id="edit_realImagePath1" name="realImagePath1" type="file" class="text" value="${store.realImagePath1}"/>
				</td>
				<td class="inputLabelTd">实景图片2：</td>
				<td class="inputTd">
					<input id="edit_realImagePath2" name="realImagePath2" type="file" class="text" value="${store.realImagePath2}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">实景图片3：</td>
				<td class="inputTd">
					<input id="edit_realImagePath3" name="realImagePath3" type="file" class="text" value="${store.realImagePath3}"/>
				</td>
				<td class="inputLabelTd">营业执照：</td>
				<td class="inputTd">
					<input id="edit_businessLicenseImg" name="businessLicenseImg" type="file" class="text" value="${store.businessLicenseImg}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">卫生经营许可证：</td>
				<td class="inputTd">
					<input id="edit_healthLicenseImg" name="healthLicenseImg" type="file" class="text" value="${store.healthLicenseImg}"/>
				</td>
				<td class="inputLabelTd">菜单：</td>
				<td class="inputTd">
					<input id="edit_menuImg" name="menuImg" type="file" class="text" value="${store.menuImg}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">法人身份证（正面）：</td>
				<td class="inputTd">
					<input id="edit_corporateIdcardFront" name="corporateIdcardFront" type="file" class="text" value="${store.corporateIdcardFront}"/>
				</td>
				<td class="inputLabelTd">法人身份证（反面）：</td>
				<td class="inputTd">
					<input id="edit_corporateIdcardBack" name="corporateIdcardBack" type="file" class="text" value="${store.corporateIdcardBack}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">堂食照：</td>
				<td class="inputTd">
					<input id="edit_canteenImg" name="canteenImg" type="file" class="text" value="${store.canteenImg}"/>
				</td>
				<td class="inputLabelTd">后厨照：</td>
				<td class="inputTd">
					<input id="edit_kitchenImg" name="kitchenImg" type="file" class="text" value="${store.kitchenImg}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">门头：</td>
				<td class="inputTd">
					<input id="edit_doorImg" name="doorImg" type="file" class="text" value="${store.doorImg}"/>
				</td>
				<td class="inputLabelTd">法人手持身份证(正）：</td>
				<td class="inputTd">
					<input id="edit_corporateWithidcardFront" name="corporateWithidcardFront" type="file" class="text" value="${store.corporateWithidcardFront}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">法人手持身份证(反)：</td>
				<td class="inputTd">
					<input id="edit_corporateWithidcardBack" name="corporateWithidcardBack" type="file" class="text" value="${store.corporateWithidcardBack}"/>
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
