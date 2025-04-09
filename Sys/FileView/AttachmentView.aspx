<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttachmentView.aspx.cs" Inherits="Zhongsoft.Portal.Sys.FileView.AttachmentView" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>文件预览</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width" />
    <style>
    </style>
</head>
<body>
    <form id="Form1" runat="server">
        <div id="div" style="overflow: auto !important; margin: 0 auto; -webkit-overflow-scrolling: touch">
            <iframe id="attach" frameborder='0'></iframe>
        </div>
        <script type="text/javascript">
            $(function () { 
                var columnName = "<%=ColumnName %>";
                var fileUrl = "<%=FileUrl %>";
                if (columnName == "一周会议安排") {
                    document.getElementById("attach").src = '<%=ViewUrl %>' + fileUrl + "&n=2";
                    document.getElementById("div").style.width = window.screen.width;
                    document.getElementById("attach").width = window.screen.width;
                } else {
                    document.getElementById("attach").src = '<%=ViewUrl %>' + fileUrl;
                    document.getElementById("div").style.width = "1000px";
                    document.getElementById("attach").width = "1000px";
                }
                document.getElementById("div").style.height = window.screen.height * 2;
                document.getElementById("attach").height = window.screen.height * 2;

            })

            window.onscroll = function () {
                window.frames[0].postMessage(document.body.scrollTop, '*');
            }
        </script>
    </form>
</body>
</html>
