<%@ Page Title="页面布局" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="TemplateSelector.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.TemplateSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                页面布局
            </td>
            <td class="td-m">
                <asp:DropDownList runat="server" ID="ddlTemplate">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
            </td>
            <td class="td-m">
            </td>
        </tr>
    </table>
    <table class="tz-table">
        <tr>
            <td colspan="2" align="right">
                <asp:LinkButton runat="server" ID="btnSave" class="kpms-btn" OnClientClick="return Save();return false;">
                            <img   src="../../Themes/Images/btn_save.gif"/><span>确定</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnCancel" class="kpms-btn" OnClientClick="window.close();return false;">
                            <img  src="../../Themes/Images/btn_cancel.gif"/><span>取消</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
