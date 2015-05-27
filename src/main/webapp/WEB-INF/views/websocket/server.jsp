<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String serverPath = request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>WEBSOCKET-SERVER</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>

<body>
	<%--<h2>服务端：</h2>
	<textarea id="msg" rows="3" style="width:100%;"></textarea>
	<br />
	<button type="button" onclick="sendMsg()">发送</button>
	<div id="showMsg"></div>
	<script type="text/javascript">
		var clientSocket = new WebSocket('ws://<%=serverPath%>/websocket');
		 //建立连接
   		clientSocket.onopen = function(evt){
   			alert("建立连接");
   			showMsg("serveronline:::server1");
   			clientSocket.send("serveronline:::server1");
        }
        
        //断开连接
        clientSocket.onclose = function(evt){
           	alert("断开连接");
       	}
       	
       	//响应 服务器回复
       	clientSocket.onmessage = function (evt){
        	var msg = evt.data;
        	alert("接收消息："+msg);
        	showMsg("接收消息："+msg);
        }
        
        //和服务器通信发生错误
        clientSocket.onerror = function (evt){
        	alert("通信发生错误");
        }
		
		function sendMsg(){
			if(null!=clientSocket){
				var msg = document.getElementById("msg").value;
				alert("sendmsg:::发送消息："+msg);
				clientSocket.send("sendmsg:::server1:::client1:::"+msg);
				showMsg("发送消息："+msg);
			}else{
				alert("该浏览器不支持WEBSOCKET!");
			}
		}
		
		function showMsg(msg){
			document.getElementById("showMsg").innerHTML+="<span>"+msg+"</span><br/>";
		}
		
		
</script> --%>
	<%@include file="../include/wxjsapi.jsp"%>
	<button type="button" onclick="startRecord()">开始录音</button>
	<button type="button" onclick="stopRecord()">停止录音</button>
	<button type="button" onclick="uploadVoice()">上传录音</button>
	<button type="button" onclick="playVoice()">播放录音</button>

	<script type="text/javascript">
		var g_localId, g_serverId;
		function startRecord() {
			wx.startRecord();
		}

		function stopRecord() {
			wx.stopRecord({
				success : function(res) {
					var localId = res.localId;
					g_localId = localId;
					alert(g_localId);
				}
			});
		}

		function playVoice() {
			wx.playVoice({
				localId : g_localId
			// 需要播放的音频的本地ID，由stopRecord接口获得
			});
		}
		function uploadVoice() {
			wx.uploadVoice({
				localId : g_localId, // 需要上传的音频的本地ID，由stopRecord接口获得
				isShowProgressTips : 1, // 默认为1，显示进度提示
				success : function(res) {
					var serverId = res.serverId; // 返回音频的服务器端ID
					g_serverId = serverId;
					alert(g_serverId);
				}
			});
		}

		function downloadVoice() {
			wx.downloadVoice({
				serverId : g_serverId, // 需要下载的音频的服务器端ID，由uploadVoice接口获得
				isShowProgressTips : 1, // 默认为1，显示进度提示
				success : function(res) {
					var localId = res.localId; // 返回音频的本地ID
					alert(localId);
				}
			});
		}
	</script>
</body>
</html>
