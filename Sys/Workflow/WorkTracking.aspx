<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkTracking.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.WorkTracking" %>

<%@ Register Src="~/Sys/Workflow/Controls/FormProcessView.ascx" TagName="FormProcessView"
    TagPrefix="uc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>可视化跟踪</title>
    <style type="text/css">
        html, body {
            height: 100%;
            overflow: auto;
        }

        body {
            padding: 0;
            margin: 0;
        }

        #silverlightControlHost {
            height: 100%;
            text-align: center;
        }

        .welcome {
            margin-top: 13px !important;
        }

        .tabs-title {
            display: inline !important;
        }

            .tabs-title li {
                top: -7px;
                position: relative;
                margin-left: 16px;
            }

        .tabs-title {
            margin-bottom: -9px !imporatnt;
            padding-top: 0 !important;
        }

        .tabs-tlink {
            margin-top: 2px;
        }

        .flow_title {
            height: 32px;
            line-height: 32px;
            padding-left: 15px;
            background-color: #EFF2F7;
            border: #C0C3C8 1px solid;
            font-size: 14px;
            font-weight: bold;
            margin: 3px 0;
        }
    </style>
    <link href="../../themes/custom/styles/global.css" rel="stylesheet" />
    <link href="../../Themes/Styles/form.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript" src="../../UI/Script/Silverlight.js"></script>
</head>
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

    function pluginLoaded(sender) {
        $silverCtrl = document.getElementById("designerContainer");
        $silverCtrl.Content.Control.SetParamValue("bizid", '<%=Request["bizId"] %>');
        $silverCtrl.Content.Control.SetParamValue("wfformid", '<%=Request["formid"] %>');
    }

</script>
<body>
    <form id="form1" runat="server">

        <%--添加功能区--%>
        <div id="divHeader" runat="server" class="detail-header">
            <div class="tabs-title2">
                <%=this.Page.Title %>
                <%--—
            <%=AppConfig.Instance.BaseOrgUnitName %>--%>
            </div>
            <div class="tabs-title">
                <ul id="tabs">
                    <li><a class="tabs-tlink">功能区</a></li>
                </ul>
            </div>
        </div>
        <%--功能区结束--%>

        <div id="templateTabs">
            <table style="width: 99%">
                <tr>
                    <td>
                        <ul>
                            <li index="0"><a href='#flowTrack'>流程跟踪</a></li>
                            <li index="1"><a href='#flowTrackVisual'>可视化流程</a></li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="flowTrack">
                            <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" OnClientClick="return method1('TrackingView')" EnableTheming="false" ForeColor="Blue">导出EXCEL</asp:LinkButton>
                        </div>
                        <div id="flowTrackVisual">
                            <input id="hiXPDLId" type="hidden" runat="server" />
                            <input id="hiFormDefinitionId" type="hidden" runat="server" />
                            <input id="hiPackageName" type="hidden" runat="server" />
                            <input id="hiPrcInstId" type='hidden' runat="server" />
                            <input id="hiActInstId" type="hidden" runat="server" />
                            <input id="hiCurLan" type="hidden" runat="server" />
                            <div id="divUnlane" runat="server">
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
                                    <a href="../Download/Silverlight.rar" style="text-decoration: none">
                                        <img src="<%=WebAppPath %>/Themes/Images/silverlight.png" alt="获取 Microsoft Silverlight"
                                            />
                                    </a>
                                </object>
                                <iframe id="_sl_historyFrame" style='visibility: hidden; height: 0; width: 0; border: 0px'></iframe>
                                <asp:LinkButton ID="lbtnEditFlow" runat="server" OnClientClick="return openEditFlow()" Visible="false" EnableTheming="false" ForeColor="Blue">编辑可视化流程</asp:LinkButton>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script type="text/javascript">
        ///设置大小
        $(document).ready(function () {
            var $height = document.body.clientHeight - 100;
            $("#flowTrack").height($height);
            $("#divUnlane").height($height);
        });

        $(function () {
            $('#templateTabs').tabs();
            $.ajax({
                type: "POST",
                url: "WorkflowTrackingHandler.ashx",
                data: 'prcInstId=<%=Request.QueryString["prcInstId"]%>&actInstId=<%=Request.QueryString["actInstId"]%>&userId=<%=KPMSUser.Id %>',
                cache: true,
                async: false,
                success: function (html) {
                    $("#flowTrack").html(html + $("#flowTrack").html());
                    //$("#flowTrack").append(html);
                    asyncTracking = true;
                }
            });

        });

        function openEditFlow() {
            var bizId = $("#<%=hiFormDefinitionId.ClientID %>").val();
            window.open("../../Sys/Workflow/CustomXPDLEditor.aspx?actionType=3&hrefid=axpdl&bizId=" + bizId);
            return false;
        }
    </script>
    <script type="text/javascript" language="javascript">
        var idTmr;
        function method1(tableid) {//整个表格拷贝到EXCEL中
            var curTbl = document.getElementById(tableid);
            var oXL = new ActiveXObject("Excel.Application");
            //创建AX对象excel 
            var oWB = oXL.Workbooks.Add();
            //获取workbook对象 
            var xlsheet = oWB.Worksheets(1);
            //激活当前sheet 
            var sel = document.body.createTextRange();
            sel.moveToElementText(curTbl);
            //把表格中的内容移到TextRange中 
            sel.select();
            //全选TextRange中内容 
            sel.execCommand("Copy");
            //复制TextRange中内容  
            xlsheet.Paste();
            //粘贴到活动的EXCEL中       
            oXL.Visible = true;
            //设置excel可见属性

            try {
                var fname = oXL.Application.GetSaveAsFilename("办理意见.xls", "Excel Spreadsheets (*.xls), *.xls");
            } catch (e) {
                print("Nested catch caught " + e);
            } finally {
                oWB.SaveAs(fname);

                oWB.Close(savechanges = false);
                //xls.visible = false;
                oXL.Quit();
                oXL = null;
                //结束excel进程，退出完成
                //window.setInterval("Cleanup();",1);
                idTmr = window.setInterval("Cleanup();", 1);

            }
            return false;
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
    </script>
</body>
</html>
