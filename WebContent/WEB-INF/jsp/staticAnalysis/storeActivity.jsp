<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../common/header.jsp"%>
<title></title>
<script type="text/javascript">
//离开页面的恢复导航栏方法
function checkLeave(){
	var _iframe = window.parent;
	_iframe.$(".inlineBlock").each(function(){this.className='hidden'})
}
var gridObj = {};
	$(function(){
		//进入页面的展开导航栏搜索方法
		var _iframe = window.parent;
		_iframe.$(".hidden").each(function(){this.className='inlineBlock'})
  		
  		gridObj = new biz.grid({
            id:"#remote_rowed",/*html部分table id*/
            url: "<m:url value='/staticAnalysis/listStoreActivity.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
           	sortname:"STORE_ACTIVITY_ID",
           	sortorder:"asc",
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:10,//默认显示15条
            colModel:[
				/* {name : "storeActivityId",hidden : true,key : true,label:"店铺活动ID(主键)",index : "STORE_ACTIVITY_ID"}, */				
				{name : "storeName",label:"商户名称"},				
				{name : "storeArea",label:"商圈",},				
				{name : "activityType",label:"活动类型",},				
				{name : "activityName",label:"活动名称",},				
				{name : "platformAllowance",label:"平台补贴金额"},				
				{name : "activityIntensity",label:"活动力度",},				
				{name : "activityCycle",label:"活动周期",},				
				{name : "activityTotalCost",label:"该活动总支出",},				
				{name : "activityTotalProfit",label:"共计产生利润"},				
				{name : "profitPercent",label:"利润率"},	
				{name : "enterRateInActivity",label:"活动期间进店率"},
				{name : "conversionRateInActivity",label:"活动期间转化率"},
				{name : "tradeAmountIncrementPercent",label:"活动期间同比上期交易额增幅"},	
				{name : "orderAmountIncrementPercent",label:"活动期间同比上期订单量增幅"},	
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
    		}
      });
        
    });

 

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
    	var ids = ICSS.utils.getSelectRowData("storeActivityId");
    	if(ids==""){
    		showMessage("请至少选择一条数据！");
    		return ;
    	}else{
    		new biz.alert({type:"confirm",message:I18N.msg_del_confirm,title:I18N.promp,callback:function(result){
    			if(result){
    				$ .ajax({
        				url: "<m:url value='/storeActivity/deleteStoreActivity.do'/>?key="+ids,
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
	        	showInfo("数据导入成功",2000);
	        	gridObj.trigger('reloadGrid');
	         }
		 }else{
			showInfo("请选择EXCEL文件！",3000);
	    }
	}
    
 	function ajaxFileUpload(){
 		var options = {
			url : "<m:url value='/staticAnalysis/sactiveimport.do'/>",
			type : "post",
			dataType:"text",
			success : function(d) {gridObj.trigger('reloadGrid');},
			error : function(d) {gridObj.trigger('reloadGrid');},
		};
		// 将options传给ajaxForm
		$('#form').ajaxSubmit(options);
 	}
    </script>
</head>
<body onbeforeunload="checkLeave()">
	<div class="main  choice_box">
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl"><!--功能按钮 div-->
					<ul>
						<c:if test="${add}">
							<li><a title="<m:message code="button.add"/>" href="javascript:;"
								onclick="add();"> <i class="icon_bg icon_add"> </i> <span><m:message
											code="button.add" /></span>
							</a></li>
						</c:if>
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
