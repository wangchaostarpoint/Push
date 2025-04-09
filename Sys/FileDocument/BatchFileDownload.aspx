<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchFileDownload.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.FileDocument.BatchFileDownload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>批量下载</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <object id="Zhongsoft.BatchDownloader" name="BatchDownloader" classid="clsid:EA829C41-B23A-4918-9464-72F0BA095FB9"
            codebase="<% =WebAppPath%>/Sys/Download/Zhongsoft.ActiveX.cab" width="100%" height="450px">
        </object>
        <script type="text/javascript">
        var downloader = document.getElementById("Zhongsoft.BatchDownloader") ;
        
        downloader.AuthType = "NTLM";
        //downloader.AuthHosts = "http://epm.hbed.com.cn";
        //downloader.AuthHosts = "http://eicp.hbed.com.cn";
        downloader.AuthUser = "spsadmin";
        downloader.AuthPassword = "LcFvI7nfbdDgvsLI9RyoGnb+fTa630HHVVIDDwo4L5YdzNLOW7DikA==";
        downloader.AuthDomain = "hbed";
        
        <%=GenerateDownloadUrls()%>        
        </script>
    </div>
    <div>
        <span style="color:Red; font-weight:bold;font-size:20px;">重要：请点击关闭按钮关闭页面！</span>
        <asp:LinkButton runat="server" ID="lbtnCloseWindow" OnClientClick="setReturnVal()"><span>关闭</span></asp:LinkButton>
        <input type="hidden" runat="server" id="hiTempPath" />
    </div>
    <div>
        <span style="color: Red">说明：如果不能在线安装，请下载控件后安装.</span>
        <asp:LinkButton runat="server" ID="lbtnBatchDownloadMap" OnClientClick="return BatchDownloadMap();">
            <span>下载控件</span>
        </asp:LinkButton>
    </div>
    <script type="text/javascript">
        //下载
        function BatchDownloadMap() {
            var url = "<% =WebAppPath%>/Sys/download/Zhongsoft.ActiveX.cab";

            window.open(url);
            return false;
        }

        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = $("#<%=hiTempPath.ClientID %>").val();
            closeWindow();
        }
    </script>
    </form>
</body>
</html>
