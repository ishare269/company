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
			<a class="navbar-brand" style="cursor:default;" href="javascript:;">职业人</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li index="1"><a href="${pageContext.request.contextPath }/profession/index">首&nbsp;&nbsp;页</a></li>
<!-- 				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle" -->
<!-- 					data-toggle="dropdown">收&nbsp;&nbsp;入<span class="caret"></span> </a> -->
<!-- 					<ul class="dropdown-menu" role="menu"> -->
<!-- 						<li><a href="${pageContext.request.contextPath }/income/listpage">列&nbsp;&nbsp;表</a></li> -->
<!-- 						<li><a href="${pageContext.request.contextPath }/income/addpage">新&nbsp;&nbsp;增</a></li> -->
<!-- 						<li class="divider"></li> -->
<!-- 						<li><a href="${pageContext.request.contextPath }/income/statisticspage">统&nbsp;&nbsp;计</a></li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
				<li  index="2"><a href="${pageContext.request.contextPath }/profession/myjob">我的发布</a></li>
				<li  index="3"><a href="${pageContext.request.contextPath }/profession/addjobpage">信息统计</a></li>
				<li  index="4"><a href="${pageContext.request.contextPath }/mail/editpage" target="_black">EDM</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${null!=session_user }">
						<li><a href="javascript:void(0);">${session_user.nickname == null?session_user.username:session_user.nickname }</a></li>
						<li><a href="javascript:void(0);" onclick="loginout()">退出</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/user/loginpage">登录</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<!-- /Fixed NAVBAR -->
<script type="text/javascript">
	/**选项卡切换*/
	function checkedActive(index){
		$("#navbar li[index='"+index+"']").addClass("active");
	}
	
	/**退出登录*/
	function loginout(){
		$.ajax({
			url:"${pageContext.request.contextPath}/user/loginout",
			type:"post",
			dataType:"json",
			success:function(data){
				QC.Login.signOut();
				window.location.href="${pageContext.request.contextPath}/user/loginpage";
			}
		});
	}
</script>
