<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="en">
	<head>
		<%@ include file="../common/ace.jsp"%>
		<style type="text/css">
			.platform_totalMoney_item{
				background-color:#fff;
				height:200px;
			}
			.platform_totalMoney_item{
				background-color:#fff;
				height:200px;
			}
			.platform_totalMoney_item-Name{
				display:block;
				height:30%;
				padding: 10px;
			}
			.platform_totalMoney_item-todayValue{
				display:block;
				height:30%;
				text-align:center;
				font-size:40px;
			}
			.platform_totalMoney_item-yesterdayValue{
				display:block;
				height:30%;
				text-align:center;
			}
		</style>
		
		<!-- page specific plugin scripts -->
		<!--[if lte IE 8]>
		  <script src="<%=request.getContextPath() %>/static/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="<%=request.getContextPath() %>/static/js/jquery.slimscroll.min.js"></script>
		<script src="<%=request.getContextPath() %>/static/js/jquery.easy-pie-chart.min.js"></script>
		<script src="<%=request.getContextPath() %>/static/js/jquery.sparkline.min.js"></script>
		<script src="<%=request.getContextPath() %>/static/js/flot/jquery.flot.min.js"></script>
		<script src="<%=request.getContextPath() %>/static/js/flot/jquery.flot.pie.min.js"></script>
		<script src="<%=request.getContextPath() %>/static/js/flot/jquery.flot.resize.min.js"></script>
	</head>
	<body>
		<div class="col-sm-12">
			<div class="widget-box transparent">
				<div class="widget-header widget-header-flat">
					<h4 class="lighter" style="color:#555">
						<i class="icon-signal"></i>
						营业额趋势图
					</h4>
					<div class="widget-toolbar">
						<a href="#" data-action="collapse">
							<i class="icon-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="widget-body">
					<div class="widget-main padding-4">
						<div id="sales-charts"></div>
					</div><!-- /widget-main -->
				</div><!-- /widget-body -->
			</div><!-- /widget-box -->
		</div>
		<div class="col-sm-12">
			<div class="widget-box transparent">
				<div class="widget-header widget-header-flat">
					<h4 class="lighter" style="color:#555">
						<i class="icon-eye-open"></i>
						三大平台营业额总览
					</h4>
				</div>
				<div class="widget-body">
					<div class="col-sm-4 platform_totalMoney">
						<div class="platform_totalMoney_item">
							<span class="platform_totalMoney_item-Name">美团外卖</span>
							<strong class="platform_totalMoney_item-todayValue">8909.00</strong>
							<span class="platform_totalMoney_item-yesterdayValue">昨日  ￥7890.00</span>
						</div>
					</div>
					<div class="col-sm-4 platform_totalMoney">
						<div class="platform_totalMoney_item">
							<span class="platform_totalMoney_item-Name">饿了么外卖</span>
							<strong class="platform_totalMoney_item-todayValue">7099.00</strong>
							<span class="platform_totalMoney_item-yesterdayValue">昨日  ￥7090.00</span>
						</div>
					</div>
					<div class="col-sm-4 platform_totalMoney">
						<div class="platform_totalMoney_item">
							<span class="platform_totalMoney_item-Name">百度外卖</span>
							<strong class="platform_totalMoney_item-todayValue">7309.00</strong>
							<span class="platform_totalMoney_item-yesterdayValue">昨日  ￥6890.00</span>
						</div>
					</div>
				</div><!-- /widget-body -->
			</div><!-- /widget-box -->
			
		</div>		
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html', {
						tagValuesAttribute:'data-values',
						type: 'bar',
						barColor: barColor ,
						chartRangeMin:$(this).data('min') || 0} 
					);
				});
				var d1 = [];
				for (var i = 0; i < 12; i ++) {
					d1.push([i, Math.round(Math.random()*100)]);
				}
				var d2 = [];
				for (var i = 0; i < 12; i ++) {
					d2.push([i, Math.round(Math.random()*100)]);
				}
				var d3 = [];
				for (var i = 0; i < 12; i ++) {
					d3.push([i, Math.round(Math.random()*100)]);
				}
				var d4 = [];
				for (var i = 0; i < 12; i ++) {
					d4.push([i, Math.round(Math.random()*100)]);
				}
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'450px'});
				$.plot("#sales-charts", [
					{ label: "总营业额", data: d1 },
					{ label: "美团外卖营业额", data: d2 },
					{ label: "百度外卖营业额", data: d4 },
					{ label: "饿了么外卖营业额", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 5,
						min: 0,
						max: 120,
						tickDecimals: 2
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 0,
						borderColor:'#555'
					}
				});
			
			})
		</script>
	</body>
</html>

