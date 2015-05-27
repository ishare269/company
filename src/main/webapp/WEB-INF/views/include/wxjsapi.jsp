<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
	//是否支持微信
	var WX_SUPPORT = false;
	//是否正在录音
	var IS_RECORDING = false;
	$.ajax({
		url:"${pageContext.request.contextPath}/weixin/ajaxjsconfig",
		type:"post",
		data:{"url":window.location.href},
		dataType:"json",
		async:false,
		success:function(content){
			var result = content.result;
			alert(result);
			if(0 == result){
				var appid = content.appid;
				var timestamp = content.timestamp;
				var nonceStr = content.nonceStr;
				var signature = content.signature;
				wx.config({
				    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: appid, // 必填，公众号的唯一标识
				    timestamp: timestamp, // 必填，生成签名的时间戳
				    nonceStr: nonceStr, // 必填，生成签名的随机串
				    signature: signature,// 必填，签名，见附录1
				    jsApiList: ['startRecord','stopRecord','onVoiceRecordEnd','playVoice','pauseVoice',
				    			'stopVoice','onVoicePlayEnd','uploadVoice','downloadVoice','chooseImage',
				    			'previewImage','uploadImage','downloadImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});
				WX_SUPPORT = true;
			} else{
				WX_SUPPORT = false;
			}
		}
	});
	
	
	wx.ready(function(){
		WX_SUPPORT = true;
	});
	
	wx.error(function(res){
		WX_SUPPORT = false;
	});
</script>