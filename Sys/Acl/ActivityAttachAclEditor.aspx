<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivityAttachAclEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Acl.ActivityAttachAclEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                流程名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbosFormName" SourceMode="SelectorPage"
                    req="1" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" Writeable="false"
                    field="FormName" tablename="PortalActivityAttachACL" ActiveStatus="(2.*)" OnClick="lbosFormName_Click"
                    ResultForControls="{'hiFormID':'FormID'}" IsMutiple="false" PageUrl="~/Sys/Workflow/WfFormSelector.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiFormID" field="FormID" tablename="PortalActivityAttachACL" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                步骤名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlObj" req="1" ActiveStatus="(23.*)">
                    <asp:ListItem Value="" Text="请选择"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPackageName" field="PackageName" tablename="PortalActivityAttachACL" />
    <input type="hidden" runat="server" id="hiXPDLID" field="XPDLID" tablename="PortalActivityAttachACL" />
    <input type="hidden" runat="server" id="hiPortalActivityAttachACLID" field="PortalActivityAttachACLID"
        tablename="PortalActivityAttachACL" />
    <input type="hidden" runat="server" id="hiActivityName" field="ActivityName" tablename="PortalActivityAttachACL" />
    <input type="hidden" runat="server" id="hiActivityId" field="ActivityId" tablename="PortalActivityAttachACL" />
</asp:Content>
