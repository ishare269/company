<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>EDM邮件</title>
<%@ include file="./base.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/mail/backstage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mail/tanceng.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/plugin/simplepagination/simplePagination.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/plugin/simplepagination/jquery.simplePagination.js"></script>
</head>

<body>
	<div class="header"
		style="font-size:20px;color:#ffffff;text-align:center;line-height:60px;">EMD邮件模板</div>
	<div class="center clearfix">
		<%-- <%@include file="../include/leftmenu.jsp"%>--%>
		<div class="center-right" id="center-right">
			<div class="cr-wrap" id="mainWrap" style="margin:0px;">
				<div class="tabMain-01">
					<div class="right-top">
						<p>
							<label> 关键字： </label> <input type="text" class="inputys"
								id="txtKeyword" />
						</p>
						<p>
							<input type="button" value="查询" onclick="ajaxLoadData(1)"
								class="btn" /> <input type="button" value="新增"
								onclick="divEditShow()" class="btn" />
						</p>
					</div>
					<div class="right-tabble">
						<table cellpadding="0" cellspacing="0" width="100%">
							<thead>
								<tr>
									<td width="30%">主题</td>
									<td width="60%">时间</td>
									<td width="10%">操作</td>
								</tr>
							</thead>
							<tbody id="tbodyDataList">
								<c:forEach items="${mailTemplates }" var="mail">
									<tr>
										<td width="30%">${mail.subject }</td>
										<td width="60%">${mail.createtime }</td>
										<td width="10%"><a href="javascript:;"
											onclick="editMail('${mail.id}')">发送</a> <a
											href="javascript:;" onclick="delMail('${mail.id}')">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagewrap">
						<div class="page" id="divPagination" style="float: right;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


	<div class="divTancengWrap" id="divEdit">
		<div class="tancengBg"></div>
		<div class="divTancengMain" style="width:800px;margin-left:-400px;">
			<h1>EDM邮件编辑</h1>
			<input type="hidden" id="id" /> <input type="hidden" id="type"
				value="0" />
			<table>
				<tr>
					<td>收件人</td>
					<td><textarea rows="3" id="to" placeholder="收件人列表"></textarea>
					</td>
				</tr>
				<tr>
					<td>主题</td>
					<td><input type="text" id="title" placeholder="邮件标题" />
					</td>
				</tr>
				<tr>
					<td>正文</td>
					<td>
						<!-- 加载编辑器的容器 --> <script id="container" name="content"
							type="text/plain">
    </script> <!-- 配置文件 -->
					</td>
				</tr>
				<tr>
					<td colspan="2"><a class="aBtns" href="javascript:void(0);"
						onclick="preview()">预览</a><a class="aBtns"
						href="javascript:void(0);" onclick="saveFuText()">发送</a> <a
						class="aBtns" href="javascript:void(0);"
						onclick="$('#divEdit').hide()">取消</a></td>
				</tr>
			</table>
			<a href="javascript:;" class="a-del"
				onClick="clickCloseKnowledgeAdd();"></a>
		</div>
	</div>

	<script type="text/javascript">
		/**弹层居中*/
		function positionTanCeng() {
			$(".divTancengMain:visible").css("margin-top",
					-$(".divTancengMain:visible").height() / 2 - 20);
		}

		/**显示弹层*/
		function divEditShow() {
			$("#divEdit").show();
			$("#id").val("");
			$("#type").val("0");
			positionTanCeng();
		}
	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/plugin/ueditor1_4_3/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/plugin/ueditor1_4_3/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor('container', {
			toolbars : [
					[ 'fullscreen', 'source', 'undo', 'redo', 'bold', 'italic',
							'underline', 'fontborder', 'strikethrough',
							'superscript', 'subscript', 'removeformat',
							'formatmatch', 'autotypeset', 'blockquote',
							'pasteplain', 'forecolor', 'backcolor',
							'insertorderedlist', 'insertunorderedlist',
							'selectall', 'cleardoc', 'link', 'unlink',
							'simpleupload', 'insertimage', 'preview' ],
					[ 'justifyleft', 'justifyright', 'justifycenter',
							'justifyjustify', 'forecolor', '|', 'backcolor',
							'fontfamily', 'fontsize', 'paragraph' ] ],
			initialFrameHeight : 220,
			initialFrameWidth : 735,
			autoHeightEnabled : false
		});

		/**保存富文本*/
		function saveFuText() {
			var to = $("#to").val();
			if (to.length < 1) {
				alert("请输入联系人！");
				return;
			}
			var title = $("#title").val();
			if (title.length < 1) {
				alert("请输入标题！");
				return;
			}
			//对编辑器的操作最好在编辑器ready之后再做
			ue.ready(function() {
				//获取html内容，返回: <p>hello</p>
				var html = ue.getContent();
				if (html.length < 1) {
					alert("请输入邮件内容！");
					return;
				}

				$.ajax({
					url : CONTEXT_PATH + "/mail/sendmail",
					type : "post",
					dataType : "json",
					data : {
						"to" : to,
						"subject" : title,
						"content" : html,
						"id" : $("#id").val(),
						"type" : $("#type").val()
					},
					success : function(data) {
						var result = data.result;
						if ("1" != result) {
							for ( var key in result) {
								alert("收件人：" + key + "，发送"
										+ (result[key] == "0" ? "成功" : "失败"));
							}
							$("#divEdit").hide();
						} else {
							alert("发送失败");
						}
						location.reload();
					}
				});
			});
		}

		/**预览*/
		function preview() {
			ue.ready(function() {
				ue.execCommand('preview')
			});
		}

		/**编辑邮件*/
		function editMail(id) {
			$.ajax({
				url : CONTEXT_PATH + "/mail/findbyid",
				dataType : "json",
				type : "post",
				data : {
					"id" : id
				},
				success : function(data) {
					var mail = data.mailTemplate;
					alert(mail.id);
					$("#id").val(mail.id);
					$("#type").val("1");
					$("#to").val(mail.to);
					$("#title").val(mail.subject);
					$("#title").val(mail.subject);
					ue.setContent(mail.content);
					$("#divEdit").show();
					positionTanCeng();
				}
			});
		}
		/**删除邮件*/
		function delMail(id) {
			$.ajax({
				url : CONTEXT_PATH + "/mail/delmail",
				dataType : "json",
				type : "post",
				data : {
					"id" : id
				},
				success : function(data) {
					if (data.result == "0") {
						alert("删除成功");
					} else {
						alert("删除失败");
					}
					location.reload();
				}
			});
		}
	</script>
</body>
</html>