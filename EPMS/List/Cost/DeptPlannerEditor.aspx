<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="DeptPlannerEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.DeptPlannerEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                请选择部门
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPutDeptName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiOrganizationID':'id'}"
                    PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" tablename="EPMS_ConfirmProjPerDeptPlaner"
                    field="DeptName"></zhongsoft:LightObjectSelector>
                <input runat="server" type="hidden" id="hiOrganizationID" tablename="EPMS_ConfirmProjPerDeptPlaner"
                    field="OrganizationID" />
            </td>
            <td class="td-l">
                请选择流程发起人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="LightObjectSelector1" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    Filter="{'IsDefaultMyDept':'1'}" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiUserID':'id','hiLoginId':'LoginId'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    PageWidth="850" tablename="EPMS_ConfirmProjPerDeptPlaner" field="UserName"></zhongsoft:LightObjectSelector>
                <input runat="server" type="hidden" id="hiUserID" tablename="EPMS_ConfirmProjPerDeptPlaner"
                    field="UserID" />
                <input runat="server" type="hidden" id="hiLoginId" tablename="EPMS_ConfirmProjPerDeptPlaner"
                    field="LoginId" />
            </td>
            <td class="td-l">
                是否启用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbtnlIsUse" req="1" RepeatDirection="Horizontal"
                    tablename="EPMS_ConfirmProjPerDeptPlaner" field="Flag">
                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                    <asp:ListItem Text="否" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input runat="server" type="hidden" id="hiDeptPlannerID" tablename="EPMS_ConfirmProjPerDeptPlaner"
        field="DeptPlannerID" />
</asp:Content>
