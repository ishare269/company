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
		<div class="aw-container-wrap">
			<div class="container">
				<div class="row">
					<div class="aw-content-wrap clearfix">
						<div class="col-sm-12 col-md-9 aw-main-content">
							<!-- tab切换 -->
							<ul class="nav nav-tabs aw-nav-tabs active hidden-xs"
								style="margin-bottom: 20px">
								<h2 class="hidden-xs">职业详情</h2>
							</ul>
							<!-- end tab切换 -->
							<div class="aw-mod aw-explore-list">
								<div class="mod-body">
									<div class="aw-common-list" style="min-height:450px;">
										<form class="form-horizontal" id="professionForm">
											<div class="form-group">
												<label class="col-sm-2 control-label">公司名称</label>
												<div class="col-sm-10">
													<input id="proCompany" name="company" type="email"
														class="form-control" placeholder="请输入公司名称">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">公司地址</label>
												<div class="col-sm-10">
													<input id="proAddress" name="address" type="email"
														class="form-control" placeholder="请输入公司地址" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">职位</label>
												<div class="col-sm-10">
													<input id="proPosition" name="position" type="email"
														class="form-control" placeholder="请输入职位">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">主要业务</label>
												<div class="col-sm-10">
													<textarea id="proService" name="service" type="email"
														class="form-control" placeholder="请输入业务描述"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">技术领域</label>
												<div class="col-sm-10">
													<textarea id="proTechnology" name="technology" type="email"
														class="form-control" placeholder="请输入工作中使用到的技术和框架"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">薪资福利</label>
												<div class="col-sm-10">
													<input id="proSalary_0" name="salary_0" type="email"
														class="form-control welfare" placeholder="1年以下工作经验薪资">
													<input id="proSalary_1" name="salary_1" type="email"
														class="form-control welfare" placeholder="1年工作经验薪资">
													<input id="proSalary_2" name="salary_2" type="email"
														class="form-control welfare" placeholder="2年工作经验薪资">
													<input id="proSalary_3" name="salary_3" type="email"
														class="form-control welfare" placeholder="3年工作经验薪资">
													<input id="proSalary_4" name="salary_4" type="email"
														class="form-control welfare" placeholder="3年以上工作经验薪资">
													<textarea id="proWelfare" name="welfare"
														class="form-control welfare" placeholder="一年几薪及节假日福利"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">入职技巧</label>
												<div class="col-sm-10">
													<textarea id="proEntrySkills" name="entrySkills"
														class="form-control" placeholder="请输入笔/面试题目及技巧"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">在职感悟</label>
												<div class="col-sm-10">
													<textarea id="impression" name="impression"
														class="form-control" placeholder="请输入在职感悟"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">资料上传</label>
												<div class="col-sm-10">
													注：多份文件请打包上传 <input type="file" id="file" name="file" /> <input
														type="hidden" id="proDataUrl" name="dataUrl" />
													<button type="button" onclick="ajaxFileUploads()">上传</button>
												</div>
											</div>
											<div class="form-group" style="display:none;">
												<label class="col-sm-2 control-label">岗位空缺</label> <select
													id="proVacancy" name="vacancy">
													<option value="无">无</option>
													<option value="一般">一般</option>
													<option value="急缺">急缺</option>
												</select>
											</div>
											<p>
												<button type="button" onclick="clickSubmitProfession()"
													class="btn btn-primary btn-lg btn-block">&nbsp;提&nbsp;&nbsp;交&nbsp;</button>
											</p>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!-- 侧边栏 -->
						<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs hidden-sm">
							<div class="aw-mod aw-text-align-justify">
								<div class="mod-head">
									<a class="pull-right"></a>
									<h3>我的发布</h3>
								</div>
								<div class="mod-body" id="divProfessionLists"></div>
							</div>
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
		checkedActive("2");
		getMyjob();
		/**
		 * 获得我的职业
		 */
		function getMyjob() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/profession/ajaxmyjob",
						type : "post",
						dataType : "json",
						success : function(data) {
							if (null != data.professions) {
								var html = "";
								for ( var i = 0; i < data.professions.length; i++) {
									var profession = data.professions[i];
									html += '<dl>';
									html += '<dt class="pull-left aw-border-radius-5"><a>';
									html += '<img src="${pageContext.request.contextPath }/resources/images/topic-mid-img.png" alt="">';
									html += '</a></dt>';
									html += '<dd class="pull-left">';
									html += '<p class="clearfix"><span data-id="5" class="topic-tag">';
									html += '<a class="text" onclick="clickGetDetails('
											+ profession.id
											+ ')">'
											+ profession.company
											+ '</a></span></p><p>';
									html += '<b>' + profession.addTime
											+ '</b> 发布, <b>15</b> 人关注';
									html += '</p></dd></dl>';
								}
								$("#divProfessionLists").append(html);
							}
						}
					});
		}

		/**查看详情*/
		function clickGetDetails(id) {
			$.ajax({
				url : "${pageContext.request.contextPath}/profession/ajaxfind",
				type : "post",
				dataType : "json",
				data : {
					"id" : id
				},
				success : function(data) {
					alert(data);
				}
			});
		}
	</script>
</body>
</html>