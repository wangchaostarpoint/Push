﻿function addCookie(name, value, expireHours) {
    var cookieString = name + "=" + escape(value);
    //判断是否设置过期时间 
    if (expireHours > 0) {
        var date = new Date();
        date.setTime(date.getTime() + expireHours * 3600 * 1000);
        cookieString = cookieString + "; expires=" + date.toGMTString();
    }
    document.cookie = cookieString;
}
function getCookie(name) {
    var strCookie = document.cookie;
    var flag;
    if (strCookie.length <= 0) {
        flag = 0;
    }
    else {
        var arrCookie = strCookie.split("; ");
        for (var i = 0; i < arrCookie.length; i++) {
            var arr = arrCookie[i].split("=");
            if (arr[0] == name) flag = arr[1];
        }
    }
    return flag;
}