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
		//取得添加节点的父节点ID
		//身份证图片上传控件
			 var up=$("#upload").Huploadify(
					{
						auto : true,
						fileTypeExts : '*.*',
						multi : true,
						// formData:{key:123456,key2:'vvvv'},
						fileSizeLimit : 102400,
						showUploadedPercent : true,
						showUploadedSize : true,
						removeTimeout : 9999999,
						uploader : "<m:url value='/upload/idCard.do'/>",
						onUploadStart : function(file) {
							console.log(file.name + '开始上传');
						},
						onInit : function(obj) {
							console.log('初始化');
							console.log(obj);
						},
						onUploadComplete : function(file) {
							console.log(file.name + '上传完成');
						},
						onCancel : function(file) {
							console.log(file.name + '删除成功');
						},
						onClearQueue : function(queueItemCount) {
							console.log('有' + queueItemCount + '个文件被删除了');
						},
						onDestroy : function() {
							console.log('destroyed!');
						},
						onSelect : function(file) {
							console.log(file.name + '加入上传队列');
						},
						onQueueComplete : function(queueData) {
							console.log('队列中的文件全部上传完成', queueData);
							up.cancel('*');
						},
						onUploadSuccess : function(file, data, response) {
							console.log('服务器返回数据', data);
							data = jQuery.parseJSON(data);
							$('#idCardImgPath').val(data.data);
							var imgUrl="<m:url value='/download/tmpIdCard.do'/>?fileName="+data.data;
							$("#idCardImgDiv").html("");
							$("#idCardImgDiv").append($('<img style="max-width:600px;" src="'+imgUrl+'"/>'));
							
						}
					});
		

		
		
		//绑定提交按钮click事件
		$("#submit").click(function() {
			if (!biz.validate("valid", $('#userInfoFormEdit')[0])) {
				showWarn("<m:message code='validation.object'/>", 3000);
				return;
			}
			var options = {
				url : "<m:url value='/userInfo/updateUserInfo.do'/>",
				type : "post",
				dataType:"json",
				cache : false,
				success : function(d) {
					if(d.status){
						showMessage(d.message,"","",function(){
							window.parent.closeEdit();
				     		window.parent.doSearch();
						});
					}else{
						showMessage(d.message);
					}
				}
			};
			// 将options传给ajaxForm
			$('#userInfoFormEdit').ajaxSubmit(options);
		});

		$("#passwordReset").click(function() {
			var key=$('#edit_id').val();
			$.ajax({      
				   url:"<m:url value='/userInfo/passwordReset.do'/>",
				   type:'post',      
				   data:{key:key},
				   cache:false,
				   success:function(data){      
				       if(data!=null&&data!=""){
				    	  showMessage("<m:message code='passwordReset.success'/>");
				       }
				   }   
			});
		});
		/*编辑表单数据验证*/
		new biz.validate({
			id : "#userInfoFormEdit",
			rules : {
				"userAccount" : {
					required : true,
					maxlength : 50
				},
				"fullName" : {
					required : true,
					maxlength : 15
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
	<form id="userInfoFormEdit">
		<div class="ui-table ui-widget ui-corner-all ui-border">
			<table class="table">
				<tr>
					<td class="inputLabelTd"><span class="required">*</span>登录账号：</td>
					<td class="inputTd"><input id="userId" name="userId"
						type="hidden" class="text" value="${userInfo.userId}" /> <input
						id="edit_userAccount" name="userAccount" type="text" class="text"
						style="background-color: #eee;" readonly="readonly"
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
							<option value="1"
								<c:if test="${userInfo.states eq 1}" >selected</c:if>>启用</option>
							<option value="0"
								<c:if test="${userInfo.states eq 0}" >selected</c:if>>停用</option>
					</select></td>
				</tr>
				<tr>
					<td class="inputLabelTd">角色</td>
					<td class="inputTd"><select id="roleId" name="roleId"
						class="select">
							<c:forEach var="role" items="${roleList}">
								<option value="${role.roleId}"
									<c:if test="${userInfo.roleId eq role.roleId}" >selected</c:if>>
									${role.roleName}</option>
							</c:forEach>
					</select></td>
					<td class="inputLabelTd">身份证图片：</td>
					<td class="inputTd" colspan="3"><input id="idCardImgPath"
						name="idCardImgPath" type="hidden" class="text"
						value="${userInfo.idCardImgPath}" />
						<div id="upload" style="text-align: center"></div> <a
						href="javascript:void(0);"
						onClick="$('#file_upload_1-button').click();">选择图片</a>
						<div id="idCardImgDiv" style="width: 600px;">
							<img style="max-width: 600px;"
								src="<m:url value='/download/tmpIdCard.do'/>?fileName=${userInfo.idCardImgPath}" />
						</div></td>
				</tr>
				<tr>
					<td class="inputTd" colspan="5" style="text-align: center;"><input
						id="submit" type="button" class="ti_bottom" value="保存" /> <input
						id="passwordReset" type="button" class="ti_bottom" value="密码重置" />
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
