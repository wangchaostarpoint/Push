<%@ Page Title="项目进度核定确认编辑" Language="C#" AutoEventWireup="true" CodeBehind="ProjValueApprovedInfoEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjValueApprovedInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                核定日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtApprovedDate" tablename="EPMS_ProjApprovedInfo"
                    readonly="readonly" class="kpms-textbox-date" field="ApprovedDate" activestatus="(2.*)" />
            </td>
            <td class="td-l">
                核定人员
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtApprovedUserName" runat="server" TableName="EPMS_ProjApprovedInfo"
                    Field="ApprovedUserName" activestatus="(2.*)" class="kpms-textbox-short" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiApprovedUserCode" type="hidden" runat="server" tablename="EPMS_ProjApprovedInfo"
                    field="ApprovedUserCode" />
                <input id="hiApprovedUserId" type="hidden" runat="server" tablename="EPMS_ProjApprovedInfo"
                    field="ApprovedUserId" />
                <input id="hiApprovedDeptId" type="hidden" runat="server" tablename="EPMS_ProjApprovedInfo"
                    field="ApprovedDeptId" />
                <input id="hiApprovedDeptName" type="hidden" runat="server" tablename="EPMS_ProjApprovedInfo"
                    field="ApprovedDeptName" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                年份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear" tablename="EPMS_ProjApprovedInfo"
                    class="kpms-ddlsearch" EnableTheming="false" field="year" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                月份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" tablename="EPMS_ProjApprovedInfo"
                    class="kpms-ddlsearch" EnableTheming="false" field="month" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                核定状态
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rdblApprovedState" TableName="EPMS_ProjApprovedInfo"
                    Field="ApprovedState" activestatus="(23.*)" RepeatColumns="2">
                    <asp:ListItem Value="1">已核定</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">未核定</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" field="Memo" tablename="EPMS_ProjApprovedInfo" TextMode="MultiLine"
                    maxtext="1024" Rows="4">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ProjApprovedInfo" field="ProjApprovedInfoId"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_ProjApprovedInfo" field="Flag" runat="server"
        value="1" />
</asp:Content>
