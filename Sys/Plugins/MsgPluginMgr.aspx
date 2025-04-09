<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="MsgPluginMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.MsgPluginMgr" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnSend" CssClass="subtoolbarlink" OnClick="btnSend_Click"
            OnClientClick="return checkReqField();" EnableTheming="false"><span><img src="../../Themes/Images/btn_title.gif">测试</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                主题<span class="req-star">*</span>
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbTitle" req="1" Width="600px"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                内容<span class="req-star">*</span>
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbContent" TextMode="MultiLine" req="1" Width="600px"
                    CssClass="kpms-textarea" EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                消息类型<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:CheckBoxList ID="chblMessageType" runat="server" req="1" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                接收人<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiReceiveUserId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsReceiveUser" PageUrl="~/Sys/OrgUsers/UserSelector.aspx"
                    req="1" ResultForControls="{'hiReceiveUserId':'id'}" IsMutiple="true"  Width="600px"/>
            </td>
        </tr>
    </table>
</asp:Content>
