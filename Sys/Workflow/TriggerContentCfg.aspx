<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master" AutoEventWireup="true"
    CodeBehind="TriggerContentCfg.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.TriggerContentCfg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-m" colspan="3">
                内容表达式
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TextMode="MultiLine"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-r" width="33%">
                参数目录
            </td>
            <td class="td-r" width="33%">
                参数项
            </td>
            <td class="td-r" width="33%">
                参数值
            </td>
        </tr>
        <tr>
            <td class="td-r">
                <asp:TreeView runat="server" ID="treeCategory">
                </asp:TreeView>
            </td>
            <td class="td-r">
                <asp:ListBox runat="server" ID="listItems"></asp:ListBox>
            </td>
            <td class="td-r">
                <asp:ListBox runat="server" ID="listValues"></asp:ListBox>
                <asp:Label runat="server" ID="Momo"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
</asp:Content>
