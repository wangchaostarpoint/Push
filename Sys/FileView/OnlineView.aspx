<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineView.aspx.cs" Inherits="Zhongsoft.Portal.Sys.FileView.OnlineView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>在线预览</title>
    <script src="./FlexPaper/flexpaper_flash.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <div>
            <div id="divTitle" style="width: 1000px; display: block; margin-top: 3px; text-align: center;">
                <span>
                    <%=FileName%></span>
                <asp:LinkButton runat="server" EnableTheming="false" ID="lbtnDownLoad" OnClick="lbtnDownLoad_Click"
                    Style="float: right"><span>下载</span></asp:LinkButton>
            </div>
            <div id="viewerPlaceHolder" style="width: 1000px; height: 550px; display: block;">
            </div>
            <!--设置一个隐蔽控件来得到要显示的文件的名字-->
            <input type="hidden" id="file" value='<%=FileURL %>' />
            <script type="text/javascript">

                var fileURL = $('#file').val();
                var fp = new FlexPaperViewer(
        './FlexPaper/FlexPaperViewer',
        'viewerPlaceHolder',
        {
            config: {
                SwfFile: escape("<%=FileURL %>"),
                //默认预览比例
                Scale: 1,
                ZoomTransition: 'easeOut',
                ZoomTime: 0.5,
                ZoomInterval: 0.2,
                FitPageOnLoad: false,
                FitWidthOnLoad: false,
                PrintEnabled: true,
                FullScreenAsMaxWindow: false,
                ProgressiveLoading: false,
                MinZoomSize: 0.2,
                MaxZoomSize: 5,
                SearchMatchAll: false,
                InitViewMode: 'Portrait',
                ViewModeToolsVisible: true,
                ZoomToolsVisible: true,
                NavToolsVisible: true,
                CursorToolsVisible: true,
                SearchToolsVisible: true,
                //设置地区（语言)
                localeChain: 'zh_CN'
            }
        }
        );
                if ('<%=ViewType %>' == 'std') {

                    $("html,body").animate({ scrollTop: $("#divTitle").offset().top }, 1000);
                }
                else {
                    $("#divTitle").hide();
                }
            </script>
        </div>
    </center>
    </form>
</body>
</html>
