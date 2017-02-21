<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../common/header.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
//离开页面的恢复导航栏方法
function checkLeave(){
	var _iframe = window.parent;
	_iframe.$(".inlineBlock").each(function(){this.className='hidden'})
}
	$(function(){
		//进入页面的展开导航栏搜索方法
		var _iframe = window.parent;
		_iframe.$(".hidden").each(function(){this.className='inlineBlock'})
		
  		gridObj = new biz.grid({
            id:"#remote_rowed",/*html部分table id*/
            url: "<m:url value='/staticAnalysis/bidAnalysis.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
           	sortname:"STORE_ACTIVITY_ID",
           	sortorder:"asc",
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
    		rowNum:10,//默认显示15条
   		  	colModel:[
				{name : "id",hidden : true,key : true,label:"主键",index : "id"},				
				{name : "storename",label:"商户名称",index : "storeName"},				
				{name : "storearea",label:"商圈",index : "storeArea"},				
				{name : "bidtime",label:"竞价时段",index : "bidTime"},				
				{name : "searchtime",label:"查询时间",index : "searchTime"},				
				{name : "bidcycle",label:"竞价周期",index : "bidCycle"},				
				{name : "bidtotalamountinweek",label:"一周内竞价总金额",index : "bidTotalAmountInWeek"},				
				{name : "averageclickcost",label:"平均单次点击费用",index : "averageClickCost"},				
				{name : "bidactivityintensity",label:"竞价期间活动力度",index : "bidActivityIntensity"},				
				{name : "exposureincrementpercent",label:"竞价期间同比周期曝光量增幅",index : "exposureIncrementPercent"},				
				{name : "enterrateincrementpercent",label:"竞价期间同比周期进店率增幅",index : "enterRateIncrementPercent"},				
				{name : "tradeamountincrementpercent",label:"竞价期间同期交易额增幅",index : "tradeAmountIncrementPercent"},				
				{name : "rankbeforebid",label:"竞价前店铺排名",index : "rankBeforeBid"},				
				{name : "rankafterbid",label:"竞价后店铺排名",index : "rankAfterBid"},				
				{name : "contributioninbid",label:"竞价排名贡献值",index : "contributionInBid"}				
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
