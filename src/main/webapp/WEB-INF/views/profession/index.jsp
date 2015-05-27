<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>行业统计-首页</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/profession/index.css">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/bootstrap-3.3.0/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- Fixed NAVBAR -->
	<%@include file="../include/header_profession.jsp"%>
	<!-- /Fixed NAVBAR -->

	<!-- container -->
	<div class="container" style="min-height: 600px;">
		<%-- <form class="form-inline" role="form" style="text-align:right;">
			<div class="form-group">
				<div class="input-group">
					<input type="email" class="form-control" placeholder="公司名称">
					<div style="cursor:pointer;" class="input-group-addon">搜&nbsp;&nbsp;索</div>
				</div>
			</div>
			已有<span id="totalCount">0</span>条统计信息
		</form>
		<div id="professionLists"></div> --%>

		<div class="aw-container-wrap">
			<div class="container">
				<div class="row">
					<div class="aw-content-wrap clearfix">
						<div class="col-sm-12 col-md-9 aw-main-content">
							<!-- tab切换 -->
							<ul class="nav nav-tabs aw-nav-tabs active hidden-xs">
								<li class="active"><a
									href="${pageContext.request.contextPath }/profession/addjobpage">发布</a>
								</li>

								<h2 class="hidden-xs">所有发布</h2>
							</ul>
							<!-- end tab切换 -->
							<div class="aw-mod aw-explore-list">
								<div class="mod-body">
									<div class="aw-common-list">
										<div data-topic-id="225,5,226," class="aw-item active">
											<a rel="nofollow"
												href="http://wenda.bootcss.com/people/liliang_lz"
												data-id="829" class="aw-user-name hidden-xs"><img alt=""
												src="http://wenda.bootcss.com/static/common/avatar-max-img.png">
											</a>
											<div class="aw-question-content">
												<h4>
													<a href="">云声信息科技有限公司 - java软件工程师</a>
												</h4>
												<!-- <a class="pull-right text-color-999"
													href="">回复</a> -->
												<p>

													<a class="aw-user-name" href="">石涛</a> <span
														class="text-color-999">2015-03-12 16:17发布 • 0次浏览</span>
												</p>

											</div>
										</div>
									</div>
								</div>
								<div class="mod-footer">
									<div class="page-control">
										<ul class="pagination pull-right">
											<li class="active"><a href="javascript:;">1</a></li>
											<li><a href="">2</a>
											</li>
											<li><a href="">3</a>
											</li>
											<li><a href="">4</a>
											</li>
											<li><a href="">&gt;</a>
											</li>
											<li><a href="">&gt;&gt;</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<!-- 侧边栏 -->
						<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs hidden-sm">
							<!-- 
							<div class="aw-mod">
								<div class="mod-head">
									<h3>专题</h3>
								</div>
								<div class="mod-body">
									<ul>
										<li><a href="http://wenda.bootcss.com/feature/liepin">猎聘</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="aw-mod aw-text-align-justify">
								<div class="mod-head">
									<a class="pull-right"
										href="http://wenda.bootcss.com/topic/channel-hot">更多 &gt;</a>
									<h3>热门话题</h3>
								</div>
								<div class="mod-body">
									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/topic/bootstrap"><img
												src="http://wenda.bootcss.com/static/common/topic-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<p class="clearfix">
												<span data-id="5" class="topic-tag"> <a class="text"
													href="http://wenda.bootcss.com/topic/bootstrap">bootstrap</a>
												</span>
											</p>
											<p>
												<b>21</b> 个问题, <b>15</b> 人关注
											</p>
										</dd>
									</dl>
									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/topic/多组件"><img
												src="http://wenda.bootcss.com/static/common/topic-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<p class="clearfix">
												<span data-id="234" class="topic-tag"> <a
													class="text" href="http://wenda.bootcss.com/topic/多组件">多组件</a>
												</span>
											</p>
											<p>
												<b>1</b> 个问题, <b>1</b> 人关注
											</p>
										</dd>
									</dl>
									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/topic/关于日期插件"><img
												src="http://wenda.bootcss.com/static/common/topic-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<p class="clearfix">
												<span data-id="233" class="topic-tag"> <a
													class="text" href="http://wenda.bootcss.com/topic/关于日期插件">关于日期插件</a>
												</span>
											</p>
											<p>
												<b>1</b> 个问题, <b>1</b> 人关注
											</p>
										</dd>
									</dl>
									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/topic/bootstrap typeahead"><img
												src="http://wenda.bootcss.com/static/common/topic-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<p class="clearfix">
												<span data-id="232" class="topic-tag"> <a
													class="text"
													href="http://wenda.bootcss.com/topic/bootstrap typeahead">bootstrap
														typeahead</a> </span>
											</p>
											<p>
												<b>1</b> 个问题, <b>1</b> 人关注
											</p>
										</dd>
									</dl>
									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/topic/Gridview"><img
												src="http://wenda.bootcss.com/static/common/topic-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<p class="clearfix">
												<span data-id="231" class="topic-tag"> <a
													class="text" href="http://wenda.bootcss.com/topic/Gridview">Gridview</a>
												</span>
											</p>
											<p>
												<b>1</b> 个问题, <b>1</b> 人关注
											</p>
										</dd>
									</dl>
								</div>
							</div>
							<div class="aw-mod aw-text-align-justify">
								<div class="mod-head">
									<a class="pull-right" href="http://wenda.bootcss.com/people/">更多
										&gt;</a>
									<h3>热门用户</h3>
								</div>
								<div class="mod-body">

									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a
												href="http://wenda.bootcss.com/people/%E9%94%A6%E6%AF%9B%E9%BC%A0%E7%9A%84%E4%B8%96%E7%95%8C"><img
												src="http://wenda.bootcss.com/static/common/avatar-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<a class="aw-user-name" data-id="382"
												href="http://wenda.bootcss.com/people/%E9%94%A6%E6%AF%9B%E9%BC%A0%E7%9A%84%E4%B8%96%E7%95%8C">锦毛鼠的世界
											</a>
											<p class="signature"></p>
											<p>
												<b>1</b> 个问题, <b>0</b> 次赞同
											</p>
										</dd>
									</dl>

									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/people/wpttree"><img
												src="http://wenda.bootcss.com/static/common/avatar-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<a class="aw-user-name" data-id="833"
												href="http://wenda.bootcss.com/people/wpttree">wpttree </a>
											<p class="signature"></p>
											<p>
												<b>0</b> 个问题, <b>0</b> 次赞同
											</p>
										</dd>
									</dl>

									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/people/xuhuoren"><img
												src="http://wenda.bootcss.com/static/common/avatar-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<a class="aw-user-name" data-id="838"
												href="http://wenda.bootcss.com/people/xuhuoren">xuhuoren
											</a>
											<p class="signature"></p>
											<p>
												<b>0</b> 个问题, <b>0</b> 次赞同
											</p>
										</dd>
									</dl>

									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="http://wenda.bootcss.com/people/Kevin"><img
												src="http://wenda.bootcss.com/static/common/avatar-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<a class="aw-user-name" data-id="722"
												href="http://wenda.bootcss.com/people/Kevin">Kevin </a>
											<p class="signature"></p>
											<p>
												<b>1</b> 个问题, <b>0</b> 次赞同
											</p>
										</dd>
									</dl>

									<dl>
										<dt class="pull-left aw-border-radius-5">
											<a
												href="http://wenda.bootcss.com/people/%E5%94%90%E5%AE%87%E7%90%B3"><img
												src="http://wenda.bootcss.com/static/common/avatar-mid-img.png"
												alt=""> </a>
										</dt>
										<dd class="pull-left">
											<a class="aw-user-name" data-id="836"
												href="http://wenda.bootcss.com/people/%E5%94%90%E5%AE%87%E7%90%B3">唐宇琳
											</a>
											<p class="signature"></p>
											<p>
												<b>0</b> 个问题, <b>0</b> 次赞同
											</p>
										</dd>
									</dl>
								</div>
							</div>
							-->
						</div>
						<!-- end 侧边栏 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->

	<!-- footer -->
	<%@include file="../include/footer_profession.jsp"%>
	<!-- /footer -->

	<script type="text/javascript">
		var page = 1;
		var limit = 10;
		checkedActive("1");
		// 		loadedProfessionData();
		function loadedProfessionData() {
			$
					.ajax({
						url : "${pageContext.request.contextPath }/profession/ajaxqueryall",
						type : "post",
						dataType : "json",
						data : {
							"page" : page,
							"limit" : limit
						},
						success : function(data) {
							$("#totalCount").text(data.totalCount);
							var professions = data.professions;
							var html = "";
							for ( var i = 0; i < professions.length; i++) {
								html += '<div class="jumbotron">';
								html += '<h3 style="margin-top:-30px;">'
										+ professions[i].company + '</h3>';
								html += '<div style="color:#999">';
								html += '<div style="width:40%;float: left;">'
										+ professions[i].address + '</div>';
								html += '<div style="width:20%;float: left;text-align:center;">'
										+ professions[i].addTime + '</div>';
								html += '<div style="width:10%;float: left;">'
										+ professions[i].name + '</div>';
								html += '<div style="width:30%;float: left;">'
										+ professions[i].contact + '</div>';
								html += '</div>';
								html += '<div style="color:#999"></div>';
								html += '</div>';
							}
							$("#professionLists").html(html);
						}
					});
		}
	</script>
</body>
</html>