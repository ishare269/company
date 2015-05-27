<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>钱管家-首页</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- LOGO -->
<link rel="icon" href="../../favicon.ico">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/bootstrap-3.3.0/css/bootstrap.min.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> -->
<!-- <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/bootstrap-3.3.0/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	min-height: 680px;
	padding-top: 70px;
}
</style>
</head>

<body>
	<!-- Fixed NAVBAR -->
	<%@include file="./include/header.jsp"%>
	<!-- /Fixed NAVBAR -->

	<!-- container -->
	<div class="container">
		<div class="jumbotron">
			<h1>Navbar example</h1>
			<p>This example is a quick exercise to illustrate how the
				default, static and fixed to top navbar work. It includes the
				responsive CSS and HTML, so it also adapts to your viewport and
				device.</p>
			<p>To see the difference between static and fixed top navbars,
				just scroll.</p>
			<p>
				<a class="btn btn-lg btn-primary" href="../../components/#navbar"
					role="button">View navbar docs &raquo;</a>
			</p>
		</div>
	</div>
	<!-- /container -->

	<!-- footer -->
	<%@include file="./include/footer.jsp"%>
	<!-- /footer -->
</body>
</html>
