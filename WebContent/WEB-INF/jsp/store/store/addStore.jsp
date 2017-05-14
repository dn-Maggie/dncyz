<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<style>
	.ace-file-input{width:180px;position: relative;height: 38px; line-height: 38px; margin:0; display:inline-block;float:left;}
</style>
<script src="<%=request.getContextPath() %>/static/js/fuelux/fuelux.wizard.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/additional-methods.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/bootbox.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/jquery.maskedinput.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/select2.min.js"></script>
<script type="text/javascript">
$(function() {
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
	
	
	$('.pwd').on('blur', function(){
		//验证平台账号密码
		var platformType = $(this).attr('name');
		switch (platformType) {
			case "elmPwd": platformType = 'elm'; showInfo("正在检测，请稍后...");break;
			case "meituanPwd":platformType = 'mt'; showInfo("正在检测，请稍后...");break;
			/*case "baidupwd":platformType = 'bdwm'; break;*/
			default:return false;
		}
		var url = "<m:url value='/store/checkStoreAcocunt.do'/>";
		var password = $(this).val();
		var username = $(this).parents('tr').find('.username').val();
		if(username==""||password==""){
			showMessage("请输入账号密码！",2000);
			return false;
		}
		var paramData = {
			username:username,
			password:password,
			platformType:platformType
		};
		$.ajax({
	 		   type: "post",
	 		   url :url,
	 		   data: JSON.stringify(paramData),
	 		   cache: false,
	 		   dataType:"json",
	 		   contentType :"application/json; charset=utf-8",
	           error: function(d) {
	        	   	var pType = JSON.parse(this.data).platformType=="elm"?"elm":"meituan";
	           		showMessage("验证账号失败！");
	           	 $("input[name="+pType+"Pwd]").parents('tr').find('i')
				   .removeClass("icon-unchecked").removeClass("green")
				   .addClass("red").addClass("icon-stop");
	           },
			   success:function(d){
					var pType = JSON.parse(this.data).platformType=="elm"?"elm":"meituan";
				   if(d.respCode == "0000"){
					   showMessage("账号验证成功！");
					   debugger;
					   $("input[name="+pType+"Pwd]").parents('tr').find('i')
					   .removeClass("icon-unchecked").removeClass("red").removeClass("icon-stop")
					   .addClass("icon-check-sign").addClass("green");
				   }else{
					   showMessage("账号密码不正确");
					   $("input[name="+pType+"Pwd]").parents('tr').find('i')
					   .removeClass("icon-unchecked").removeClass("green")
					   .addClass("red").addClass("icon-stop");
				   }
				  
			   }
 		});
	});
	$("#edit_userAccount").on('change',function(e, info){
		var userAccount = $("#edit_userAccount").val()
		if (ajaxGetUserInfoByUserAccount(userAccount)) {
			showMessage("登录账户已经存在，请重新输入.");
			return;
		} 
	})
	$('#fuelux-wizard').ace_wizard().on('change' , function(e, info){
		//首次保存第一页基础资料
		if(info.step == 1 && info.direction == "next" && $('#edit_storeId').val().length==0 &&$('#edit_storeName').val().length>0) {
			 var options = {
				url : "<m:url value='/store/addStore.do'/>",
				type : "post",
				dataType:"json",
				success : function(d) {
					if(d.status==0){
						showError(d.message, 2000);
					}else{
						$('#edit_storeId').val(d.storeId);
					}
				},
			};
			$('#basicMessForm').ajaxSubmit(options);
			List.doSearch(window.parent.gridObj);
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
			     		List.doSearch(window.parent.gridObj);
					});
				}else{
					showMessage(d.message);
				}
			},
		};
		$('#basicMessForm').ajaxSubmit(options);
	})
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
	function ajaxGetUserInfoByUserAccount(userAccount) {
		var b = false;
		if (userAccount != null && userAccount != "") {
			$.ajax({
			url : "<m:url value='/userInfo/ajaxGetUserInfoByUserAccount.do'/>?userAccount="
					+ userAccount,
			cache : false,
			async : false,
			success : function(data, textStatus, jqXHR) {
				if (data == "true") {
					showMessage("登录账户已经存在，请重新输入.");
					b = true;
				}
			}
		});
		};
		return b;
	}
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
					 		<td class="inputLabelTd"><span class="required">*</span>店铺账号：</td>
							<td class="inputTd">
								<input id="edit_userAccount" name="userAccount" type="text" class="text" placeholder="请用英文与数字组合" title="请用英文与数字组合"/>
							</td>
							<td class="inputLabelTd"><span class="required">*</span>店铺名称：</td>
							<td class="inputTd">
								<input id="edit_storeName" name="storeName" type="text" class="text" value="${store.storeName}"/>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd">店铺联系电话：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_storeTel" name="storeTel" type="text" class="text" value="${store.storeTel}"/>
									<i class="icon-phone green"></i>
								</span>
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
						<tr>
							<td class="inputLabelTd"><span class="required">*</span>所属商圈：</td>
							<td class="inputTd">
								<input id="edit_businessArea" name="businessArea" type="text" class="text" value="${store.businessArea}" list="businessAreaList"/>
								<datalist id="businessAreaList">
									<option value="五一商圈"></option>
								</datalist>
							</td>
							<td class="inputLabelTd">店铺地址：</td>
							<td class="inputTd">
								<input id="edit_storeAddress" name="storeAddress" type="text" class="text" value="${store.storeAddress}"/>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd"><span class="required">*</span>配送方式：</td>
							<td class="inputTd">
								<input id="edit_storeDistMode" name="storeDistMode" type="text" class="text" value="${store.storeDistMode}" list="distModeList"/>
								<datalist id="distModeList">
									<option value="自配送"></option>
									<option value="自配送（饿了么、百度）"></option>
									<option value="自配送（饿了么、美团）"></option>
									<option value="专送"></option>
									<option value="专送（美团）"></option>
								</datalist>
							</td>
							<td class="inputLabelTd"><span class="required">*</span>店铺类型：</td>
							<td class="inputTd">
								<select id="edit_storeType" name="storeType"  class="search_select">
									<option value="1">夜宵</option>
									<option value="2">正餐</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd"><span class="required">*</span>营业时间起：</td>
							<td class="inputTd">
								<div class="input-group bootstrap-timepicker">
									<input class="timepicker text" name="workTimeBegin" id="edit_workTimeBegin" type="text" />
									<span>
										<i class="icon-time bigger-110"></i>
									</span>
								</div>
							</td>
							<td class="inputLabelTd"><span class="required">*</span>营业时间止：</td>
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
							<td class="inputLabelTd"><span class="required">*</span>绑卡类型：</td>
							<td class="inputTd">
								<select class="search_select" name="boundType" id="edit_boundType">
									<option value="1">绑商家卡</option>
									<option value="2">绑公司卡</option>
								</select>
							</td>
							<td class="inputLabelTd"><span class="required">*</span>饿了么平台商铺ID：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_elmId" name="elmId" type="text" class="text" value="${store.elmId}"/>
									<i class="icon-check-sign green"></i>
								</span>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd"><span class="required">*</span>饿了么平台商铺账号：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_elmUsername" name="elmUsername" type="text" class="text username" value="${store.elmUsername}"/>
									<i class="icon-unchecked green"></i>
								</span>
							</td>
							<td class="inputLabelTd"><span class="required">*</span>饿了么平台商铺密码：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_elmPwd" name="elmPwd" type="text" class="text pwd" value="${store.elmPwd}"/>
									<i class="icon-unchecked green"></i>
								</span>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd"><span class="required">*</span>美团平台商铺账号：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_meituanId" name="meituanId" type="text" class="text username" value="${store.meituanId}"/>
									<i class="icon-unchecked green"></i>
								</span>
								
							</td>
							<td class="inputLabelTd"><span class="required">*</span>美团平台商铺密码：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_meituanPwd" name="meituanPwd" type="text" class="text pwd" value="${store.meituanPwd}"/>
									<i class="icon-unchecked green"></i>
								</span>
							</td>
						</tr>
						<tr>
							<td class="inputLabelTd"><span class="required">*</span>百度平台商铺账号：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_baiduId" name="baiduId" type="text" class="text username" value="${store.baiduId}"/>
									<i class="icon-check-sign green" title="暂时无法验证，请确保正确"></i>
								</span>
							</td>
							<td class="inputLabelTd"><span class="required">*</span>百度平台商铺密码：</td>
							<td class="inputTd">
								<span class="input-icon">
									<input id="edit_baidupwd" name="baidupwd" type="text" class="text pwd" value="${store.baidupwd}"/>
									<i class="icon-check-sign green" title="暂时无法验证，请确保正确"></i>
								</span>
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
