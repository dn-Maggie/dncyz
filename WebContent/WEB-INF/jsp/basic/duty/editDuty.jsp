<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<script type="text/javascript">
	$(function() {
		//绑定提交按钮click事件
		$("#submit").click(function() {
			if (!biz.validate("valid", $('#dutyFormEdit')[0])) {
				showWarn("数据验证失败", 3000);
				return;
			}
			var options = {
				url : "<m:url value='/duty/updateDuty.do'/>",
				type : "post",
				success : function(data) {
					var d = $.parseJSON(data);
					showMessage(d.msg, "", "", function() {
						window.parent.closeEdit();
						window.parent.doSearch();
						window.parent.initDutyTree();
					});
				}
			};
			// 将options传给ajaxForm
			$('#dutyFormEdit').ajaxSubmit(options);
		});
		//岗位选类型择
		dutyTypeName = $('#dutyTypeName')
				.TiledCombobox(
						{
							url : "<m:url value='/dictInfo/getDictInfoListByType.do?type=dutyType'/>",
							fieldId : 'dictCode',
							fieldName : 'dictName',
							valueId : '#dutyType',
							multiple : false
						});
		/*编辑表单数据验证*/
		new biz.validate({
			id : "#dutyFormEdit",
			rules : {
				"dutyName" : {
					required : true,
					maxlength : 20
				},
				"dutyTypeName" : {
					required : true
				}
			}
		});
	});
</script>
</head>

<body>

	<div id="editDialog">
		<form id="dutyFormEdit">
			<div class="ui-table ui-widget ui-corner-all ui-border">
				<input type="hidden" id="edit_id" name="id" type="text"
					value="${duty.id}" /> <input id="edit_pid" name="pid" type="hidden"
					class="text" value="${duty.pid}" />
				<table class="table">
					<tr>
						<td class="inputLabelTd">职务名称：</td>
						<td class="inputTd"><input id="dutyName" name="dutyName"
							type="text" class="text" value="${duty.dutyName}" /></td>
						<td class="inputLabelTd">职务级别：</td>
						<td class="inputTd"><select name="dutySort"
							id="edit_dutySort" class="select">
								<option value="1"
									<c:if test="${duty.dutySort eq 1}" >selected</c:if>>集团级</option>
								<option value="2"
									<c:if test="${duty.dutySort eq 2}" >selected</c:if>>省级</option>
								<option value="3"
									<c:if test="${duty.dutySort eq 3}" >selected</c:if>>分公司级</option>
						</select></td>
					</tr>
					<tr>
						<td class="inputLabelTd">职务类型：</td>
						<td class="inputTd"><input id="dutyTypeName"
							name="dutyTypeName" type="text" class="text"
							value="${duty.dutyTypeName}" /> <input id="dutyType"
							name="dutyType" type="hidden" class="text"
							value="${duty.dutyType}" /></td>
						<td class="inputLabelTd">职务描述：</td>
						<td class="inputTd"><input id="edit_dutyDesc" name="dutyDesc"
							type="text" class="text" value="${duty.dutyDesc}" /></td>

					</tr>
					<tr>
						<td class="inputTd" colspan="4" style="text-align: center;">
							<input id="submit" type="button" class="ti_bottom" value="保存" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>