/**
 * AJAX检查SESSION是否失效
 * 
 * @param data
 *            AJAX返回数据
 * @param path
 *            跳转地址
 * @returns {Boolean}
 */
function isSessionOnline(data, path) {
	if (data.sessionState == 0) {
		alert("您已掉线，请重新登录");
		window.top.location.href = path;
		return false;
	}
	return true;
}


/* 验证手机号 */
function validateTel(tel){
// var regTel = /^(1[1-9])[0-9]{9}$/i;
	 var regTel = /^1\d{10}$/;
	 if(regTel.test(tel)){
	    return true;
   }else{
	    return false;
	 }
}

/* 验证邮箱 */
function validateMail(mail){
	 var regMail = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	 if(mail.match(regMail)){
	    return true;
   }else{
	    return false;
	 }
}

/* 密码验证 6-16个字符和数字组合 */
function validatePwdIntensity(pwd){
	  var reg = /^(?=.*\d.*)(?=.*[a-zA-Z].*).{6,16}$/;
	  return reg.test(pwd);
}
