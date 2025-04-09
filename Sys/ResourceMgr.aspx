<%@ Page Language="C#" AutoEventWireup="true" Title="资源文件管理" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ResourceMgr.aspx.cs" Inherits="Zhongsoft.Portal.Sys.ResourceMgr" %>

<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <%=GetRes("project")%>
    <%=GetRes("Specialty")%>
    <%=GetRes("roll")%>
    <%=GetRes("group")%>
    <asp:Button runat="server" ID="btnAdd" Text="增加" OnClick="btnAdd_Click" />
    <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    //前台脚本实现header资源文件、handler
    <zhongsoft:LightPowerGridView ID="gvResList" runat="server" AutoGenerateColumns="False"
        OnRowDataBound="gvResList_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="project">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbResKey" Text='<%#Eval("key") %>'></zhongsoft:LightTextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="资源值CN">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbValCN" Text='<%#Eval("valCN") %>'></zhongsoft:LightTextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="资源值EN">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbValEN" Text='<%#Eval("valEN") %>'></zhongsoft:LightTextBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
