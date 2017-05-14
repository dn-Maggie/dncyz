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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta name="Keywords" content=""/>
<meta name="Description" content=""/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<link rel="stylesheet" href="<%=request.getContextPath() %>/styles/default/css/index_static.css">

<style type="text/css">
	
</style>
</head>
<body onselect="return false;">
	<div class="search-time">
    	<span>时间搜索</span>
    	<input type="text" placeholder="时间" class="search_time150 date-picker"  style="padding: 6px 12px;border-radius:5px!important;width:200px;" data-date-format="yyyy-mm-dd " id="queryTime">
	</div>
	<ul class="today">
		<li class="ht200">
			<div class="today_item todayAll">
				<div class="today_item_title">
					<span><img>今日总览</span>
				</div>
				<div class="today_item_data">
					<ul>
						<li class="wh50p " >
							<span><b></b>订单成交数量</span>
							<strong class="allNumber" style="color: rgb(238, 114, 26)" id="todayOrderNum"></strong>
							
						</li>
						<li class="wh50p">
							<span><b></b>成交金额</span>
							<strong class="allAmount" style="color: rgb(237, 121, 122)" id="todayOrderAmount"></strong>
						</li>
					</ul>
				</div>
			</div>
			<div class="today_item todayRank">
				<div class="today_item_title">
					<span><img>今日商家排名</span>
				</div>
				<div class="today_item_data">
					<ul id="storeOrderList">
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
							<strong class="elm"><b id="elmOrderNum"></b></strong>
							<span>【饿了么】</span>
						</li>
						<li class="wh33p">
							<strong class="meituan"><b id="mtOrderNum"></b></strong>
							<span>【美团外卖】</span>
						</li>
						<li class="wh33p">
							<strong class="baidu"><b id="bdwmOrderNum"></b></strong>
							<span>【百度外卖】</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="today_item todaySeller">
				<div class="today_item_title">
					<span><img>今日商家数量</span>
				</div>
				<div class="today_item_data">
					<ul id="storeNumList">
					</ul>
				</div>
			</div>
		</li>
	</ul>
	
	
	<div class="orderNum box" style="display: none;">
		<ul class="ulOrderNum">
		</ul>
	</div>	
	<div class="orderAmount box" style="display: none;">
		<ul class="ulOrderAmount">
		</ul>
	</div>
	<style type="text/css">
		.box {
			position: absolute;
			left: 0px;
			z-index: 99999999;
			background: white;
			width: 300px;
			border: 1px solid #ccc;
			padding: 10px;
			box-shadow: 0px 0px 2px #F47115;
		}
		.box li {
			line-height: 20px;
			font-weight: 600;
			color:#666;
		}
		.box span {
			float: right;
		}
	</style>
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
		queryStatic();
	})
	$("#queryTime").on("change",function(){
		queryStatic();
	})
	function queryStatic(){
		var paramData = {
				username:"xifanni",
				password:"123456",
				queryTime:$("#queryTime").val().length>0?$("#queryTime").val():new Date().format("yyyy-MM-dd")
			};
			$.ajax({
	             type: "post",
	             url : "<m:url value='/config/calcuOrderDetail.do'/>",
	             data: JSON.stringify(paramData),
	             cache: false,
	 		   	 dataType:"json",
	 		   	 contentType:false,
	             success: function(data){
	            	 drawStaticData(data);
	             }
	        });
	}
	function drawStaticData(data){
		 $("#todayOrderNum").text(data.successOrderNum);
         $("#todayOrderAmount").text(data.successOrderPrice.toFixed(2));
         $("#elmOrderNum").text(data.elmsuccessOrderNum);
         $("#mtOrderNum").text(data.mtsuccessOrderNum);
         $("#bdwmOrderNum").text(data.bdwmsuccessOrderNum);
         var storeNumList_htmltemp =""
       	 var storeOrderList_htmltemp =""
      	 var _detailDayOrderNum_htmltemp =""
       	 var _detailDayOrderAmount_htmltemp =""
         for(var i=0;i<data.storeNumList.length;i++){
        	 storeNumList_htmltemp +='<li class="ht33p">'
 				+'<span>'+data.storeNumList[i].storeName+'</span>'
 				+'<span>'+data.storeNumList[i].averageSales+'</span>'
 				+'</li>'
         }
         for(var i=0;i<data.storeOrderList.length;i++){
        	 storeOrderList_htmltemp +='<li>'
 				+'<span>'+data.storeOrderList[i].storeName+'</span>'
 				+'<span>'+data.storeOrderList[i].orderNo+'单</span>'
 				+'</li>'
         }
         $("#storeNumList").html(storeNumList_htmltemp);
         $("#storeOrderList").html(storeOrderList_htmltemp);
         
         var orderNumTemp = "";
         var orderAmontTemp  = "";
         for(var i = 0;i<data.result[0].length;i++) {
        	 var _pt = data.result[0][i].platformType;
        	 var store = data.result[0][i].storeName || "未登记店铺";
        	 var platformType = _pt=='mt'?"美团":_pt=='elm'?"饿了么":_pt=='bdwm'?"百度外卖":"未知";
        	 orderNumTemp += '<li>'+ store +'（'+ platformType +'） <span>'+ data.result[0][i].successOrderAmount +'</span></li>';
        	 orderAmontTemp += '<li>'+ store +'（'+ platformType +'） <span>'+ data.result[0][i].successOrderAmount +'</span></li>';
                                 
         }
         $(".ulOrderNum").html(orderNumTemp);
         
    	 $(".ulOrderAmount").html(orderAmontTemp);
	 }
	$orderNum = $('.orderNum');
	$orderAmount = $('.orderAmount');
	$(".allNumber, .allAmount").hover(
		function(){
			$orderNum.show();
			$orderAmount.show();
		},
		function(){
			$orderNum.hide();
			$orderAmount.hide();
		}
	)
	$(".allNumber, .allAmount").mouseenter(function(e) {  
		$orderNum.css({
			top: e.pageY,
			left: e.pageX,
		});
		$orderAmount.css({
			top: e.pageY,
			left: e.pageX,
		})
	});
	</script>
</body>
</html>

