<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogMgrEditor.aspx.cs" MasterPageFile="~/UI/Master/ObjectList.Master"
    Inherits="Zhongsoft.Portal.Sys.Log.LogMgrEditor" Title="日志信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="listGrid" runat="server">
    <table width="100%">
        <tr>
            <td colspan="5">
                <fieldset class="rtm_fds_bd" id="fsAdvSearch">
                    <legend class="rtm_fds_tle"><b>日志信息</b></legend><span>
                        <%= GetLogMessage()%></span>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <b>发生用户：</b>
                <%=GetLogUser()%>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                <b>分派处理人员：</b>
            </td>
            <td style="width: 150px">
                <zhongsoft:LightObjectSelector runat="server" ID="lbLogDealUserName" IsMutiple="false"
                    ResultForControls="{'hiLogDealUserId':'id'}" EnableTheming="false" Text="处理人员"
                    Width="100px" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" />
            </td>
            <td style="width: 80px">
                <b>处理状态：</b>
            </td>
            <td style="width: 150px">
                <asp:DropDownList runat="server" ID="ddlFlag">
                    <asp:ListItem Value="0">未处理</asp:ListItem>
                    <asp:ListItem Value="1">已处理</asp:ListItem>
                </asp:DropDownList>
                <input type="hidden" runat="server" id="hiLogDealUserId" />
                <input type="hidden" runat="server" id="hiOldFlag" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="5" style="height: 20px"></td>
        </tr>
        <tr>
            <td align="center" colspan="5">
                <asp:Button ID="btnConfirm" runat="server" Text="确定" OnClick="btnConfirm_Click" OnClientClick="returnValue();" />
                <asp:Button ID="btnCancel" runat="server" Text="取消" OnClientClick="closeWindow();" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("#divBars").hide();
        }

        function returnValue() {
            var old = $("#<%=hiOldFlag.ClientID%>").val();
            var newval = $("#<%=ddlFlag.ClientID %>").find("option:selected").val();
            if (old != newval) {
                parent.returnValue = "isSave";
            }
        }
    </script>
</asp:Content>
