<%@ Page Title="接收人员详细页面" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PortalAlertUsersEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.PortalAlertUsersEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table id="tz-table" class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                接收人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtReceiveUserName" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" Field="ReceiveUserName"
                    TableName="PortalAlertUser" />
            </td>
            <td class="td-l">
                接收时间
            </td>
            <td class="td-r">
                 <input type="hidden" id="hiReceiveTime" runat="server" tablename="PortalAlertUser" field="ReceiveTime" />
                <zhongsoft:XHtmlInputText ID="txtReceiveTime" runat="server" type="text" class="kpms-textbox-wholedate"
                    req="1" tablename="PortalAlertUser" field="ReceiveTime" readonly="readonly" activestatus="(23.*)"
                    display="display" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                阅读状态
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rdblReceiveState" runat="server" ActiveStatus="(23.*)" RepeatColumns="2"
                    Field="ReceiveState" TableName="PortalAlertUser">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                阅读时间
            </td>
            <td class="td-r">
                <input type="hidden" id="hiDealTime" runat="server" tablename="PortalAlertUser" field="DealTime" />
                <zhongsoft:XHtmlInputText ID="txtDealTime" runat="server" type="text" class="kpms-textbox-wholedate"
                     tablename="PortalAlertUser" field="DealTime" readonly="readonly" activestatus="(23.*)"
                    display="display" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox TextMode="MultiLine" ActiveStatus="(23.*)" maxtext="1024"
                    ID="tbDealMeasure" field="DealMeasure" tablename="PortalAlertUser" runat="server"
                    CssClass="kpms-textarea" EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiAlertUserID" runat="server" field="AlertUserID" tablename="PortalAlertUser" />
</asp:Content>
