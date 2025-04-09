<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormWorkflowPage.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.FormWorkflowPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>流程图</title>
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
    <script type="text/javascript" src="../../UI/Script/Silverlight.js"></script>
</head>
<script>
    
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null & sender != 0) {
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

            throw new Error(errMsg);
        }
        function pluginLoaded(sender) {
            $silverCtrl = document.getElementById("designerContainer");
            $silverCtrl.Content.Control.SetParamValue("bizid", "<%=Request["bizId"] %>");
            $silverCtrl.Content.Control.SetParamValue("wfformid", "<%=Request["formid"] %>");
        }

</script>
<body style="overflow: hidden">
    <form id="form1" runat="server" style="height: 100%">
    <input id="hiXPDLId" type="hidden" runat="server" />
    <input id="hiPackageName" type="hidden" runat="server" />
    <input id="hiPrcInstId" type='hidden' runat="server" />
    <input id="hiActInstId" type="hidden" runat="server" />
    <div id="silverlightControlHost" style="overflow: hidden">
        <object id="designerContainer" data="data:application/x-silverlight-2," type="application/x-silverlight-2"
            width="100%" height="100%">
            <param name="source" value="/Portal/Sys/ClientBin/ZhongsoftXPDLOnline.xap" />
            <param name="onError" value="onSilverlightError" />
            <param name="onload" value="pluginLoaded" />
            <param name="background" value="white" />
            <param name="minRuntimeVersion" value="5.0.61118.0" />
            <param name="autoUpgrade" value="true" />
            <param name="enableGPUAcceleration" value="true" />
            <param name="initParams" value="ServiceAddress=http://<%=Request.Url.Authority %><%=WebAppPath %>/Sys/SOA/WorkflowService.asmx,Action=1,XPDLIdVar=<%=hiXPDLId.ClientID%>,PackageNameVar=<%=hiPackageName.ClientID%>,PrcInstIdVar=<%= hiPrcInstId.ClientID%>,ActInstId=<%= Request["actInstId"]%>,userid=<%=KPMSUser.Id %>,viewmode=Route" />
            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="获取 Microsoft Silverlight"
                    style="border-style: none" />
            </a>
        </object>
        <iframe id="_sl_historyFrame" style='visibility: hidden; height: 0; width: 0; border: 0px'>
        </iframe>
    </div>
    </form>
</body>
</html>
