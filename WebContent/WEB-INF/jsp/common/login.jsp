<%@page import="com.dongnao.workbench.common.util.Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<%@ include file="header.jsp"%>
<script type="text/javascript">
	if(window!=top){
		top.location.reload();
	}
</script>
<link rel="stylesheet" type="text/css" href="<%=path%>/styles/login.css" />
</head>

<body id="login-body">
	<form id="loginForm" name="loginForm" method="post" action="">
		<div id="loginWindow">
			<table>
				<tr>
					<td class="logo_box" align="center"><img alt="管理员登陆"
						src="<%=path%>/styles/images/login_logo.png"></td>
				</tr>
				<tr>
					<td>
						<div class="group">
							<span class="addon login_name fa fa-user fa-3x"></span> <input
								id="loginName" name="loginName" onkeypress="xKeyEvent(event)"
								tabindex="1" accesskey="n" type="text" autocomplete="off" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="group">
							<span class="addon password fa fa-lock fa-3x"></span> <input
								id="userpw" name="userpw" onkeypress="xKeyEvent(event)"
								tabindex="2" accesskey="p" type="password" autocomplete="off" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="remb">
							<span> <input id="remb" type="checkbox" name="remb" /> <label
								for="remb">记住密码</label> <label class="remb_label" for="remb"></label>
							</span>
						</div> <br>
						<div class="group check_code" style="float:left">
							<span class="addon">验</span> 
							<input class="codeInput" id="codeInput" onkeypress="xKeyEvent(event)"/>
							<img src="<%=basePath%>validateCode" id="codeImg" alt="点击刷新验证码">
						</div> 
						<div class="btn-box">
							<button type="button" onclick="$('#loginForm').get(0).reset()"
								class="btn_reset">重置</button>
							<button type="button" onclick="loginAction('#loginForm');"
								class="btn_login">登录</button>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</form>
</body>
<script>
var codeChecked = false;
$(function(){  
    $("#codeInput").on("input", checkCode); 
    $("#codeImg").on("click", refreshCaptcha);
});  

//验证验证码
		function checkCode(){  
		    var strcode =$(this).val();
		    if(strcode.length <=3 ){ //验证码一般大于三位  
		        return;  
		    }  
		    codeChecked = false;
		    $.ajax({
		   	 url : "<%=basePath%>varifyCode.do?strcode="+strcode,
		  		 cache : false,
		 		 dataType : 'json',
					 success : function(data, textStatus, jqXHR) {
						if(data.status == 1){
		       		 codeChecked = true;
		       	 }
		    	 }
		    });
		    if(event.keyCode==13){  
		   	 loginAction('#loginForm');
		    }  
		 }  
		//重载验证码  
		function refreshCaptcha() {  
			url = "<%=basePath%>validateCode?code=" + Math.random(),
		   $('#codeImg').attr('src',url);   
		}   
	function loginAction(formId) {
		if(!codeChecked){showWarn("请输入正确的验证码！");refreshCaptcha();return;}  
		showInfo("登陆中，请稍后...");
		$("#popup_ok").css("visibility","hidden");
		//表单验证
		function formValidation() {
			var u = f['loginName'];
			var p = f['userpw'];
			if (u.value == null || u.value == "") {
				alert("请输入用户名");
				u.focus();
				return false;
			}
			if (p.value == null || p.value == "") {
				alert("请输入密密码");
				p.focus();
				return false;
			}
			return true;
		}
		var uname = $('#loginName').val();
		var pawd = $('#userpw').val();
		var strcode =$("#codeInput").val();
		$.ajax({
			url : "<%=basePath%>appLogin.do?userName=" + uname + "&password=" + pawd+ "&strcode=" + strcode,
			cache : false,
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				 if (data.status == 1) {
					window.location.href = 'index.do';
				} else {
					showMessage(data.message);
					refreshCaptcha(); 
				} 
			}
		});
	}

	//响应回车按键
	function xKeyEvent(e) {
		var e = e || windows.event;
		switch (e.keyCode | e.which | e.charCode) {
		case 13: {
			//响应回车按键
			loginAction('#loginForm');
		}
		}
	}
</script>
</html>
