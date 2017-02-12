<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/huploadify/jquery.Huploadify.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/huploadify/Huploadify.css">
<script type="text/javascript">
	var menutree;
	var areaProvinceBox, areaRegionBox, areaCityBox;
	$(function() {
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
				"memo" : {
					maxlength : 150
				}
			}
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
	
</script>
</head>

<body>
	<form id="userInfoFormAdd">
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
					<td class="inputLabelTd"><span class="required">*</span>手机号码：</td>
					<td class="inputTd"><input id="mobilePhone" name="mobilePhone"
						type="text" class="text" value="${userInfo.mobilePhone}" /></td>
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
					<td class="inputLabelTd">角色</td>
					<td class="inputTd"><select id="edit_roleId" name="roleId"
						class="select">
							<c:forEach var="role" items="${roleList}">
								<option value="${role.roleId}">${role.roleName}</option>
							</c:forEach>
					</select></td>
					<td class="inputLabelTd">身份证图片：</td>
					<td class="inputTd" colspan="3">
						<!--<input id="idCardImgPath" name="idCardImgPath" type="hidden" class="text" value="${userInfo.idCardImgPath}" />--> 
						<input id="fileData" name="idCardImgPath" type="hidden">
						<input id="file" type="file" class="text" />
					</td>
				</tr>
				<tr>
					<td class="inputTd" colspan="5" style="text-align: center;">
						<input id="submit" type="button" class="ti_bottom" value="保存" />
						<input id="reset" type="reset" class="ti_bottom mr22" value="重置" />
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
