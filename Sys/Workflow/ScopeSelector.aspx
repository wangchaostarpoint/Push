<%@ Page Title="选择表单分类" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="ScopeSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.ScopeSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
    在搜索文本框中填写相关信息可以快速找到你要选择的表单分类。
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    名称
    <asp:TextBox runat="server" ID="tbName" Width="150px" MaxLength="60"></asp:TextBox>
    标签
    <asp:TextBox runat="server" ID="tbLabel" Width="150px" MaxLength="60"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <table class="tz-table">
        <tr>
            <td width="25%" valign="top" class="selector-tree">
                <asp:TreeView ID="treeModule" runat="server" Height="100%" Width="100%" ShowLines="true"
                    OnSelectedNodeChanged="treeModule_Change">
                    <SelectedNodeStyle BackColor="#F7F7F7" />
                </asp:TreeView>
            </td>
            <td valign="top">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ScopeId" AutoGenerateColumns="False"
                    AllowPaging="True" BindGridViewMethod="BindGrid" ShowJsonRowColName="true" OnJsonClick="addObject"
                    JsonClickMode="onclick" BindJsonClick="true">
                    <Columns>
                        <asp:BoundField DataField="ScopeName" HeaderText="分类名称" />
                        <asp:BoundField DataField="LabelName" HeaderText="标签" />
                        <asp:BoundField DataField="Sort" HeaderText="排序" />
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
</asp:Content>
