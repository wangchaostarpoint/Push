<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    Title="扩展动作编辑" CodeBehind="ExActionEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ExActionEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
  
        <tr>
            <td class="td-l">
                名称
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiActionId" field="ActionId" tablename="PortalExAction" />
                <input type="hidden" runat="server" id="hiModuleId" field="ModuleId" tablename="PortalExAction" />
                <zhongsoft:LightTextBox runat="server" ID="tbName" field="ActionName" tablename="PortalExAction"
                    MaxLength="64"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" field="Sort" tablename="PortalExAction"
                    MaxLength="4" DataType="Integer"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
