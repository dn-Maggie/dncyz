<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="<%=request.getContextPath() %>/static/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/font-awesome.min.css" />
<!--[if IE 7]>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- ace styles -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/jquery-ui-1.10.3.custom.min.css" />
<!--[if lte IE 8]>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/ace-ie.min.css" />
<![endif]-->
<!-- inline styles related to this page -->
<!-- ace settings handler -->
<script src="<%=request.getContextPath() %>/static/js/ace-extra.min.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="<%=request.getContextPath() %>/static/js/html5shiv.js"></script>
<script src="<%=request.getContextPath() %>/static/js/respond.min.js"></script>
<![endif]-->

<!-- basic scripts -->
<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery || document.write("<script src='<%=request.getContextPath() %>/static/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=request.getContextPath() %>/static/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='<%=request.getContextPath() %>/static/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="<%=request.getContextPath() %>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/typeahead-bs2.min.js"></script>

<!-- ace scripts -->
<script src="<%=request.getContextPath() %>/static/js/ace-elements.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/ace.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<%=request.getContextPath() %>/static/js/jquery.ui.touch-punch.min.js"></script>