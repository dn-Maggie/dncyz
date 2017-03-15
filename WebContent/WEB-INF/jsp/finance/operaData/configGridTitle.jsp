<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<style>
.calcu.checked{
	color: #696969;
    border-color: #f59942;
    background-color: #fff;
    outline: 0;
    }
.readname:hover{
	background-color: #ddd!important;
	cursor: pointer;
	}
</style>
<script type="text/template" id="colModel">
<tr class="trItem">
	<td class="indexId">
		{{index}}
	</td>
	<td class="colName" data-index={{index}}>列名</td>
	<td class="inputTd">
		<input name="{{colName}}" type="text" class="text textlong colname" value="{{colNameValue}}"/>
	</td>
	<td >列值</td>
	<td class="inputTd">
		<input name="{{colValue}}" type="text" class="text textlong readname" value="{{colValueValue}}" readonly/>
		<input name="colindex" type="hidden" class="colindex" value="{{colIndex}}"/>
	</td>
	<td >计算公式</td>
	<td class="inputTd">
		<input name="{{colFormat}}" type="text" class="text textlong calcu" value="{{colFormatValue}}"/>
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
			   .replace('{{colIndex}}', "")
			   .replace('{{colValue}}', "")
			   .replace('{{colValueValue}}', ""))
			   .replace('{{colFormatValue}}',"")
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
	$(".calcu").on('click',function(){
		$(".calcu").trigger("removeCheck");
		$(this).addClass('checked');
	});
	$(".calcu").bind('removeCheck',function(){
		$(this).removeClass('checked');
	});
	$(".readname").on('click',function(){
		var orgval = $(".calcu.checked").val();
		$(".calcu.checked").val(orgval+"+"+$(this).val());
	});
	//绑定提交按钮click事件
	$("#submit").click(function() {
		var jsonArr = [];
		for(var i = 0;i<$(".trItem").size();i++){
			var jsonObj ={
				 label:$(".colname:eq("+i+")").val(),
			     name:$(".readname:eq("+i+")").val(),
			     calcu:$(".calcu:eq("+i+")").val(),
			     index:$(".colindex:eq("+i+")").val(),
			     resizable: true,
			     sortable: true,
			     title: true,
		     }
			jsonArr.push(jsonObj);
		}
		window.parent.loadConfigGrid("platformAccount",jsonArr);
		window.parent.closeConfig();
	});
});
//填充模板数据
function drawHtml(){
	var colModel = window.parent.getColModel();
	var htmlTemp = [];
	for(var i =3;i<colModel.length;i++){
		var trTpl = $("#colModel").html();//获取模板
		htmlTemp.push(trTpl
				   .replace(/{{index}}/g,i-2)
				   .replace('{{colNameValue}}', colModel[i].label)
				   .replace('{{colValueValue}}', colModel[i].name)
				   .replace('{{colIndex}}', colModel[i].index)
				   //.replace('{{colFormatValue}}',typeof(colModel[i].calculate)=='undefined'? colModel[i].name:colModel[i].calculate)
				   .replace('{{colFormatValue}}',colModel[i].formatter())
				)
	}
	$('#colModeltable').prepend(htmlTemp.join(''));
}
</script>
</head>
  
<body>
	<form id="configFormEdit" >
    <div class="ui-table ui-widget ui-corner-all ui-border" >
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
