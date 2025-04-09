<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormSender.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormSender" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发送窗口</title>

    <script type="text/javascript" src="/Portal/UI/script/xpdl.json.js"></script>

    <link type="text/css" rel="stylesheet" href="/Portal/Themes/Styles/formsender.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="xpdlWrapper">
        <div class="xpdl-sendwindow" id="xpdlSender">
            <div class="xpdl-sendtitle">
                <img src="../../Themes/Images/btn_title.gif" />工作处理</div>
            <table class="xpdl-sendcontent">
                <tr>
                    <td>
                        选择后续工作步骤
                    </td>
                    <td style="height: 30px">
                        <a class="xpdl-selectparta" href="#" id="btnSelAllParts" style="display: none" onclick="selAllParts()">
                            <img src="../../Themes/Images/selectall.gif" />全选</a> <a class="xpdl-selectparta"
                                id="btnMoreParts" onclick="getMoreParts()" style="display: none" href="#">
                                <img src="../../Themes/Images/selectmore.gif" />更多人员</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="actWidget" class="ui-widget-content xpdl-widget-acts">
                        </div>
                    </td>
                    <td>
                        <div id="partWidget" class="ui-widget-content xpdl-widget-parts">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="xpdl-actseltitle">
                        选定步骤:
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="selectedWidget" class="ui-widget-content xpdl-widget-sels">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="xpdl-sendbtntd">
                        <asp:Button ID="btnSend" runat="server" OnClientClick="return checkXpdlSel()" Text="确定" />
                        <asp:Button ID="btnCancel" runat="server" Text="取消" />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <div class="kpms-alphaBox" id="backActivity" style="z-index: 0">
        </div>
    </div>
    <input type="hidden" id="hiXpdlXml" name="hiXpdlXml" />
    <input type="hidden" id="hiPartsXml" name="hiPartsXml" />
    </form>
</body>
</html>
