<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- Fixed NAVBAR -->
<div style="height:20px;" class="">
	
</div>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/main">QGJ</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath }/main">首&nbsp;&nbsp;页</a></li>
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"
					data-toggle="dropdown">收&nbsp;&nbsp;入<span class="caret"></span> </a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${pageContext.request.contextPath }/income/listpage">列&nbsp;&nbsp;表</a></li>
						<li><a href="${pageContext.request.contextPath }/income/addpage">新&nbsp;&nbsp;增</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath }/income/statisticspage">统&nbsp;&nbsp;计</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">支&nbsp;&nbsp;出<span class="caret"></span> </a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${pageContext.request.contextPath }/expend/listpage">列&nbsp;&nbsp;表</a></li>
						<li><a href="${pageContext.request.contextPath }/expend/addpage">新&nbsp;&nbsp;增</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath }/expend/statisticspage">统&nbsp;&nbsp;计</a></li>
					</ul>
				</li>
				<li><a href="${pageContext.request.contextPath }/type/typepage">类&nbsp;&nbsp;型</a></li>
				<li><a href="${pageContext.request.contextPath }/user/exit">退&nbsp;&nbsp;出</a></li>
			</ul>
<!-- 			<ul class="nav navbar-nav navbar-right"> -->
<!-- 				<li><a href="../navbar/">Default</a></li> -->
<!-- 				<li><a href="../navbar-static-top/">Static top</a></li> -->
<!-- 				<li class="active"><a href="./">Fixed top</a></li> -->
<!-- 			</ul> -->
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<!-- /Fixed NAVBAR -->
