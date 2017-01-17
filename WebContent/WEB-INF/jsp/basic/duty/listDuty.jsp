<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<title>岗位管理</title>
<script type="text/javascript">
	var gridObj = {},dutyTypeNameBox;
	$(function() {
		initDutyTree();
		//岗位选类型择
// 		dutyTypeNameBox = $('#dutyTypeName')
// 				.TiledCombobox(
// 						{
// 							url : "<m:url value='/dictInfo/getDictInfoListByType.do?type=dutyType'/>",
// 							fieldId : 'dictCode',
// 							fieldName : 'dictName',
// 							valueId : '#dutyType',
// 							multiple : false
// 						});
		gridObj = new biz.grid({
			id : "#remote_rowed",/*html部分table id*/
			url : "<m:url value='/duty/listDuty.do'/>",/*grid初始化请求数据的远程地址*/
			datatype : "json",/*数据类型，设置为json数据，默认为json*/
			sortname : "t.duty_Type",
			sortorder : "asc",
			//navtype:"top" /*导航栏类型*/,
			//height: gridHeight,
			pager : '#remote_prowed' /*分页栏id*/,
			rowList : [ 10, 20, 30, 50],//每页显示记录数
			rowNum : 10,//默认显示15条
			colModel : [ {
				name : "id",
				label : "主键ID",
				hidden : true
			},{
				name : "dutyName",
				index : "t.duty_name",
				label : "岗位名称"
			}, {
				name : "dutyTypeName",
				index : "t.duty_Type",
				label : "岗位类型"
			}, {
				name : "dutySort",
				label : "岗位级别",
				index : "t.duty_sort",
				formatter:GridColModelForMatter.dutySort
			}, {
				name : "dutyDesc",
				index : "t.duty_desc",
				label : "岗位描述"
			}],
			serializeGridData : function(postData) {//添加查询条件值
				var obj = getQueryCondition();
				$.extend(true, obj, postData);//合并查询条件值与grid的默认传递参数
				return obj;
			}
		});

	});

	/**
	 * 获取查询条件值
	 */
	function getQueryCondition() {
		var obj = {};
		addAttrToObject(obj, "pid");
		addAttrToObject(obj, "dutyName");
		addAttrToObject(obj, "dutySort");
		addAttrToObject(obj, "dutyType");
		return obj;
	}


	//新增的弹出框
	var add_iframe_dialog;
	//修改的弹出框
	var edit_iframe_dialog;
	//查看的弹出框
	var show_iframe_dialog;

	function add() {

		var url = "<m:url value='/duty/toAddDuty.do'/>?pid="+$('#pid').val();
		add_iframe_dialog = new biz.dialog(
				{
					id : $('<div id="addwindow_iframe"></div>')
							.html(
									'<iframe id="iframeAdd" name="iframeAdd" src="'
											+ url
											+ '" width="100%" frameborder="no" border="0" height="97%"></iframe>'),
					modal : true,
					width : 600,
					height : 235,
					title : "岗位信息增加"
				});
		add_iframe_dialog.open();
	}

	//关闭新增页面，供子页面调用
	function closeAdd() {
		add_iframe_dialog.close();
	}

	function edit() {
		var key = ICSS.utils.getSelectRowData("id");
		if (key.indexOf(",") > -1 || key == "") {
			showMessage("请选择一条数据！");
			return;
		}
		var url = "<m:url value='/duty/toEditDuty.do'/>?key=" + key;
		edit_iframe_dialog = new biz.dialog(
				{
					id : $('<div id="editwindow_iframe"></div>')
							.html(
									'<iframe id="iframeEdit" name="iframeEdit" src="'
											+ url
											+ '" width="100%" frameborder="no" border="0" height="97%"></iframe>'),
					modal : true,
					width : 600,
					height : 235,
					title : "岗位信息编辑"
				});
		edit_iframe_dialog.open();
	}

	//关闭编辑页面，供子页面调用
	function closeEdit() {
		edit_iframe_dialog.close();
	}

	function show() {
		var key = ICSS.utils.getSelectRowData("id");
		if (key.indexOf(",") > -1 || key == "") {
			showMessage("请选择一条数据！");
			return;
		}
		var url = "<m:url value='/duty/toShowDuty.do'/>?key=" + key;
		show_iframe_dialog = new biz.dialog(
				{
					id : $('<div id="showwindow_iframe"></div>')
							.html(
									'<iframe id="iframeShow" name="iframeShow" src="'
											+ url
											+ '" width="100%" frameborder="no" border="0" height="97%"></iframe>'),
					modal : true,
					width : 600,
					height : 235,
					title : "岗位信息详情"
				});
		show_iframe_dialog.open();
	}

	//关闭查看页面，供子页面调用
	function closeShow() {
		show_iframe_dialog.close();
	}

	//查询Grid数据
	function doSearch(isStayCurrentPage) {
		if (!isStayCurrentPage)
			gridObj.setGridParam({
				"page" : "1"
			});
		gridObj.trigger('reloadGrid');
	}
	//重置查询表单
	function resetForm(formId) {
		document.getElementById(formId).reset();
		$("#"+formId+" input[type='hidden']").val("");
		dutyTypeNameBox.clearVlaue();
		initDutyTree();
		doSearch();
	}

	//删除
	function batchDelete() {
		var ids = ICSS.utils.getSelectRowData("id");
		if (ids == "") {
			showMessage("请至少选择一条数据！");
			return;
		} else {
			new biz.alert({
				type : "confirm",
				message : I18N.msg_del_confirm,
				title : I18N.promp,
				callback : function(result) {
					if (result) {
						$.ajax({
							url : "<m:url value='/duty/deleteDuty.do'/>?key="
									+ ids,
							cache : false,
							success : function(data, textStatus, jqXHR) {
								doSearch();
								showInfo("删除成功", 3000);
							}
						});
					}
				}
			});
		}
	}

	function initDutyTree() {
		$.ajax({
			url : "<m:url value='/duty/initDutyTree.do'/>",
			data : {
			//regionName : $('#regionName').val(),
			//provinceName : $('#provinceName').val()
			},
			type : "POST",
			success : function(data, textStatus, jqXHR) {
				var setting_checkbox = {
					data : {},
					id : "#dutyTree",
					nodes : $.parseJSON(data), //数据节点指定     
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
	function treeOnClick(event, treeId, treeNode) {//
		$("#pid").val(treeNode.id);
		doSearch();
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
							<td class="rightSide">岗位名称：</td>
							<td><input type="text" name="dutyName1" id="dutyName1"
								class="text " onkeyup="search_ztree('dutyTree','name',this);" /></td>

						</tr>
					</table>
				</div>
			</form>
			<ul id="dutyTree" class="ztree"
				style="height: 100%; border-top: 1px solid #ddd; position: relative; overflow: auto; width: 97%"></ul>
		</div>
	</div>
	<div class="main  choice_box">
		<div class="ui-table ui-widget ui-corner-all ui-margin ui-rightDiv"
			style="display: block;">
			<form id="queryForm">
				<!-- 查询区 表单 -->
				<input type="hidden" id="pid" name="pid" />
				<div class="search border-bottom">
					<ul>
						<li class="w200"><span>岗位名称：</span><input type="text"
							class="search_choose100" id="dutyName" name="dutyName"></li>
						<li class="w200"><span>岗位类型：</span> <input id="dutyTypeName"
							name="dutyTypeName" type="text" class="search_choose100"
							value="${duty.dutyTypeName}" /> <input id="dutyType"
							name="dutyType" type="hidden" class="text"
							value="${duty.dutyType}" /></li>
						<!-- 						<li class="w200"><span>岗位级别：</span> <select -->
						<!-- 							name="dutySort" id="dutySort" class="search_choose100"> -->
						<!-- 							   <option value="">--请选择--</option> -->
						<!-- 								<option value="1">集团级</option> -->
						<!-- 								<option value="2">省级</option> -->
						<!-- 								<option value="3">分公司级</option> -->
						<!-- 						</select></li> -->

						<!-- 输入框-->

						<li class="w200"><input type="reset" value="重置"
							onClick="resetForm('queryForm')" class="reset_btn"> <!-- 重置 -->
							<input type="button" value="查询" onclick="doSearch();"
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
