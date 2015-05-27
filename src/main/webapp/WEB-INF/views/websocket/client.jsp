<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String serverPath = request.getServerName()+":"+request.getServerPort()+"/"+request.getContextPath() + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>WEBSOCKET-CLIENT</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  </head>
  
  <body>
  	<h2>客户端：</h2>
  	<textarea id="msg" rows="3" style="width:100%;"></textarea>
  	<br/>
  	<button type="button" onclick="sendMsg()">发送</button>
  	<br/>
  	<div id="showMsg">
  	</div>
  	<script type="text/javascript">
		var clientSocket = new WebSocket('ws://<%=serverPath%>websocket');
		 //建立连接
   		clientSocket.onopen = function(evt){
   			alert("建立连接");
   			showMsg("clientonline:::client1:::server1");
   			clientSocket.send("clientonline:::client1:::server1");
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
				alert("发送消息："+msg);
				clientSocket.send("sendmsg:::client1:::server1:::"+msg);
				showMsg("发送消息："+msg);
			}else{
				alert("该浏览器不支持WEBSOCKET!");
			}
		}
		
		function showMsg(msg){
			document.getElementById("showMsg").innerHTML+="<span>"+msg+"</span><br/>";
		}
	</script>
  </body>
</html>
