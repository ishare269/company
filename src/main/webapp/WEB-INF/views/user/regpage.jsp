<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>行业统计-匿名统计</title>
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
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/MD5.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/util.js"></script>

<style type="text/css">
body {
	min-height: 680px;
	padding-top: 70px;
}

span {
	color: red;
}
</style>
</head>

<body>
	<!-- Fixed NAVBAR -->
	<%-- <%@include file="../include/header_profession.jsp"%> --%>
	<!-- /Fixed NAVBAR -->

	<!-- container -->
	<div class="container">
		<div class="jumbotron">
			<p>职业人注册</p>
			<form role="form" id="professionForm">
				<div class="form-group">
					<label>邮箱</label> <input id="uname" name="name" type="email"
						class="form-control" placeholder="请输入邮箱">
				</div>
				<div class="form-group">
					<label>密码</label> <input id="upwd" name="contact" type="password"
						class="form-control" placeholder="请输入密码">
				</div>
				<p>
					<button type="button" onclick="clickUserRegister()"
						class="btn btn-primary btn-lg btn-block">&nbsp;注&nbsp;&nbsp;册&nbsp;</button>
				</p>
				<p id="errorDiv" style="font-size:12px;color:red;"></p>
				<p>
					<label style="display:block;font-size:12px;font-weight:normal;">已有账号？<a
						href="${pageContext.request.contextPath }/user/loginpage">马上登录</a>
					</label>
				</p>
			</form>
		</div>
	</div>
	<!-- /container -->



	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title">激活邮件</h4>
				</div>
				<div class="modal-body">
					<p>正在发送&hellip;</p>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<!-- footer -->
	<%@include file="../include/footer_profession.jsp"%>
	<!-- /footer -->
	<script type="text/javascript">
		/**注册*/
		function clickUserRegister() {
			var uname = $.trim($("#uname").val());
			if (uname.length < 1) {
				$("#errorDiv").text("*请输入用户名");
				$("#uname").focus();
				return;
			}
			if (!validateMail(uname)) {
				$("#errorDiv").text("*请输入正确的邮箱");
				$("#uname").focus();
				return;
			}
			var upwd = $.trim($("#upwd").val());
			if (upwd.length < 1) {
				$("#errorDiv").text("*请输入密码");
				$("#upwd").focus();
				return;
			}
			$('#myModal').modal('show');
			$.ajax({
				url : "${pageContext.request.contextPath}/user/register",
				type : "post",
				dataType : "json",
				data : {
					"username" : uname,
					"password" : getMD5(uname + upwd)
				},
				success : function(data) {
					$('#myModal').modal('hide');
					alert(data.desc);
				}
			});
		}
	</script>
</body>
</html>