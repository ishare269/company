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
<link rel="icon" href="..//..favicon.ico">
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
	<!-- container -->
	<div class="container" style="background:#fff;">
		<div class="jumbotron"
			<h3>爱分享到永久</h3>
			<p style="font-size:16px;">即日起，Stone的微信公众号“<strong style="color:blue;">iShare269</strong>”正式启用，启用个人微信公众号，秉承坚持分享、交流的互联网精神，旨在人人都懂互联网！</p>
			<p style="font-size:12px;">爱分享到永久!</p>
			<p style="font-size:12px;">我是石涛，从事IT相关工作！如果你是互联网小白或者是IT精英!</p>
			<p style="font-size:12px;">都可以加我微信：iShare2169,微信公众号：iShare269,QQ:476896460</p>
		</div>
	</div>
	<!-- /container -->
</body>
</html>