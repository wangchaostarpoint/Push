<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebProjectPlan.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.WebProjectPlan"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>项目计划甘特图</title>
      <style type="text/css">
        html, body
        {
            height: 100%;
            overflow: auto;
        }
        body
        {
            padding: 0;
            margin: 0;
        }
        #silverlightControlHost
        {
            height: 100%;
            text-align: center;
        }
    </style>
    <script src="../../../UI/Script/Silverlight.js" type="text/javascript"></script>
    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
                return;
            }

            var errMsg = "Silverlight 应用程序中未处理的错误 " + appSource + "\n";

            errMsg += "代码: " + iErrorCode + "    \n";
            errMsg += "类别: " + errorType + "       \n";
            errMsg += "消息: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "文件: " + args.xamlFile + "     \n";
                errMsg += "行: " + args.lineNumber + "     \n";
                errMsg += "位置: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "行: " + args.lineNumber + "     \n";
                    errMsg += "位置: " + args.charPosition + "     \n";
                }
                errMsg += "方法名称: " + args.methodName + "     \n";
            }

            引发新错误(errMsg);
        }
        var result = null;
        function silverlightSaveHandler(isSave) {
            result = isSave;
        }
        function willReturnValue() {
            if (result == "True") {
                window.returnValue = "True";
                return true;
            }
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" style="height: 100%">
    <div id="silverlightControlHost">
        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
            width="100%" height="100%">
            <param name="source" value="../../../Sys/ClientBin/ZhongsoftSLProjectGantt.xap" />
            <param name="onError" value="onSilverlightError" />
            <param name="background" value="white" />
            <param name="enableGPUAcceleration" value="true" />
            <%--<param name = "enableCacheVisualization" value = "true" />--%>
            <param name="minRuntimeVersion" value="4.0.60310.0" />
            <param name="autoUpgrade" value="true" />
            <param name="initParams" value="ProjectID=<%=ProjectID %>,ServiceAddress=http://<%=Request.Url.Authority %><%=Request.ApplicationPath %>/Sys/SOA/ProjectService.svc,ProjectDataConfig=<%=ProjectDataConfig %>,UserId=<%=UserID %>,ActionType=<%=ActionType %>" />
            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration:none">
 			  <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="获取 Microsoft Silverlight" style="border-style:none"/>
		    </a>
        </object>
        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px;
            border: 0px"></iframe>
    </div>
    </form>
    <script type="text/javascript">
        window.onbeforeunload = function () {
            if ("<%=ActionType %>" != 0) {
                return "窗口即将关闭，请确认数据已经保存！"; //这里可以放置你想做的操作代码
            }
        }
    </script>
</body>
</html>
