//资源文件转换

var $closeText; //关闭的变量
$.ajax({ type: "POST", url: "/Portal/Sys/Handler/ResourceHandler.ashx", data: { ResKey: "close" }, async: false, success: function (data) { $closeText = data; } }); 