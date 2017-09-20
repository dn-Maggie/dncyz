<%@page import="com.dongnao.workbench.common.util.Utils"%>
<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left" style="color:#fff;cursor:default">
					<!-- a href="#" class="navbar-brand">
					</a><!-- /.brand -->
					<!-- <a href="#" style="float:right;color:#fff">运营中心
					</a> -->
					<img alt="" src="<%=request.getContextPath() %>/styles/images/logo.png" >
					运营中心 
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="system-name" style="color:#fff;font-size:24px;margin-right:50px;">

						</li>
						<li>
							<a data-toggle="dropdown" href="#" class="dropdown-toggle" style="line-height:22.5px;">
								<%-- <img class="nav-user-photo" src="<%=request.getContextPath() %>/styles/images/logo_face.png"  /> --%>
							<!-- 	<span class="user-info"> -->
									<%=Utils.getLoginUser(request)%>
								<!-- </span> -->
								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="javascript:;" id="setPwdBtn">
										<i class="icon-cog"></i>
										修改密码
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										个人资料
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="logout.do">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>