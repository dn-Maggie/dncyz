<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/header.jsp"%>
<%@ include file="../../common/ace.jsp"%>
<title></title>
<script type="text/javascript">
var gridObj = {};
	$(function(){
  		gridObj = new biz.grid({
            id:"#remote_rowed",/*html部分table id*/
            url: "<m:url value='/accountOrderDetail/listAllFromOrderDetail.do'/>",/*grid初始化请求数据的远程地址*/
            datatype: "json",/*数据类型，设置为json数据，默认为json*/
           	sortname:"create_date",
           	sortorder:"asc",
           	footerrow:true,
           	emptyrecords: "无记录可显示",
           	pager: '#remote_prowed' /*分页栏id*/,
     		rowList:[10,15,50,100],//每页显示记录数
     		rownumbers:false,
    		rowNum:31,//默认显示15条
            colModel:[
				{name : "storeName",label:"商户名称",index : "store_name"},	
				{name : "createDate",label:"日期",index : "create_date"},				
				{name : "allinvalidNum",label:"无效单",index : "allinvalid_num"},				
				{name : "allvalidNum",label:"有效单",index : "allvalid_num"},			
				{name : "allproductSaleAmount",label:"产品销售金额",index : "allproduct_sale_amount"},				
				{name : "allamountReceivable",label:"应收平台结算金额",index : "allamount_receivable"},				
				{name : "allamountPayable",label:"应付店铺结算金额",index : "allamount_payable"},				
				{name : "allcyzServiceCharge",label:"公司收取店铺服务费",index : "allcyz_service_charge"},				
				{name : "allsaleGrossProfit",label:"毛利",index : "allsale_gross_profit"},			
				{name : "allcyzDistributionCharge",label:"自配送实际支付金额",index : "allcyz_distribution_charge"},
           	],
           	serializeGridData:function(postData){//添加查询条件值
				var obj = getQueryCondition();
    			$ .extend(true,obj,postData);//合并查询条件值与grid的默认传递参数
    			return obj;
    		},
    		gridComplete:function(){
		    	$(".ui-jqgrid-sdiv").show();
		    	$(this).footerData("set",{
		    		"rn":"合计",
		    		"allinvalidNum":$(this).getCol("allinvalidNum",false,"sum"),
		    		"allvalidNum":$(this).getCol("allvalidNum",false,"sum"),
		    		"allproductSaleAmount":$(this).getCol("allproductSaleAmount",false,"sum").toFixed(2),
		    		"allamountReceivable":$(this).getCol("allamountReceivable",false,"sum").toFixed(2),
		    		"allamountPayable":$(this).getCol("allamountPayable",false,"sum").toFixed(2),
		    		"allcyzServiceCharge":$(this).getCol("allcyzServiceCharge",false,"sum").toFixed(2),
		    		"allsaleGrossProfit":$(this).getCol("allsaleGrossProfit",false,"sum").toFixed(2),
		    		"allcyzDistributionCharge":$(this).getCol("allcyzDistributionCharge",false,"sum").toFixed(2)
		    		}); //将合计值显示出来
			}
      });
    });
  	
    //查询Grid数据
    function doSearch(isStayCurrentPage){
    	if(!isStayCurrentPage)gridObj.setGridParam({"page":"1"});
    	gridObj.trigger('reloadGrid');
    	doSearchmt(isStayCurrentPage);
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
    //重置查询表单
    function resetForm(formId){
		document.getElementById(formId).reset();
	}
  //导出运营统计数据
    function exportData(){
    	ExpExcel.showWin(gridObj,baseUrl+"/accountOperateIncome/exportTotalExcel.do",'grid','queryForm');
    }
    </script>
</head>
<body style="height:100%;">
	<div class="main  choice_box">
		<form id="queryForm"><!-- 查询区 表单 -->
			<div class="search border-bottom">
				<ul>
				<li><input type="text" name="storeName" id="storeName" class="search_choose"> <span>店铺名称:</span></li><!-- 输入框-->
				<li>
					<div class="time_bg">
					<input type="text" placeholder="截止日期"  class="search_time150 date-picker" name="propsMap['endDate']" data-date-format="yyyy-mm-dd "><!-- 时间选择控件-->
					<i class="search_time_ico2" ></i>
					</div>
					<div class="time_bg">
					<input type="text" placeholder="起始日期" class="search_time150 date-picker" name="propsMap['startDate']" data-date-format="yyyy-mm-dd "><!-- 时间选择控件-->
					<i class="search_time_ico2" ></i>
					</div>
				</li>
				<li class="date_area">
					<span>创建时间:</span>
						<div class="time_bg">
						<div class="input-group bootstrap-timepicker">
							<input class="timepicker text" name="propsMap['startTime']" type="text" />
						</div>
						</div>
					<i>至</i>
					<div class="time_bg">
						<div class="input-group bootstrap-timepicker">
							<input class="timepicker text" name="propsMap['endTime']" type="text" />
						</div>
					</div>
					</li>	
				<li><select class="search_select" name="platformType" id="platformType"><option value="">---请选择---</option>
				 <option value="elm">饿了么</option><option value="meituan">美团</option>
				</select><span>平台类型:</span></li><!--下拉 -->
				<li><input type="reset" class="reset_btn" onclick="resetForm('queryForm')" value="重置"><!-- 重置 -->
						<input type="button" class="search_btn mr22 " onclick="doSearch();" value="查询"></li><!-- 查询-->
				</ul>
		   </div>
	    </form>
		<div class="listplace">
				<!--功能按钮begin-->
				<div class="list_btn_bg fl" ><!--功能按钮 div-->
					<ul>
						<c:if test="${manage}">
						<li><a title="<m:message code="button.module.moduleRes"/>" href="javascript:"
							onclick="moduleResMgt();"> <i class="back_icon resources_icon"></i> <span><m:message
										code="button.module.moduleRes" /></span>
						</a></li>
						</c:if>
						<c:if test="${exportData}">
						<li>
							<a title="导出数据" href="javascript:;" onclick="exportData();"> 
								<i class="back_icon import_icon"> </i> 
								<span>导出数据</span>
							</a>
						</li>
						</c:if>
					</ul>
				</div>
	
			<!--功能按钮end-->
				<div class="listtable_box" >
					<!--此处放表格-->
						<table  id="remote_rowed" ></table>
						<div  id="remote_prowed"></div>	
				</div>
		</div>
	</div>
</body>
</html>
