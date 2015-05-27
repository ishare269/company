/**
 * ajax检查session在线情况，如果session失效，进入登录界面
 * 
 * @return
 */
function isSessionOnline(data,path){
	if(data.sessionState == 0){
		alert("您已掉线，请重新登录");
		window.top.location.href=path + "/UserInfo/toexit";
		return false;
	}
	return true;
}