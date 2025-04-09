<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeadingGroupMemberEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.LeadingGroupMemberEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsName" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name" EnableTheming="false"
                    tablename="MBM_LEADINGGROUPMEMBERS" req="1" field="MEMBERNAME" ResultForControls="{'hiUserID':'id','tbCode':'UserCode','hiDeptId':'DEPTID','tbDeptName':'DEPTNAME'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input id="hiUserID" type="hidden" field="MEMBERID" runat="server" tablename="MBM_LEADINGGROUPMEMBERS" />
               <%-- <input id="hiMemberCode" type="hidden" field="MEMBERCODE" runat="server" tablename="MBM_LEADINGGROUPMEMBERS" />--%>
            </td>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbCode" runat="server" activestatus="(23.*)" 
                    field="MEMBERCODE" tablename="MBM_LEADINGGROUPMEMBERS" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbDeptName" runat="server" readonly="readonly" activestatus="(23.*)"
                    field="DEPTNAME" tablename="MBM_LEADINGGROUPMEMBERS" class="kpms-textbox" />
                <input id="hiDeptId" type="hidden" field="DEPTID" runat="server" tablename="MBM_LEADINGGROUPMEMBERS" />
            </td>
            <td class="td-l">
                是否为组长
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="cbLeader" Text="是" activestatus="(23.*)" field="ISLEADER"
                    tablename="MBM_LEADINGGROUPMEMBERS" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" Field="MEMO" tableName="MBM_LEADINGGROUPMEMBERS"
                    activestatus="(23.*)" runat="server" maxtext="256" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" Rows="5">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiGroupId" tablename="MBM_LEADINGGROUPMEMBERS" field="GROUPID"
        runat="server" />
</asp:Content>
