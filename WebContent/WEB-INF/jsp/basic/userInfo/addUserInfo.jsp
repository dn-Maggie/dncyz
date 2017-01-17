<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/huploadify/jquery.Huploadify.js"></script>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/js/huploadify/Huploadify.css">
<script type="text/javascript">
	var menutree;
	var areaProvinceBox, areaRegionBox, areaCityBox;
	$(function() {
		//取得添加节点的父节点ID

		//岗位选择
		dutyBox = $('#dutyName').TiledCombobox({
			url : "<m:url value='/duty/list.do'/>",
			fieldId : 'id',
			fieldName : 'dutyName',
			valueId : '#dutyId',
			multiple : false
		});	
		
		
// 		//身份证图片上传控件
// 			 var up=$("#upload").Huploadify(
// 					{
// 						auto : true,
// 						fileTypeExts : '*.*',
// 						multi : true,
// 						// formData:{key:123456,key2:'vvvv'},
// 						fileSizeLimit : 102400,
// 						showUploadedPercent : true,
// 						showUploadedSize : true,
// 						removeTimeout : 9999999,
// 						uploader : "<m:url value='/upload/idCard.do'/>",
// 						onUploadStart : function(file) {
// 							console.log(file.name + '开始上传');
// 						},
// 						onInit : function(obj) {
// 							console.log('初始化');
// 							console.log(obj);
// 						},
// 						onUploadComplete : function(file) {
// 							console.log(file.name + '上传完成');
// 						},
// 						onCancel : function(file) {
// 							console.log(file.name + '删除成功');
// 						},
// 						onClearQueue : function(queueItemCount) {
// 							console.log('有' + queueItemCount + '个文件被删除了');
// 						},
// 						onDestroy : function() {
// 							console.log('destroyed!');
// 						},
// 						onSelect : function(file) {
// 							console.log(file.name + '加入上传队列');
// 						},
// 						onQueueComplete : function(queueData) {
// 							console.log('队列中的文件全部上传完成', queueData);
// 							up.cancel('*');
// 						},
// 						onUploadSuccess : function(file, data, response) {
// 							console.log('服务器返回数据', data);
// 							data = jQuery.parseJSON(data);
// 							$('#idCardImgPath').val(data.data);
// 							var imgUrl="<m:url value='/download/tmpIdCard.do'/>?fileName="+data.data;
// 							$("#idCardImgDiv").html("");
// 							$("#idCardImgDiv").append($('<img style="max-width:600px;" src="'+imgUrl+'"/>'));
							
// 						}
// 					});
		

		
		
		//绑定提交按钮click事件
		$("#submit").click(function() {
			
			$('#salStandardName').val($('#salStandardId').find("option:selected").text());
			if (!biz.validate("valid", $('#userInfoFormAdd')[0])) {
				showWarn("<m:message code='validation.object'/>", 3000);
				return;
			}
		 	var userAccount = $("#edit_userAccount").val();
			if (ajaxGetUserInfoByUserAccount(userAccount)) {
				showMessage("登录账户已经存在，请重新输入.");
				return;
			} 
			
			var options = {
					url : "<m:url value='/userInfo/addUserInfo.do'/>",
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
			
			//验证图片
			var fileName = $("#file").val();
			if(fileName.length>1){  
				var extname = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();  
				var imgname = fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);  
				if(extname!= "jpeg"&&extname!= "jpg"&&extname!= "gif"&&extname!= "png"){  
					 showWarn("格式不正确,支持的图片格式为：JPEG、JPG、GIF、PNG！");  
			         return false;  
			        }  
				var file = $("#file").get(0).files; 
				var size = file[0].size;
				console.log(file);
				if(size>2097152){  
					  showWarn("所选择的图片太大，图片大小最多支持2M!"); 
			          return false;  
			     }  		
				
				// 创建一个FileReader对象
				var reader = new FileReader();
				// 绑定load事件
				reader.onload = function(e) {
					$("#fileData").val(e.target.result);
					// 将options传给ajaxForm
					$('#userInfoFormAdd').ajaxSubmit(options);
				}
				// 读取File对象的数据
				reader.readAsDataURL($("#file").get(0).files[0]);
		      }
			else{
			// 将options传给ajaxForm
			$('#userInfoFormAdd').ajaxSubmit(options);}
			
		});

		/*编辑表单数据验证*/
		new biz.validate({
			id : "#userInfoFormAdd",
			rules : {
				"userAccount" : {
					required : true,
					maxlength : 50
				},
				"fullName" : {
					required : true,
					maxlength : 15
				},
				"age" : {
					required : true,
					maxlength : 2
				},
				"mobilePhone" : {
					required : true,
					maxlength : 11
				},
				"idCard" : {
					required : true,
					maxlength : 18
				},
				"dutyName" : {
					required : true,
					maxlength : 18
				},
				"memo" : {
					maxlength : 150
				}
			}
		});

		//入职日期
		new biz.datepicker({
			id : "#edit_entryDate",//容器Id   
			event : "click",
			dateFmt : 'yyyy-MM-dd'
		});
		//出生日期
		new biz.datepicker({
			id : "#edit_birthday",//容器Id   
			event : "click",
			dateFmt : 'yyyy-MM-dd'
		});

		new biz.select(
				{//状态下拉
					id : "#edit_states",
					url : "<m:url value='/dictInfo/getDictByTypeCode.do?dictTypeCode=status'/>"
				});

		new biz.select({//角色
			id : "#edit_role",
			url : "<m:url value='/role/getRoleListForSelect.do'/>",
			addEmptyItem : true
		});
		
		$("#salStandardId").change(function(){
			   var op=$(this).find("option:selected");
			  $('#salValue').val(op.attr("totalValue"));
			  $('#stockNum').val(op.attr("stockNum"));
		});

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

	//获取菜单资源数据，构建树
	function setMenuTreeJson(rid) {
		$.ajax({
			url : "<c:url value='/role/getMenuTreeJsonByRole.do'/>",
			data : {
				roleRid : rid
			},
			type : "POST",
			success : function(data, textStatus, jqXHR) {
				menutree = new biz.tree({
					id : "#menutree",
					nodes : $.parseJSON(data), //数据节点指定     
					data : {
						simpleData : {
							enable : true
						}
					}
				});//创建树 
			}
		});
	}
	function showRole(obj) {
		setMenuTreeJson(obj.value);
	}
	
	//打开员工资源管理界面
	function employeeMgt() {
		var url = baseUrl + '/userInfo/toSelectEmployee.do';
		employeelist_iframe_dialog = new biz.dialog(
				{
					id : $('<div id="sublist_window_iframe"></div>')
							.html(
									'<iframe id="iframeSublist" name="iframeSublist" src="'
											+ url
											+ '" width="100%" frameborder="no" border="0" height="97%"></iframe>'),
					modal : true,
					width : $(window).width()*0.8,
					height : $(window).height()*0.8,
					title : "员工信息列表"
				});
		employeelist_iframe_dialog.open();
	}

	// 关闭员工资源管理界面
	function closeEmployee() {
		employeelist_iframe_dialog.close();
	}
	
	//填充数据
	function drawForm(rowData) {
		console.log(rowData);
		$("#edit_fullName").val(rowData.name);
		$("#edit_sex").find("option:selected").val(rowData.sex);
		$("#edit_sex").find("option:selected").text(rowData.sex);
		$("#mobilePhone").val(rowData.mobile);
		$("#age").val(rowData.age);
		$("#dutyName").val(rowData.position);
		$("#idCard").val(rowData.idCard);
		$("#entryDate").val(rowData.entryDate);
		$("#edit_schooling").val(rowData.educationBackground);
		$("#mobilePhone").val(rowData.mobile);
		$("#mobilePhone").val(rowData.mobile);
	}
	
</script>
</head>

<body>
	<div class="listplace" style="margin: 0px">
		<!--功能按钮begin-->
		<div class="list_btn_bg fl" style="position: absolute;">
			<!--功能按钮 div-->
			<ul>
				<li><a title="从员工信息中选择" href="javascript:;"
					onclick="employeeMgt();"> <i class="back_icon resources_icon"></i>
						<span>从员工信息中选择</span>
				</a></li>
				<li><a title="重置" href="javascript:;"
					onclick="resetForm('userInfoFormAdd')"> <i
						class="icon_bg icon_del"></i><span>重置</span>
				</a></li>
			</ul>
		</div>
		<!--功能按钮end-->
	</div>

	<form id="userInfoFormAdd" style="margin-top: 35px;">
		<div class="ui-table ui-widget ui-corner-all ui-border">
			<table class="table">
				<tr>
					<td class="inputLabelTd"><span class="required">*</span>登录账号：</td>
					<td class="inputTd"><input id="edit_userAccount"
						name="userAccount" type="text" class="text"
						value="${userInfo.userAccount}" /></td>
					<td class="inputLabelTd"><span class="required">*</span>用户姓名：</td>
					<td class="inputTd"><input id="edit_fullName" name="fullName"
						type="text" class="text" value="${userInfo.fullName}" /></td>

				</tr>
				<tr>
					<td class="inputLabelTd"><span class="required">*</span>组织机构：</td>
					<td class="inputTd"><input id="edit_orgName" name="orgName"
						type="text" class="text" value="${basicOrg.orgName}"
						readonly="readonly" /> <input id="edit_orgId" name="orgId"
						type="hidden" class="text" value="${basicOrg.id}" /> <input
						id="orgClass" name="orgClass" type="hidden" class="text"
						value="${basicOrg.orgClass}" /></td>
					<td class="inputLabelTd">性别：</td>
					<td class="inputTd"><select id="edit_sex" name="sex"
						class="select">
							<option value="1">男</option>
							<option value="0">女</option>
					</select></td>
				</tr>
				<tr>
					<td class="inputLabelTd"><span class="required">*</span>手机号码：</td>
					<td class="inputTd"><input id="mobilePhone" name="mobilePhone"
						type="text" class="text" value="${userInfo.mobilePhone}" /></td>
					<td class="inputLabelTd"><span class="required">*</span>年龄：</td>
					<td class="inputTd"><input id="age" name="age" type="text"
						class="text" value="${userInfo.age}" /></td>
				</tr>
				<tr>
					<td class="inputLabelTd"><span class="required">*</span>所属岗位：</td>
					<td class="inputTd"><input id="dutyName" name="dutyName"
						type="text" class="text" value="${userInfo.dutyName}" /> <input
						id="dutyId" name="dutyId" type="hidden" class="text"
						value="${userInfo.dutyId}" /></td>
					<td class="inputLabelTd"><span class="required">*</span>身份证号码：</td>
					<td class="inputTd"><input id="idCard" name="idCard"
						type="text" class="text" value="${userInfo.idCard}" /></td>
				</tr>
				<tr>
					<td class="inputLabelTd">备注：</td>
					<td class="inputTd"><input id="edit_memo" name="memo"
						type="text" class="text" value="${userInfo.memo}" /></td>
					<td class="inputLabelTd">状态：</td>
					<td class="inputTd"><select id="edit_states" name="states"
						class="select">
							<option value="1">启用</option>
							<option value="0">停用</option>
					</select></td>
				</tr>
				<tr>
					<td class="inputLabelTd">入职日期：</td>
					<td class="inputTd"><input id="edit_entryDate"
						name="entryDate" type="text" class="text"
						value="${userInfo.entryDate}" /></td>
					<td class="inputLabelTd">角色</td>
					<td class="inputTd"><select id="edit_roleId" name="roleId"
						class="select">
							<c:forEach var="role" items="${roleList}">
								<option value="${role.roleId}">${role.roleName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="inputLabelTd">出生年月：</td>
					<td class="inputTd"><input id="edit_birthday" name="birthday"
						type="text" class="text" value="${userInfo.birthday}" /></td>
					<td class="inputLabelTd">邮箱地址：</td>
					<td class="inputTd"><input id="edit_userEmail"
						name="userEmail" type="text" class="text"
						value="${userInfo.userEmail}" /></td>
				</tr>
				<tr>
					<td class="inputLabelTd">学历</td>
					<td class="inputTd"><select id="edit_schooling"
						name="schooling" class="select">
							<option value="1">小学</option>
							<option value="2">初中</option>
							<option value="3">高中（职高、高）</option>
							<option value="4">中专大专（高职）</option>
							<option value="5">本科</option>
							<option value="6">硕士研究生</option>
							<option value="7">博士研究生</option>
					</select></td>
					<td class="inputLabelTd">薪酬标准：</td>
					<td class="inputTd"><select id="salStandardId"
						name="salStandardId" class="select">
							<option value=""></option>
							<c:forEach var="salStandard" items="${salStandardList}">
								<option value="${salStandard.id}"
									totalValue="${salStandard.totalValue}"
									stockNum="${salStandard.stockNum}">${salStandard.standardName}</option>
							</c:forEach>
					</select> <input id="salStandardName" name="salStandardName" type="hidden"
						value="${userInfo.salStandardName}" /></td>
				</tr>
				<tr>
					<td class="inputLabelTd">核定工资：</td>
					<td class="inputTd"><input id="salValue" name="salValue"
						type="text" class="text" value="${userInfo.salValue}" /></td>
					<td class="inputLabelTd">股份配额(股)：</td>
					<td class="inputTd"><input id="stockNum" name="stockNum"
						type="text" class="text" value="${userInfo.stockNum}" /></td>
				</tr>
				<tr>
					<td class="inputLabelTd">身份证图片：</td>
					<td class="inputTd" colspan="3">
						<!--  <input
							id="idCardImgPath" name="idCardImgPath" type="hidden" class="text"
							value="${userInfo.idCardImgPath}" />
						<div id="upload" style="text-align: center"></div>
							<a href="javascript:void(0);" onClick="$('#file_upload_1-button').click();"
									>选择图片</a>
							<div id="idCardImgDiv" style="width:600px;"></div>		--> <input
						id="fileData" name="idCardImgPath" type="hidden"> <input
						id="file" type="file" class="text" />
					</td>
				</tr>
				<tr>
					<td class="inputTd" colspan="5" style="text-align: center;"><input
						id="submit" type="button" class="ti_bottom" value="保存" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
