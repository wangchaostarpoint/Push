<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUploader.aspx.cs" Inherits="Zhongsoft.Portal.Sys.FileDocument.FileUploader" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>文件上传</title>
    <style type="text/css">
        #silverlightControlHost {
            height: 100%;
            text-align: center;
        }
    </style>
</head>
<body>
    <script type="text/javascript" src="../Script/Product/Silverlight.js"></script>
    <script type="text/javascript">
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

        var slCtl = null;
        function pluginLoaded(sender) {
            slCtl = document.getElementById("sliverlight");
            var imageFileType = "<%=ImageFileType %>";

            if ("" != imageFileType && null != imageFileType) {
                ////文件过滤
                //slCtl.Content.Control.SetFileFilter("Image Files (*.bmp, *.jpg，*.png)|*.bmp;*.jpg;*.png");

                //可动态设置文件上传服务器 
                //用分隔符|隔开
                var str = "";
                var strend = "";
                var array = imageFileType.toLowerCase();
                if (array.indexOf("pdf") >= 0) {
                    str += ",*.pdf";
                    strend += ";*.pdf";
                }

                if (array.indexOf("word") >= 0) {
                    str += ",*.doc, *.docx";
                    strend += ";*.doc;*.docx";
                }
                if (array.indexOf("excel") >= 0) {
                    str += ",*.xls, *.xlsx";
                    strend += ";*.xls;*.xlsx";
                }
                if (array.indexOf("ppt") >= 0) {
                    str += ",*.ppt, *.pptx";
                    strend += ";*.ppt;*.pptx";
                }
                if (array.indexOf("image") >= 0) {
                    str += ",*.bmp, *.jpg，*.png";
                    strend += ";*.bmp;*.jpg;*.png";
                }

                if (str == "") {
                    str += ",*.bmp, *.jpg，*.png";
                    strend += ";*.bmp;*.jpg;*.png";
                }
                var strall = "All Files (" + str.substr(1) + ")|" + strend.substr(1);
                slCtl.Content.Control.SetFileFilter(strall);
            }
            //传到HttpUploadHandler.ashx中的参数：FormId、AllowSameNameFile（是否允许上传同名文件）
            //顺序不可更改，若有添加的其他参数请在结尾按顺序添加
            //<%=AllowSameNameFile %> 判断是否允许上传同名文件  add by xuning 20150316
            var params = "<%=FormId %>|<%=AllowSameNameFile %>|<%=BizId %>|<%=ProjectId %>|<%=ActivityInstanceId%>|<%=FileType %>|<%=AllowCoverFile %>";
            var handlerUrl = "http://<%= Request.Url.Authority%><%=WebAppPath %>/Sys/Handler/HttpUploadHandler.ashx";
            var uploadType = "<%=UploadType %>";
            if (uploadType.toLowerCase() == "product" || uploadType.toLowerCase() == "signproduct" || uploadType.toLowerCase() == "pdfproduct") {
                handlerUrl = "http://<%= Request.Url.Authority%><%=WebAppPath %>/Sys/Handler/HttpProductUploadHandler.ashx";
                params = "<%=BizId %>|<%=WBSId %>|<%=IsExceptDwg %>|<%=OnlyCover %>|<%=FormId %>|" + uploadType;
            }
            else if (uploadType.toLowerCase() == "image" || uploadType.toLowerCase() == "video") {
                handlerUrl = "http://<%= Request.Url.Authority%><%=WebAppPath %>/Sys/Handler/HttpPWSUploadHandler.ashx";
                params = "<%=FileType %>";
            }
            slCtl.Content.Control.SetUploadServer(handlerUrl);
            slCtl.Content.Control.SetUploadMode("http");
            slCtl.Content.Control.SetExtendParam(params);

        }
    </script>
    <form id="form1" runat="server">
        <div id="silverlightControlHost">
            <object id="sliverlight" data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                width="420" height="300">
                <param name="source" value="../ClientBin/ZhongsoftUploaderClient.xap" />
                <param name="onerror" value="onSilverlightError" />
                <param name="background" value="white" />
                <param name="minRuntimeVersion" value="3.0.40624.0" />
                <param name="autoUpgrade" value="true" />
                <param name="onload" value="pluginLoaded" />
                <param name="initParams" value="FileSourceId=<%=FileSourceId %>,FileSourceFlag=<%=FileSourceFlag %>,UserId=<%=UserId %>,UserName=<%=UserName %>,BuildSelfFolder=<%=BuildSelfFolder %>,Catalogs=<%=Catalogs %>,HideClose=<%=HideClose%>,Multiselect=<%=Multiselect%>" />
                <a href="../Download/Silverlight.rar" style="text-decoration: none;">点击下载插件,解压后安装
                </a>
            </object>
            <iframe id="_sl_historyFrame" style='visibility: hidden; height: 0; width: 0; border: 0px'></iframe>
        </div>
    </form>
</body>
</html>
