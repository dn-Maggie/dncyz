<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML  >
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
	$(function(){
  		gridObj = new biz.grid({
            id:"#remote_rowed",/*html部分table id*/
            url: "<m:url value='/accountOrderDetail/listAccountOrderDetail.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
           	sortname:"id",
           	sortorder:"asc",
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:10,//默认显示15条
            colModel:[
				{name : "id",hidden : true,key : true,label:"账单ID",index : "id"},				
				{name : "createDate",label:"创建日期",index : "create_date"},				
				{name : "storeId",label:"商户id",index : "store_id"},			
				{name : "storeName",label:"商户名称",index : "store_name"},			
				{name : "checkNo",label:"账单编号",index : "check_no"},				
				{name : "orderType",label:"订单类型",index : "order_type"},				
				{name : "orderTime",label:"订单创建时间",index : "order_time"},				
				{name : "overTime",label:"订单完成时间",index : "over_time"},				
				{name : "orderIndex",label:"接单序号",index : "order_index"},				
				{name : "orderNo",label:"订单号",index : "order_no"},				
				{name : "prices",label:"菜价",index : "prices"},				
				{name : "mealFee",label:"餐盒费",index : "meal_fee"},				
				{name : "giftAllowance",label:"赠品补贴",index : "gift_allowance"},				
				{name : "activitiesSubsidies",label:"商户承担活动补贴",index : "activities_subsidies"},				
				{name : "subsidyVouchers",label:"商户承担代金券补贴",index : "subsidy_vouchers"},				
				{name : "merchantCharge",label:"商户收取配送费",index : "merchant_charge"},				
				{name : "serviceRate",label:"服务费费率",index : "service_rate"},				
				{name : "serviceCharge",label:"服务费",index : "service_charge"},				
				{name : "refundAmount",label:"用户申请退单金额",index : "refund_amount"},				
				{name : "settlementAmount",label:"结算金额",index : "settlement_amount"},				
				{name : "distributionMode",label:"配送方式",index : "distribution_mode"},				
				{name : "remark",label:"备注",index : "remark"},				
				{name : "elmActivitiesSubsidies",label:"饿了么承担活动补贴",index : "elm_activities_subsidies"},				
				{name : "elmSubsidyVouchers",label:"饿了么承担代金券补贴",index : "elm_subsidy_vouchers"}				
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
    		}
      });
        
    });

 

    //新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
   	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
  	
  	function add(){
  	//xin zeng iframe 弹出框
		var url="<m:url value='/accountOrderDetail/toAddAccountOrderDetail.do'/>";
		add_iframe_dialog = new biz.dialog({
			id:$('<div id="addwindow_iframe"></div>').html('<iframe id="iframeAdd" name="iframeAdd" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 235,
			title: "订单明细增加"
		});
		add_iframe_dialog.open();
  	}
  	
  	//关闭新增页面，供子页面调用
  	function closeAdd(){
		add_iframe_dialog.close();
  	}
  	
    function edit(){
		var key = ICSS.utils.getSelectRowData("id");
		if(key.indexOf(",")>-1||key==""){
			showMessage("请选择一条数据！");
			return ;
		}
		var url="<m:url value='/accountOrderDetail/toEditAccountOrderDetail.do'/>?key="+key;
		edit_iframe_dialog = new biz.dialog({
		 	id:$('<div id="editwindow_iframe"></div>').html('<iframe id="iframeEdit" name="iframeEdit" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 235,
			title: "订单明细编辑"
		});
  		edit_iframe_dialog.open();
    }
    
    //关闭编辑页面，供子页面调用
    function closeEdit(){
    	edit_iframe_dialog.close();
    }
    
    function show(){
    	var key = ICSS.utils.getSelectRowData("id");
		if(key.indexOf(",")>-1||key==""){
			showMessage("请选择一条数据！");
			return ;
		}
		var url="<m:url value='/accountOrderDetail/toShowAccountOrderDetail.do'/>?key="+key;
		show_iframe_dialog = new biz.dialog({
		 	id:$('<div id="showwindow_iframe"></div>').html('<iframe id="iframeShow" name="iframeShow" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 235,
				title: "订单明细详情"
		});
  		show_iframe_dialog.open();
    }
    
    //关闭查看页面，供子页面调用
    function closeShow(){
    	show_iframe_dialog.close();
    }
    /**
    * 获取查询条件值
    */
    function getQueryCondition(){
       var obj = {};
		jQuery.each($("#queryForm").serializeArray(),function(i,o){
        	if(o.value){
        		obj[o.name] = o.value;
        	}
        });
		return obj;
    }
    //查询Grid数据
    function doSearch(isStayCurrentPage){
    	if(!isStayCurrentPage)gridObj.setGridParam({"page":"1"});
    	gridObj.trigger('reloadGrid');
    }
    //重置查询表单
    function resetForm(formId){
		document.getElementById(formId).reset();
	}
    
    //删除
    function batchDelete(){
    	var ids = ICSS.utils.getSelectRowData("id");
    	if(ids==""){
    		showMessage("请至少选择一条数据！");
    		return ;
    	}else{
    		new biz.alert({type:"confirm",message:I18N.msg_del_confirm,title:I18N.promp,callback:function(result){
    			if(result){
    				$ .ajax({
        				url: "<m:url value='/accountOrderDetail/deleteAccountOrderDetail.do'/>?key="+ids,
        				cache:false,
        				success: function(data, textStatus, jqXHR){
        					doSearch();
    						showInfo("删除成功",3000);
        				}
        			});
    			}
    		}}) ;   
    	}
    }
    //导入excel数据
	function importData(){
		 if($('input[type="file"]').val()!=""){
			var extend=$('input[type="file"]').val().substr($('input[type="file"]').val().lastIndexOf(".")+1);
			if("xls|xlsx".indexOf(extend)==-1){//在字符串中xls|xlsx寻找后缀xls或者xlsx，有的话返回下标，没有就返回-1
				 showInfo("选择的文件必须是EXCEL文件,请确认！",3000);
	         }else{
	        	ajaxFileUpload();
	        	gridObj.trigger('reloadGrid');
	         }
		 }else{
			showInfo("请选择EXCEL文件！",3000);
	    }
	}
    
 	function ajaxFileUpload(){
 		var options = {
			url : "<m:url value='/accountOrderDetail/orderDetailImport.do'/>",
			type : "post",
			dataType:"text",
			success : function(d) {
				if(d&&d.dataSize){showMessage(d.msg+"导入"+d.dataSize+"条数据",2000);}
				gridObj.trigger('reloadGrid');
			},
			error : function(d) {
				showInfo(d.msg);
				gridObj.trigger('reloadGrid');},
		};
		// 将options传给ajaxForm
		$('#form').ajaxSubmit(options);
 	}
    </script>
</head>
<body style="height:100%;">

	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li><span>关键字：</span><input type="text" name="actorName" id="actorName" class="search_choose" placeholder="商户名称"></li><!-- 输入框-->
				<li><span>日期:</span>
						<div class="time_bg">
						<input type="text" class="search_time150" name="actTime" id="actTime" mainid="actTime"><!-- 时间选择控件-->
						<i class="search_time_ico2" ></i>
						</div></li>
				<li class="date_area">
					<span>创建时间:</span>
					<div class="time_bg">
						<input id="startDate" type="text" class="search_time150" name="propsMap['startDate']" mainid="startDate">
						<i class="search_time_ico2"  onclick="WdatePicker({el:'startDate'})"></i>
					</div>
					<i>至</i>
					<div class="time_bg">
						<input id="endDate" type="text" class="search_time150" name="propsMap['endDate']" mainid="endDate">
						<i class="search_time_ico2"  onclick="WdatePicker({el:'endDate'})"></i>
					</div></li>	
				 <li><select class="search_select" name="actType" id="actType"><option value="">---请选择---</option></select>
				<span>订单类型:</span></li><!--下拉 -->
				 <li><select class="search_select" name="actType" id="actType"><option value="">---请选择---</option></select>
				<span>配送方式:</span></li><!--下拉 -->
				<li><input type="reset" class="reset_btn" onclick="resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="doSearch();" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<c:if test="${add}">
							<%-- <li><a title="<m:message code="button.add"/>" href="javascript:;"
								onclick="add();"> <i class="icon_bg icon_add"> </i> <span><m:message
											code="button.add" /></span>
							</a></li> --%>
							<li>
								<a title="导入数据" href="javascript:;" onclick="$('#file').click()"> 
									<i class="back_icon import_icon"> </i> 
									<span>导入数据</span>
								</a>
								<form name="form" id="form" method="post"  enctype="multipart/form-data">
									<input type="file" id="file" name="file" style="display: none" onchange="importData();"/>
								</form>
							</li>
							<li>
								<a title="导出数据" href="javascript:;" onclick=""> 
									<i class="back_icon import_icon"> </i> 
									<span>导出数据</span>
								</a>
							</li>
						</c:if>
						<c:if test="${edit}">
							<li><a title="<m:message code="button.edit"/>" href="javascript:;"
								onclick="edit();"><i class="icon_bg icon_edit"></i> <span><m:message
											code="button.edit" /></span> </a></li>
						</c:if>
						<c:if test="${delete}">
							<li><a title="<m:message code="button.delete"/>" href="javascript:;"
								onclick="batchDelete();"> <i class="icon_bg icon_del"></i> <span><m:message
											code="button.delete" /></span>
							</a></li>
						</c:if>
						<%-- <li><a title="<m:message code="button.view"/>" href="javascript:"
							onclick="show();"> <i class="icon_bg icon_ckxq"></i> <span><m:message
										code="button.view" /></span> --%>
						</a></li><li><a title="下载模板" href="javascript:"
							onclick="download();"> <i class="icon_bg icon_download"></i> <span>下载模板</span>
						</a></li>
						<c:if test="${manage}">
						<li><a title="<m:message code="button.module.moduleRes"/>" href="javascript:"
							onclick="moduleResMgt();"> <i class="back_icon resources_icon"></i> <span><m:message
										code="button.module.moduleRes" /></span>
						</a></li>
						</c:if>
					</ul>
				</div>
	
				<!--功能按钮end-->
				<div class="listtable_box">
					<!--此处放表格-->
				<table  id="remote_rowed" ></table>
				<div  id="remote_prowed"></div>		
				</div>
		</div>
	</div>
</body>
</html>
