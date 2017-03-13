<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<script type="text/template" id="colModel">
<tr class="trItem">
	<td class="indexId">
		{{index}}
	</td>
	<td class="colName" data-index={{index}}>列名</td>
	<td class="inputTd">
		<input name="{{colName}}" type="text" class="text textlong" value="{{colNameValue}}"/>
	</td>
	<td >列值</td>
	<td class="inputTd">
		<input name="{{colValue}}" type="text" class="text textlong" value="{{colValueValue}}" readonly/>
	</td>
	<td >计算公式</td>
	<td class="inputTd">
		<input name="{{colFormat}}" type="text" class="text textlong" value="{{colFormatValue}}"/>
	</td>
	<td>
	<a class="icon_bg icon_add" onclick="addTr()"> </a>
	<a class="icon_bg icon_del" onclick="delTr(this)"> </a>
	</td>
</tr>
</script>

<script type="text/javascript">
//index排序
function orderIndex(){
	for(var i = 0;i<$('.trItem').size();i++){
		$('.indexId:eq('+i+')').html(i+1);
	}
}

//添加行
function addTr(){
	$('.trItem:last').after($("#colModel").html()
			   .replace(/{{index}}/g,Number($(".trItem:last").find('.indexId').html())+1)
			   .replace('{{colName}}', "")
			   .replace('{{colNameValue}}', "")
			   .replace('{{colValue}}', "")
			   .replace('{{colValueValue}}', ""));
	};
	
//删除行
function delTr(Object){
	if($(".trItem").size()>1)
	{$(Object).parents('.trItem').remove();
	orderIndex();}
	else return;
};

$(function() {
	drawHtml();
	//绑定提交按钮click事件
	$("#submit").click(function() {
		$("#submit").prop('disabled', true).css({'cursor':'not-allowed'});showMessage("正在处理...");
		if(!biz.validate("valid",$('#brandFormEdit')[0])){
			showWarn("数据验证失败",3000);
			$("#submit").prop('disabled', false).css({'cursor':'pointer'});
			return;
		}
		var options = {
			url : "<m:url value='/brand/addBrand.do'/>",
			type : "post",
				dataType:"json",
				success : function(d) {
					if(d.status){
						showMessage("操作成功","","",function(){
							window.parent.closeAdd();
				     		window.parent.doSearch();
						});
					}else{
						showMessage("操作失败");
					}
				}
		};
		// 将options传给ajaxForm
		$('#brandFormEdit').ajaxSubmit(options);
	});
});
function drawHtml(){
	var colModel = window.parent.getColModel();
	var htmlTemp = [];
	for(var i = 3;i<colModel.length;i++){
		var trTpl = $("#colModel").html();//获取模板
		htmlTemp.push(trTpl
				   .replace(/{{index}}/g,i-2)
				   .replace('{{colName}}', colModel[i].name)
				   .replace('{{colNameValue}}', colModel[i].label)
				   .replace('{{colValue}}', colModel[i].index)
				   .replace('{{colValueValue}}', colModel[i].name)
				   .replace('{{colFormat}}', colModel[i].name+'Format')
				   .replace('{{colFormatValue}}',typeof(colModel[i].calculate)=='undefined'?"":colModel[i].calculate)
				)
		//填充colModel
		console.log(colModel[i]);
	}
	$('#colModeltable').prepend(htmlTemp.join(''));
}
</script>
</head>
  
<body>
	<form id="brandFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
		<input type="hidden" id="edit_brandId" name="brandId" type="text" value="${brand.brandId}"/>
		<table class="table" id="colModeltable">
			<tr>
				<td class="inputTd" colspan="8" style="text-align:center;">
					<input id="submit" type="button" class="ti_bottom" value="保存"/>
				</td>
			</tr>
		</table>
    </div>
	</form>
</body>
</html>
