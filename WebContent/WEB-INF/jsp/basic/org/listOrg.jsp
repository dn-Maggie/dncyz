<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<title><m:message code="org.title" /><m:message
		code="title.list" /></title>
<script type="text/javascript">
var gridObj = {};
var parentOrgName;
function getParentOrgName(){
	return parentOrgName;
}
	$(function(){
		initOrgTree();
  		gridObj = new biz.grid({
            id:"#remote_rowed",/*html部分table id*/
            url: "<m:url value='/org/listOrg.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
           	sortname:"ORG_NO",
           	sortorder:"asc",
            /*shrinkToFit:false,*/
           	autowidth:true,
            shrinkToFit:true,
           	//navtype:"top" /*导航栏类型*/,
           	//height: gridHeight,
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:10,//默认显示15条
            colModel:[
				{name : "id",hidden:true,key:true },				
				{name : "orgNo",label:"组织机构编码",index : "ORG_NO"},				
				{name : "orgName",label:"组织机构名称",index : "ORG_NAME"},			
				{name : "orgShortname",label:"单位简称",index : "ORG_SHORT_NAME"},	
				{name : "pinyin",label:"机构拼音码"},					
				{name : "parentOrgName",label:"父级机构",index : "PARENT_ORG_ID"},				
				{name : "addr",label:"地址"},				
				{name : "telephone",label:"电话"},					
				{name : "corpMan",label:"负责人",index : "CORP_MAN"},									
				{name : "created",label:"创建时间"}
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
		        $("#gview_remote_rowed").setGridWidth($(window).width()*0.98);
		   	} 
      });
        
    });

    /**
    * 获取查询条件值
    */
    function getQueryCondition(){
        var obj = {};
        addAttrToObject(obj,"parentOrgId"); 
		addAttrToObject(obj,"orgNo"); 
		addAttrToObject(obj,"orgName"); 
		addAttrToObject(obj,"pinyin"); 
		addAttrToObject(obj,"orgType"); 
		addAttrToObject(obj,"orgClass"); 
		addAttrToObject(obj,"areaProvinceId"); 
		addAttrToObject(obj,"areaRegionId"); 
		addAttrToObject(obj,"areaCityId")
		return obj;
    }

    //新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
   	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;
  	
  	function add(){
  	//xin zeng iframe 弹出框
  	var parentOrgId=$("#parentOrgId").val();
  	if(parentOrgId==null ||parentOrgId==''){
  	 	showMessage("请选择一个上级");
  	 	return;
  	}
		var url="<m:url value='/org/toAddOrg.do'/>?parentOrgId="+parentOrgId;
		add_iframe_dialog = new biz.dialog({
			id:$('<div id="addwindow_iframe"></div>').html('<iframe id="iframeAdd" name="iframeAdd" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 480,
			title: "组织机构增加"
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
		var url="<m:url value='/org/toEditOrg.do'/>?key="+key;
		edit_iframe_dialog = new biz.dialog({
		 	id:$('<div id="editwindow_iframe"></div>').html('<iframe id="iframeEdit" name="iframeEdit" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 480,
			title: "组织机构编辑"
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
		var url="<m:url value='/org/toShowOrg.do'/>?key="+key;
		show_iframe_dialog = new biz.dialog({
		 	id:$('<div id="showwindow_iframe"></div>').html('<iframe id="iframeShow" name="iframeShow" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 480,
				title: "组织机构详情"
		});
  		show_iframe_dialog.open();
    }
    
    //关闭查看页面，供子页面调用
    function closeShow(){
    	show_iframe_dialog.close();
    }
    
    //查询Grid数据
    function doSearch(isStayCurrentPage){
    	if(!isStayCurrentPage)gridObj.setGridParam({"page":"1"});
    	gridObj.trigger('reloadGrid');
    }
    //重置查询表单
    function resetForm(formId){
		document.getElementById(formId).reset();
		$("#"+formId+" input[type='hidden']").val(""); 
		initOrgTree();
		doSearch();
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
        				url: "<m:url value='/org/deleteOrg.do'/>?key="+ids,
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
    
    function initOrgTree() {
		$.ajax({
			url : "<m:url value='/org/initOrgTree.do'/>",
			data : {
				orgName : $('#treeOrgName').val(),
				//orgClass :"1"
			},
			type : "POST",
			dataType:"json",
			success : function(data, textStatus, jqXHR) {
				var setting_checkbox = {
					data:{ },
					id : "#orgTree",
					nodes : data, //数据节点指定     
					view : {
						//addHoverDom : addHoverDom,
						//removeHoverDom : removeHoverDom,
						selectedMulti : false
					},
					edit : {
						//enable : true,
						//editNameSelectAll : true
					},
					data : {
						simpleData : {
							enable : true
						}
					},
					callback : {
						//beforeEditName : beforeEditName,
						//beforeRemove : beforeRemove,
						onClick : treeOnClick
					}
				};
				provinceTree = new biz.tree(setting_checkbox);//创建树 
			}
		});
    }
    function treeOnClick(event, treeId, treeNode){//
//     	if(treeNode.isParent){
//     	$("#apid").val(treeNode.id);
    	$("#parentOrgId").val(treeNode.id);	
    	parentOrgName=treeNode.name;
   		doSearch();
//     	}else{
//     	$("#apid").val(treeNode.pId);
//     	$("#aarid").val(treeNode.id);
//     	doSearch();
//     	}
    }
    </script>
</head>
<body style="height: 100%;">
	<div class="main  choice_box container"
		style="height: 100%; float: left; width: 22%">
		<div class="ui-table ui-widget ui-corner-all ui-margin ui-leftDiv">
			<form id="queryForm1">
				<div id="equal1" class="equal">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="top_table">
						<tr>
							<td class="rightSide">机构名称：</td>
							<td><input type="text" name="treeOrgName" id="treeOrgName"
								class="text " onchange="initOrgTree();" /></td>
						</tr>
					</table>
				</div>
			</form>
			<ul id="orgTree" class="ztree"
				style="height: 350px; margin-top: 0; border-top: 1px solid #ddd; position: relative; overflow: auto; width: 97%"></ul>
		</div>
	</div>
	<div class="main  choice_box">
		<div class="ui-table ui-widget ui-corner-all ui-margin ui-rightDiv"
			style="display: block;">
			<form id="queryForm">
				<!-- 查询区 表单 -->
				<input type="hidden" id="parentOrgId" name="parentOrgId" value="" />
				<div class="search border-bottom">
					<ul>
						<li style="width: 450px; float: left;"><span>关键字:</span> <input
							id="orgNo" type="text" placeholder="机构编码"
							class="search_choose100" value="" name="orgNo" autocomplete="off">
							<input id="orgName" type="text" placeholder="机构名称"
							class="search_choose100" value="" name="orgName"
							autocomplete="off"> <input id="pinyin" type="text"
							placeholder="简拼音" class="search_choose100" value="" name="pinyin"
							autocomplete="off"></li>

						<!-- 			<li class="w200"><span>机构类型:</span><select name="orgType" -->
						<!-- 							id="orgType" class="search_choose100"> -->
						<!-- 							   <option value="">--请选择--</option> -->
						<!-- 								<option value="1">公司</option> -->
						<!-- 								<option value="2">部门</option> -->
						<!-- 						</select></li> -->



						<!-- 			<li class="w200"><span>机构级别:</span>	<select name="orgClass" -->
						<!-- 							id="orgClass" class="search_choose100"> -->
						<!-- 							<option value="">--请选择--</option> -->
						<!-- 							<option value="3">分公司级</option> -->
						<!-- 							<option value="2">省级</option> -->
						<!-- 							<option value="1">集团级</option>		 -->
						<!-- 						</select></li>			 -->
						<li class="w200"><input type="reset" value="重置"
							onClick="resetForm('queryForm')" class="reset_btn">
						<!-- 重置 --> <input type="button" value="查询" onclick="doSearch();"
							class="search_btn mr22 " /></li>
						<!-- 查询-->
					</ul>
				</div>
			</form>
			<!--功能按钮begin-->
			<div class="list_btn_bg fl" style="z-index: 2">
				<!--功能按钮 div-->
				<ul>
					<c:if test="${add}">
						<li><a title="<m:message code="button.add"/>"
							href="javascript:;" onclick="add();"> <i
								class="icon_bg icon_add"> </i> <span><m:message
										code="button.add" /></span>
						</a></li>
					</c:if>
					<c:if test="${edit}">
						<li><a title="<m:message code="button.edit"/>"
							href="javascript:;" onclick="edit();"><i
								class="icon_bg icon_edit"></i> <span><m:message
										code="button.edit" /></span> </a></li>
					</c:if>
					<c:if test="${delete}">
						<li><a title="<m:message code="button.delete"/>"
							href="javascript:;" onclick="batchDelete();"> <i
								class="icon_bg icon_del"></i> <span><m:message
										code="button.delete" /></span>
						</a></li>
					</c:if>
					<li><a title="<m:message code="button.view"/>"
						href="javascript:" onclick="show();"> <i
							class="icon_bg icon_ckxq"></i> <span><m:message
									code="button.view" /></span>
					</a></li>
				</ul>
			</div>
			<!--功能按钮end-->
			<table id="remote_rowed"></table>
			<div id="remote_prowed"></div>
		</div>
	</div>


</body>
</html>
