<%@ Page Language="C#" AutoEventWireup="true" Title="WBS任务详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="WBSPartakerEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSPartakerEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                参与人<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUser" IsMutiple="false" SelectPageMode="Dialog"
                    activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiUserID':'id'}"
                    PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" TableName="EPMS_WBSPartaker"
                    Field="PartakerUserName"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserID" tablename="EPMS_WBSPartaker" field="PartakerUserID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工作比例
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkRate" TableName="EPMS_WBSPartaker"
                    Width="200" Field="WorkRate" activestatus="(23.*)" Style="text-align: right;"
                    regex="^(\d{0,2}|\d{0,2}\.\d{1,2})$" errmsg="请输入100及以内的两位整数两位小数"></zhongsoft:LightTextBox>%
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工作内容
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbContent" TableName="EPMS_WBSPartaker"
                    Field="WorkContent" activestatus="(23.*)" TextMode="MultiLine" EnableTheming="false"
                    CssClass="kpms-textarea" maxtext="2048"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_WBSPartaker" Field="Memo"
                    activestatus="(23.*)" TextMode="MultiLine" EnableTheming="false" CssClass="kpms-textarea"
                    maxtext="1024"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiWBSPartakerID" tablename="EPMS_WBSPartaker"
        field="WBSPartakerID" />
</asp:Content>
