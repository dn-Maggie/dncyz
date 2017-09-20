<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<base href="<%=basePath%>">

<%@ include file="../../common/header.jsp"%>
<script type="text/javascript">
	$(function() {
		//绑定提交按钮click事件
		$("#close_button").click(function() {
			window.parent.closeShow();
		});
	});

</script>
</head>

<body>
	<div class="ui-table ui-widget ui-corner-all ui-border">
		<table class="table">
			<tr>
				<td class="inputLabelTd"><span class="required">*</span>登录账号：</td>
				<td class="inputTd">${userInfo.userAccount}</td>
				<td class="inputLabelTd"><span class="required">*</span>用户姓名：</td>
				<td class="inputTd">${userInfo.fullName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd"><span class="required">*</span>组织机构：</td>
				<td class="inputTd">${userInfo.orgName}</td>
				<td class="inputLabelTd">性别：</td>
				<td class="inputTd"><c:if test="${userInfo.sex eq 1}">男</c:if>
					<c:if test="${userInfo.sex eq 0}">女</c:if></td>
			</tr>
			<tr>
				<td class="inputLabelTd"><span class="required">*</span>手机号码：</td>
				<td class="inputTd">${userInfo.mobilePhone}</td>
				<td class="inputLabelTd"><span class="required">*</span>年龄：</td>
				<td class="inputTd">${userInfo.age}</td>
			</tr>
			<tr>
				<td class="inputLabelTd"><span class="required">*</span>所属岗位：</td>
				<td class="inputTd">${userInfo.dutyName}</td>
				<td class="inputLabelTd"><span class="required">*</span>身份证号码：</td>
				<td class="inputTd">${userInfo.idCard}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd">${userInfo.memo}</td>
				<td class="inputLabelTd">状态：</td>
				<td class="inputTd"><c:if test="${userInfo.states eq 1}">启用</c:if>
					<c:if test="${userInfo.states eq 0}">停用</c:if></td>
			</tr>
			<tr>
				<td class="inputLabelTd">入职日期：</td>
				<td class="inputTd">${userInfo.entryDate}</td>
				<td class="inputLabelTd">角色</td>
				<td class="inputTd"><c:forEach var="role" items="${roleList}">
						<c:if test="${role.roleId eq roleId}">${role.roleName}</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td class="inputLabelTd">出生年月：</td>
				<td class="inputTd">${userInfo.birthday}</td>
				<td class="inputLabelTd">邮箱地址：</td>
				<td class="inputTd">${userInfo.userEmail}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">地址：</td>
				<td colspan="3" class="inputTd">
					${userInfo.areaProvinceName}--${userInfo.areaRegionName}--${userInfo.areaCityName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">学历</td>
				<td class="inputTd"><c:if test="${userInfo.schooling eq 1}">小学</c:if>
					<c:if test="${userInfo.schooling eq 2}">初中</c:if> <c:if
						test="${userInfo.schooling eq 3}">高中（职高、高）</c:if> <c:if
						test="${userInfo.schooling eq 4}">中专大专（高职）</c:if> <c:if
						test="${userInfo.schooling eq 5}">本科</c:if> <c:if
						test="${userInfo.schooling eq 6}">硕士研究生</c:if> <c:if
						test="${userInfo.schooling eq 7}">博士研究生</c:if></td>
				<td class="inputLabelTd">薪酬标准：</td>
				<td class="inputTd">${userInfo.salStandardName}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">核定工资：</td>
				<td class="inputTd">${userInfo.salValue}</td>
				<td class="inputLabelTd">股份配额(股)：</td>
				<td class="inputTd">${userInfo.stockNum}</td>
			</tr>
			<tr>
				<td class="inputLabelTd">身份证图片：</td>
				<td class="inputTd" colspan="3">
					<div id="upload" style="text-align: center"></div>
					<div id="idCardImgDiv" style="width: 600px;">
						<img style="max-width: 600px;" src="${userInfo.idCardImgPath}" />
					</div>
				</td>
			</tr>
			<tr>
				<td class="inputTd" colspan="5" style="text-align: center;"><input
					class="ti_bottom" type="button" id="close_button" value="关闭" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
