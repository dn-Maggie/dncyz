<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<style>
	.ace-file-input{width:180px;position: relative;height: 38px; line-height: 38px; margin:0; display:inline-block;float:left;}
	.upload{margin-left: 15px;}
</style>
<script src="<%=request.getContextPath() %>/static/js/fuelux/fuelux.wizard.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/additional-methods.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/bootbox.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/jquery.maskedinput.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/select2.min.js"></script>
<script type="text/javascript">
$(function() {
	//select多选 初始化方法
	$(".choose_select").chosen(); 
	$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	$('.number').ace_spinner({value:0,min:0,max:999999,step:1, touch_spinner: true, icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('.money').ace_spinner({value:0,min:0,step:1, max:999999,touch_spinner: true, icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
	$('.rate').ace_spinner({value:0,min:0,max:100,step:1,icon_up:'icon-plus smaller-75', icon_down:'icon-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
	$('.timepicker').timepicker({
		minuteStep: 1,
		showSeconds: true,
		showMeridian: false
	}).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	//结算方式状态下拉
	new biz.select({
	    id:"#edit_settlementMethod",
	    url:"<m:url value='/dictInfo/getDictByTypeCode.do?dictTypeCode=settlementMethod'/>",
	});
	//是否提供发票checkbox点击事件
	$('#edit_proInvoiceFlag').removeAttr('checked').on('click', function(){
		if(this.checked) { $("#edit_proInvoiceFlag").val("1"); }
		else { $("#edit_proInvoiceFlag").val("0"); }
	});
	$('#fuelux-wizard').ace_wizard().on('change' , function(e, info){
		//首次保存第一页基础资料
		if(info.step == 1 && info.direction == "next" && $('#edit_storeId').val().length==0) {
			 var options = {
				url : "<m:url value='/store/addStore.do'/>",
				type : "post",
				dataType:"json",
				success : function(d) {
					$('#edit_storeId').val(d.storeId)
				},
			};
			$('#basicMessForm').ajaxSubmit(options);
		}
		if(info.step == 2 && info.direction == "next" && $('#edit_storeId').val().length>0) {
			//修改店铺资料
			var options = {
				url : "<m:url value='/store/updateStore.do'/>",
				type : "post",
				dataType:"json",
				success : function(d) {
				},
			};
			$('#basicMessForm').ajaxSubmit(options);
		}
		if(info.step == 3 && info.direction == "next" && $('#edit_storeId').val().length>0) {
			//判断图片是否都已经上传
			//修改店铺资料
			var paramDatas = {
					storeId:$("#edit_storeId").val(),
					realImagePath1:$("#edit_realImagePath1").val(),
					realImagePath2:$("#edit_realImagePath2").val(),
					realImagePath3:$("#edit_realImagePath3").val(),
					businessLicenseImg:$("#edit_businessLicenseImg").val(),
					healthLicenseImg:$("#edit_healthLicenseImg").val(),
					menuImg:$("#edit_menuImg").val(),
					corporateIdcardFront:$("#edit_corporateIdcardFront").val(),
					corporateIdcardBack:$("#edit_corporateIdcardBack").val(),
					canteenImg:$("#edit_canteenImg").val(),
					kitchenImg:$("#edit_kitchenImg").val(),
					doorImg:$("#edit_doorImg").val(),
					corporateWithidcardFront:$("#edit_corporateWithidcardFront").val(),
					corporateWithidcardBack:$("#edit_corporateWithidcardBack").val(),
				};
			$.ajax({
		 		   type: "post",
		 		   url : "<m:url value='/store/updateImg.do'/>",
		 		   data: paramDatas,
		 		   cache: false,
		 		   dataType:"json",
		           error: function() {
		           showMessage("请求失败");
		           }
		 		});
		}
	}).on('finished', function(e) {
		var options = {
			url : "<m:url value='/store/updateStore.do'/>",
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
			},
		};
		$('#basicMessForm').ajaxSubmit(options);
	})
	$('input[type="file"]').ace_file_input({
		no_file:'请选择...',
		btn_choose:'选择',
		btn_change:'更换',
		droppable:false,
		thumbnail:false,
	}).on('change',function(){
    	$(this).parent().parent().find('.realImage_submit').val("上传");
    	var extend=$(this).val().split('.').pop().toLowerCase();
			if("gif|png|jpg|jpeg|svg".indexOf(extend)==-1){
				 showInfo("请上传图片格式文件！",3000);
				 $(this).parent().parent().find('.realImage_submit').prop("disabled",true);
				 return;
	         }else{
	        	 $(this).parent().parent().find('.realImage_submit').prop("disabled",false);
	         }
	});
	$('.icon-remove').click(function(){
		$(this).parent().find('.realImage_submit').val("上传");
	});
	$('.realImage_submit').click(function(){
		if(!$("#edit_storeName").val()) {showMessage("请先填写店铺名称！"); return;}
		$(this).parent().find('#image_storeName').val($("#edit_storeName").val());
		var btnObj = $(this);
		var $realPathobj = $(this).parent().find('.path')[0]; 
		var options = {
			url : "<%=request.getContextPath()%>/common/fileUpload",
			type : "post",
			dataType:"json", 
			processData: false,
	        contentType: false, 
			success : function(d) {
				if(d&&d.respCode == '0000'){
					$realPathobj.value = d.picAddr; 
					btnObj.val("上传成功")
				}else{
					showMessage("图片上传失败");
				}
			},
			error:function(){
				showMessage("图片上传失败");
			}
		};
		$(this).parent('#realImageForm').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	  new biz.validate({
		id:"#basicMessForm",
		rules:{
			"storeName":{required : true},
// 			"storeAddress":{required : true},
// 			"workTimeBegin":{required : true},
// 			"workTimeEnd":{required : true},
// 			"storeOwnerTel" : {
// 				required : true,
// 				maxlength : 11,
// 				naturalnum:true
// 			},
		}
	});
});
</script>
</head>
<body>
<div class="widget-box">
	<div class="widget-body">
		<div class="widget-main">
			<div id="fuelux-wizard" class="row-fluid" data-target="#step-container">
				<ul class="wizard-steps">
					<li data-target="#step1" class="active">
						<span class="step">1</span>
						 <p>基本数据</p> 
					</li>

					<li data-target="#step2">
						<span class="step">2</span>
						 <p>店铺平台信息</p> 
					</li>

					<li data-target="#step3">
						<span class="step">3</span>
						 <p>证件图片</p>
					</li>

					<li data-target="#step4">
						<span class="step">4</span>
						<p>资料填写完成</p> 
					</li>
				</ul>
			</div>
			<div class="step-content row-fluid position-relative" id="step-container">
				<form class="form-horizontal" id="basicMessForm" method="post" autocomplete="off">
					<div class="step-pane active" id="step1">
					 <input type="hidden" id="edit_storeId" name="storeId" type="text" value="${store.storeId}"/>
					 <table class="table">
					 	<tr>	
					 		<td class="inputLabelTd">关联店铺账号：</td>
							<td class="inputTd">
								<select class="search_select" name="ownerUserId" id="edit_ownerUserId">
									<c:forEach items="${user}" var="user">
										<option value="${user.id}"><c:out value="${user.userAccount}"></c:out></option>
									</c:forEach>
								</select>
							</td>
						</tr>
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
									<input class="timepicker text" name="workTimeBegin" id="edit_workTimeBegin" type="text" />
									<span>
										<i class="icon-time bigger-110"></i>
									</span>
								</div>
							</td>
							<td class="inputLabelTd">营业时间止：</td>
							<td class="inputTd">
								<div class="input-group bootstrap-timepicker">
									<input class="timepicker text" name="workTimeEnd" id="edit_workTimeEnd" type="text" />
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
								</select>
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
							<td class="inputLabelTd">登记人：</td>
							<td class="inputTd">
								<input id="edit_registrant" name="registrant" type="text" class="text" value="${store.registrant}"/>
							</td>
							<td class="inputLabelTd">登记日期：</td>
							<td class="inputTd">
								<div class="input-group">
									<input class="date-picker text" name="registDate" id="edit_registDate" type="text" data-date-format="yyyy-mm-dd" />
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
									<input class="date-picker text" name="operateDate" id="edit_operateDate" type="text" data-date-format="yyyy-mm-dd" />
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
					</table>
				</div>
				<div class="step-pane" id="step2">
					 <table class="table">
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
							<td class="inputLabelTd">饿了么平台商铺ID：</td>
							<td class="inputTd">
								<input id="edit_elmId" name="elmId" type="text" class="text" value="${store.elmId}"/>
							</td>
							<td class="inputLabelTd">饿了么平台佣金率(%)：</td>
							<td class="inputTd">
								<input id="edit_elmRate" name="elmRate" type="text" class="text rate" value="${store.elmRate}"/>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">美团平台商铺ID：</td>
							<td class="inputTd">
								<input id="edit_meituanId" name="meituanId" type="text" class="text" value="${store.meituanId}"/>
							</td>
							<td class="inputLabelTd">美团平台佣金率(%)：</td>
							<td class="inputTd">
								<input id="edit_meituanRate" name="meituanRate" type="text" class="text rate" value="${store.meituanRate}"/>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">百度平台商铺ID：</td>
							<td class="inputTd">
								<input id="edit_baiduId" name="baiduId" type="text" class="text" value="${store.baiduId}"/>
							</td>
							<td class="inputLabelTd">百度平台佣金率(%)：</td>
							<td class="inputTd">
								<input id="edit_baiduRate" name="baiduRate" type="text" class="text rate" value="${store.baiduRate}"/>
							</td>
						</tr>
					</table>
				</div>
				</form>
				<div class="step-pane" id="step3">
				<iframe id="realImageIframe" name="realImageIframe"  class="realImageIframe" width="0" height="0"></iframe>
					<table class="table">
						<tr>
							<td class="inputLabelTd">实景图片1：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_realImagePath1" name="realImagePath1" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
							<td class="inputLabelTd">实景图片2：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_realImagePath2" name="realImagePath2" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">实景图片3：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_realImagePath3" name="realImagePath3" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
							<td class="inputLabelTd">营业执照：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_businessLicenseImg" name="businessLicenseImg" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">卫生经营许可证：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_healthLicenseImg" name="healthLicenseImg" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
							<td class="inputLabelTd">菜单：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_menuImg" name="menuImg" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">法人身份证（正面）：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_corporateIdcardFront" name="corporateIdcardFront" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
							<td class="inputLabelTd">法人身份证（反面）：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_corporateIdcardBack" name="corporateIdcardBack" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">堂食照：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_canteenImg" name="canteenImg" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
							<td class="inputLabelTd">后厨照：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_kitchenImg" name="kitchenImg" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">门头：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_doorImg" name="doorImg" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">法人手持身份证(正）：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_corporateWithidcardFront" name="corporateWithidcardFront" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
							<td class="inputLabelTd">法人手持身份证(反)：</td>
							<td class="inputTd">
								<form method="post" id="realImageForm"  target="realImageIframe" enctype="multipart/form-data" action="<%=request.getContextPath()%>/common/fileUpload">
									<input id="image_storeName" name="storeMess"  class="text" type="hidden" value="storeName"/><!-- 商铺名称作为文件夹名称 -->
									<input type="file" class="text" name="image"/>
									<input type="hidden" id="edit_corporateWithidcardBack" name="corporateWithidcardBack" class="path"> <!-- 数据库保存地址 -->
									<input type="button" class="realImage_submit btn btn-xs spinner-up btn-success upload" value="上传" disabled><!--上传按钮-->
								</form>
							</td>
						</tr>
					</table>
				</div>
				<div class="step-pane" id="step4">
					<div class="center">
						<h3 class="green">商铺资料已完善!</h3>
					</div>
				</div>
			</div>
			<div class="row-fluid wizard-actions">
				<button class="btn btn-prev btn-sm">
					<i class="icon-arrow-left"></i>
					上一步
				</button>
				<button class="btn btn-success btn-next btn-sm" data-last="完成">
					下一步
					<i class="icon-arrow-right icon-on-right"></i>
				</button>
			</div>
		</div>
	</div>
   </div>
</body>
</html>
