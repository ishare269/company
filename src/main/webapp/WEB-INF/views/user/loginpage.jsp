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
<title>职业人-登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Stone">
<meta property="qc:admins" content="4320313177613012526163757" />
<!-- LOGO -->
<link rel="icon" href="../../favicon.ico">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/bootstrap-3.3.0/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/MD5.js"></script>
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
			<p>登录</p>
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
					<button type="button" onclick="clickSubmitLogin()"
						class="btn btn-primary btn-lg btn-block">&nbsp;登&nbsp;&nbsp;录&nbsp;</button>
				</p>
				<p id="errorDiv" style="font-size:12px;color:red;"></p>
				<p>
					<label style="display:block;font-size:12px;font-weight:normal;">还没有账号？<a
						href="${pageContext.request.contextPath }/user/regpage">马上注册</a>
					</label>
				</p>
				<p>
					<label style="display:block;font-size:12px;">第三方登陆：</label> <span
						id="qqLoginBtn"></span>
					<script type="text/javascript">
						QC.Login({
							btnId : "qqLoginBtn" //插入按钮的节点id
						});
					</script>


				</p>
			</form>
		</div>
	</div>
	<!-- /container -->

	<!-- footer -->
	<%@include file="../include/footer_profession.jsp"%>
	<!-- /footer -->
	<script type="text/javascript">
		//从页面收集OpenAPI必要的参数。get_user_info不需要输入参数，因此paras中没有参数
		var paras = {};

		//用JS SDK调用OpenAPI
		QC.api("get_user_info", paras)
		//指定接口访问成功的接收函数，s为成功返回Response对象
		.success(function(s) {
			//成功回调，通过s.data获取OpenAPI的返回数据
			if (QC.Login.check()) {//如果已登录  
				QC.Login.getMe(function(openId, accessToken) {
					qqOauthLogin(openId, s.data);
				});
				//这里可以调用自己的保存接口  
				//保存或更新用户

			}
		})
		//指定接口访问失败的接收函数，f为失败返回Response对象
		.error(function(f) {
			//失败回调
			alert("获取用户信息失败！");
		})
		//指定接口完成请求后的接收函数，c为完成请求返回Response对象
		.complete(function(c) {
			//完成请求回调
			//alert("获取用户信息完成！");
		});

		/**QQ授权登录*/
		function qqOauthLogin(openid, bp) {
			$
					.ajax({
						url : "${pageContext.request.contextPath }/user/qqlogin",
						type : "post",
						dataType : "json",
						data : {
							"nickname" : bp.nickname,
							"portrait" : bp.figureurl,
							"sex" : bp.gender == "女" ? 0 : 1,
							"openid" : openid
						},
						success : function(data) {
							if (data.result == 0) {
								location.href = "${pageContext.request.contextPath }/profession/index";
							}
						}
					});
		}

		/**登录*/
		function clickSubmitLogin() {
			var uname = $.trim($("#uname").val());
			if (uname.length < 1) {
				$("#errorDiv").text("*请输入用户名");
				$("#uname").focus();
				return;
			}
			var upwd = $.trim($("#upwd").val());
			if (upwd.length < 1) {
				$("#errorDiv").text("*请输入密码");
				$("#upwd").focus();
				return;
			}
			$
					.ajax({
						url : "${pageContext.request.contextPath}/user/login",
						type : "post",
						dataType : "json",
						data : {
							"uname" : uname,
							"upwd" : getMD5(uname + upwd)
						},
						success : function(data) {
							if (data.result == 0) {
								location.href = "${pageContext.request.contextPath }/profession/index";
							} else {
								$("#errorDiv").text("*用户名或密码不正确！");
							}
						}
					});
		}
	</script>
</body>
</html>