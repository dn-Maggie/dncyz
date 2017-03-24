List = {
	show:function(){
		var key = ICSS.utils.getSelectRowData("id");
		if(key.indexOf(",")>-1||key==""){
			showMessage("请选择一条数据！");
			return ;
		}
		var url="<m:url value='/accountOperateIncome/toShowAccountOperateIncome.do'/>?key="+key;
		show_iframe_dialog = new biz.dialog({
		 	id:$('<div id="showwindow_iframe"></div>').html('<iframe id="iframeShow" name="iframeShow" src="'+url+'" width="100%" frameborder="no" border="0" height="97%"></iframe>'),  
			modal: true,
			width: 800,
			height: 235,
				title: "运营数据详情"
		});
  		show_iframe_dialog.open();
	},
	 /**获取查询条件值*/
	getQueryCondition:function (){
       var obj = {};
		jQuery.each($("#queryForm").serializeArray(),function(i,o){
        	if(o.value){
        		obj[o.name] = o.value;
        	}
        });
		return obj;
    },
	doSearch: function (gridObj){
    	gridObj.setGridParam({"page":"1"});
    	gridObj.trigger('reloadGrid');
    },
    resetForm:  function(formId){
		document.getElementById(formId).reset();
	},
}