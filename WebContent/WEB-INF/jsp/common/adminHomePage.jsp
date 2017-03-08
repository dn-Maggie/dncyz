<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ include file="header.jsp"%>
<%@ include file="ace.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<style type="text/css">
	body {
		padding: 20px;
	}
	img,i{
	    vertical-align: middle;
	    display: inline-block;
	    height: 100%;
	}
	b{
		vertical-align: bottom;
		display: inline-block;
	    height: 100%;
	}
	ul{
		margin:0;
	}
	.elm{
		color:#359BF5;
	}
	.meituan{
		color:#3ECF8B;
	}
	.baidu{
		color:#FF2D48;
	}
	#breadcrumbs{
		display:none;
	}
	.today{
		width:100%;
		height:auto;
		cursor:default;
		margin:0;
	}
	ul{
		height:100%;
		width:100%;
	}
	.ht200{
		width:100%;
		height:250px;
	}
	.ht33p{
		height: 50px;
		margin-top: 5px;
	}
	.ht33p span:first-child {
		float: left;
	}
	.ht33p span:last-child {
		float: right;
	}
	
	.ht25p{
		height: 30px;
	    border-bottom: 1px solid #ddd;
	    box-sizing: border-box;
	}
	 .ht25p>span:first-child,.ht33p>span:first-child{
		display:inline-block;
		height:100%;
		/* position:absolute;
		left:20px; */
	} 
	 .ht25p>span:last-child,.ht33p>span:last-child{
		display:inline-block;
		height:100%;
		/* position:absolute; */
		/* right:20px; */
	} 
	.wh50p{
		width: 50%;
	    height: 100%;
	    float: left;
	    box-sizing: border-box;
	}
	.wh50p{
		width: 50%;
	    height: 100%;
	    float: left;
	    box-sizing: border-box;
	}
	.wh50p{
		width: 50%;
	    height: 100%;
	    float: left;
	    box-sizing: border-box;
	    text-align:center;
	}
	.wh50p>strong{
		display: block;
	    font-size: 40px;
	}
	.wh50p>span:first-child{
		display: block;
	   /*  height: 20%; */
	}
	.wh50p>span:last-child{
		display: block;
	    height: 20%;
	}
	.wh33p{
		width: 33.33%;
	    height: 100%;
	    float: left;
	    border-right: 1px solid #ddd;
	    box-sizing: border-box;
	    text-align:center;
	}
	
	.wh33p:last-child{
		border-right:0;
	}
	.wh33p>strong{
	    display: block;
	    font-size: 40px;
	     height: 60%;
	    overflow:hidden;
	}
	.wh33p>span{
		display:block;
	}
	.today_item{
	    display: inline-block;
	    float: left;
	    height: 100%;
	    padding: 0 0 20px 0;
	    box-sizing: border-box;
	}
	.today_item:first-child{
		width:60%;
		 padding: 0 20px 20px 0;
	}
	.today_item:last-child{
		width:40%;
	}
	.today_item>div{
		background-color:#fff;
		width:100%;
	}
	.today_item>.today_item_title{
		/* height:20%; */
		height: 40px;
		line-height: 40px;
	    border-bottom: 2px #eee solid;
	    /* position:relative; */
	    font-size:14px;
	}
	.today_item>.today_item_data{
    	height: 80%;
	    padding: 20px;
	    box-sizing: border-box;
	}
	.today_item_title>span{
		display:inline-block;
		height:100%;
		margin-left: 10px;
	}
	.today_item_title>a{
		display:inline-block;
		text-decoration: underline;
		margin-right: 10px;
		float: right;
		color:#999;
	}
	.today_item_title>a:hover {
		color: #F47115;
	}
	.todayRank ul li {
		height: 35px;
		border-bottom: 1px solid #eee; 
	}
	.todayRank ul li span {
		line-height: 35px;
		display: block;
	}
	.todayRank ul li span:first-child {
		float: left;
	}
	.todayRank ul li span:last-child {
		float: right;
	}
	
</style>
</head>
<body onselect="return false;">
	<ul class="today">
		<li class="ht200">
			<div class="today_item todayAll">
				<div class="today_item_title">
					<span><img>今日总览</span>
					<a href="javascript:0" 
					onclick='parent.setIframePage("数据分析","${ctx}/staticAnalysis/toAllStatic.do","z${menu.id}","lm${menu.id}");'
					>数据中心<img></a>
				</div>
				<div class="today_item_data">
					<ul>
						<li class="wh50p">
							<span><b></b>订单成交数量</span>
							<strong style="color: rgb(238, 114, 26)">304568</strong>
							<span>昨日293784单</span>
						</li>
						<li class="wh50p">
							<span><b></b>成交金额</span>
							<strong style="color: rgb(237, 121, 122)">4342785.00</strong>
							<span>昨日39487.00</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="today_item todayRank">
				<div class="today_item_title">
					<span><img>今日商家排名</span>
				</div>
				<div class="today_item_data">
					<ul>
						<li >
							<span>肯德基</span>
							<span>2006单</span>
						</li>
						<li >
							<span>旗鼓村米线</span>
							<span>1890单</span>
						</li>
						<li >
							<span>兰州拉面</span>
							<span>1708单</span>
						</li>
						<li >
							<span>福建沙县小吃</span>
							<span>1308单</span>
						</li>
					</ul>
				</div>
			</div>
		</li>
		<li class="ht200">
			<div class="today_item todayOrder">
				<div class="today_item_title">
					<span><img>平台交易订单数量</span>
				</div>
				<div class="today_item_data">
					<ul>
						<li class="wh33p">
							<strong class="elm"><b></b>203030</strong>
							<span>【饿了么】</span>
						</li>
						<li class="wh33p">
							<strong class="meituan"><b></b>198989</strong>
							<span>【美团外卖】</span>
						</li>
						<li class="wh33p">
							<strong class="baidu"><b></b>1233030</strong>
							<span>【百度外卖】</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="today_item todaySeller">
				<div class="today_item_title">
					<span><img>今日商家数量</span>
					<a href="javascript:0" onclick="">商家数据中心<img></a>
				</div>
				<div class="today_item_data">
					<ul>
						<li class="ht33p">
							<span>商家总数</span>
							<span>13344家</span>
						</li>
						<li class="ht33p">
							<span>商家新增数量</span>
							<span>344家</span>
						</li>
						<li class="ht33p">
							<span>商家退出数量</span>
							<span>4家</span>
						</li>
					</ul>
				</div>
			</div>
		</li>
	</ul>
	<script type="text/javascript">
	//修改密码弹出框
	var edit_password_iframe_dialog;
	$(document)
	.ready(function(){
		//获取父框架修改密码和用户资料按钮
		var _iframe = window.parent;
		var _setPwdBtn =_iframe.document.getElementById('setPwdBtn');
		//修改密码点击事件
		_setPwdBtn.addEventListener("click", function(){
				var url="<m:url value='/userInfo/toEditPassWord.do'/>";
				edit_password_iframe_dialog = new biz.dialog({
					id:$('<div id="addwindow_iframe"></div>').html('<iframe id="iframeAdd" name="iframeAdd" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
					modal: true,
					width: 400,
					height: 240,
					title: "修改密码"
				});
				edit_password_iframe_dialog.open();
		})
	})
	</script>
</body>
</html>

