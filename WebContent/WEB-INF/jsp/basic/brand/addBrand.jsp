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
		if(!biz.validate("valid",$('#brandFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/brand/addBrand.do'/>",
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
		$('#brandFormEdit').ajaxSubmit(options);
	});

	/*编辑表单数据验证*/
	new biz.validate({
		id:"#brandFormEdit",
		rules:{
		}
	}); 
});
</script>
</head>
  
<body>
	<form id="brandFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_brandId" name="brandId" type="text" value="${brand.brandId}"/>
		<table class="table">
			<tr>
				<td class="inputLabelTd">品牌名称：</td>
				<td class="inputTd">
					<input id="edit_brandName" name="brandName" type="text" class="text" value="${brand.brandName}"/>
				</td>
				<td class="inputLabelTd">品牌负责人：</td>
				<td class="inputTd">
					<input id="edit_brandManager" name="brandManager" type="text" class="text" value="${brand.brandManager}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">负责人电话：</td>
				<td class="inputTd">
					<input id="edit_brandManagerTel" name="brandManagerTel" type="text" class="text" value="${brand.brandManagerTel}"/>
				</td>
				<td class="inputLabelTd">门店数量：</td>
				<td class="inputTd">
					<input id="edit_storesNumber" name="storesNumber" type="text" class="text" value="${brand.storesNumber}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">所在省份：</td>
				<td class="inputTd">
					<input id="edit_provinceCode" name="provinceCode" type="text" class="text" value="${brand.provinceCode}"/>
				</td>
				<td class="inputLabelTd">所在地市：</td>
				<td class="inputTd">
					<input id="edit_regionCode" name="regionCode" type="text" class="text" value="${brand.regionCode}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">所在区县：</td>
				<td class="inputTd">
					<input id="edit_cityCode" name="cityCode" type="text" class="text" value="${brand.cityCode}"/>
				</td>
				<td class="inputLabelTd">行业ID：</td>
				<td class="inputTd">
					<input id="edit_industryId" name="industryId" type="text" class="text" value="${brand.industryId}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">品类ID：</td>
				<td class="inputTd">
					<input id="edit_categoryId" name="categoryId" type="text" class="text" value="${brand.categoryId}"/>
				</td>
				<td class="inputLabelTd">对接人：</td>
				<td class="inputTd">
					<input id="edit_contactName" name="contactName" type="text" class="text" value="${brand.contactName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">负责人电话：</td>
				<td class="inputTd">
					<input id="edit_contactTel" name="contactTel" type="text" class="text" value="${brand.contactTel}"/>
				</td>
				<td class="inputLabelTd">招商人：</td>
				<td class="inputTd">
					<input id="edit_merchantName" name="merchantName" type="text" class="text" value="${brand.merchantName}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">招商人电话：</td>
				<td class="inputTd">
					<input id="edit_merchantTel" name="merchantTel" type="text" class="text" value="${brand.merchantTel}"/>
				</td>
				<td class="inputLabelTd">合同签订时间：</td>
				<td class="inputTd">
					<input id="edit_signContractDate" name="signContractDate" type="text" class="text" value="${brand.signContractDate}"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">创建时间：</td>
				<td class="inputTd">
					<input id="edit_createDate" name="createDate" type="text" class="text" value="${brand.createDate}"/>
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
