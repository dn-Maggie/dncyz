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
            url: "<m:url value='/storeActivity/listStoreActivity.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
           	sortname:"STORE_ACTIVITY_ID",
           	sortorder:"asc",
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:10,//默认显示15条
            colModel:[
				{name : "storeActivityId",hidden : true,key : true,label:"店铺活动ID(主键)",index : "STORE_ACTIVITY_ID"},				
				{name : "storeId",label:"店铺ID",index : "STORE_ID"},				
				{name : "activityId",label:"活动ID",index : "ACTIVITY_ID"},				
				{name : "activityTimeBegin",label:"活动起始时间",index : "ACTIVITY_TIME_BEGIN"},				
				{name : "activityTimeEnd",label:"活动结束时间",index : "ACTIVITY_TIME_END"},				
				{name : "activityExpectedBudget",label:"活动预算费用",index : "ACTIVITY_EXPECTED_BUDGET"},				
				{name : "activityExpectedReturn",label:"活动预计回报",index : "ACTIVITY_EXPECTED_RETURN"},				
				{name : "activityStatus",label:"活动状态",index : "ACTIVITY_STATUS"},				
				{name : "activityActualProfit",label:"活动实际价值",index : "ACTIVITY_ACTUAL_PROFIT"},				
				{name : "activityExecutor",label:"活动执行人",index : "ACTIVITY_EXECUTOR"},				
				{name : "activityExecuteTime",label:"活动执行时间",index : "ACTIVITY_EXECUTE_TIME"}				
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
    		}
      });
        
	new biz.datepicker({
  			id : "#startDate",
  			maxDate:'#F{$dp.$D(\'endDate\',{d:0});}',
  			dateFmt:'yyyy-MM-dd'
  		});
  	    
  	    new biz.datepicker({
  			id : "#endDate",
  			minDate:'#F{$dp.$D(\'startDate\',{d:0});}',
  			dateFmt:'yyyy-MM-dd'
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
		var url="<m:url value='/storeActivity/toAddStoreActivity.do'/>";
		add_iframe_dialog = new biz.dialog({
			id:$('<div id="addwindow_iframe"></div>').html('<iframe id="iframeAdd" name="iframeAdd" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: $(window).width()*0.6,
			height: $(window).height()*0.8,
			title: "店铺活动增加"
		});
		add_iframe_dialog.open();
  	}
  	
  	//关闭新增页面，供子页面调用
  	function closeAdd(){
		add_iframe_dialog.close();
  	}
  	
    function edit(){
		var key = ICSS.utils.getSelectRowData("storeActivityId");
		if(key.indexOf(",")>-1||key==""){
			showMessage("请选择一条数据！");
			return ;
		}
		var url="<m:url value='/storeActivity/toEditStoreActivity.do'/>?key="+key;
		edit_iframe_dialog = new biz.dialog({
		 	id:$('<div id="editwindow_iframe"></div>').html('<iframe id="iframeEdit" name="iframeEdit" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: $(window).width()*0.6,
			height: $(window).height()*0.8,
			title: "店铺活动编辑"
		});
  		edit_iframe_dialog.open();
    }
    
    //关闭编辑页面，供子页面调用
    function closeEdit(){
    	edit_iframe_dialog.close();
    }
    
    function show(){
    	var key = ICSS.utils.getSelectRowData("storeActivityId");
		if(key.indexOf(",")>-1||key==""){
			showMessage("请选择一条数据！");
			return ;
		}
		var url="<m:url value='/storeActivity/toShowStoreActivity.do'/>?key="+key;
		show_iframe_dialog = new biz.dialog({
		 	id:$('<div id="showwindow_iframe"></div>').html('<iframe id="iframeShow" name="iframeShow" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: $(window).width()*0.6,
			height: $(window).height()*0.8,
				title: "店铺活动详情"
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
    </script>
</head>
<body onbeforeunload="checkLeave()">

	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li><input type="text" name="actorName" id="actorName" class="search_choose"> <span>操作人:</span></li><!-- 输入框-->
				<li class="date_area">
					<span>日期:</span>
					<div class="time_bg">
						<input id="startDate" type="text" class="search_time150" name="propsMap['startDate']" mainid="startDate">
						<i class="search_time_ico2"  onclick="WdatePicker({el:'startDate'})"></i>
					</div>
					<i>至</i>
					<div class="time_bg">
						<input id="endDate" type="text" class="search_time150" name="propsMap['endDate']" mainid="endDate">
						<i class="search_time_ico2"  onclick="WdatePicker({el:'endDate'})"></i>
					</div></li>	
				 <li><select class="search_select" name="actType" id="actType" mainid="actType"><option value="">--请选择--</option><option value="add">add</option><option value="save">save</option><option value="update">update</option><option value="edit">edit</option><option value="insert">insert</option><option value="delete">delete</option><option value="remove">remove</option></select>
				<span>操作类型:</span></li><!--下拉 -->
				<li><input type="text" name="actResult" id="actResult" class="search_choose"> <span>操作结果:</span></li><!-- 输入框-->			
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
							<li><a title="<m:message code="button.add"/>" href="javascript:;"
								onclick="add();"> <i class="icon_bg icon_add"> </i> <span><m:message
											code="button.add" /></span>
							</a></li>
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
						<li><a title="<m:message code="button.view"/>" href="javascript:"
							onclick="show();"> <i class="icon_bg icon_ckxq"></i> <span><m:message
										code="button.view" /></span>
						</a></li>
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
