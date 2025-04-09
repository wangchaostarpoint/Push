<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="UserListSelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.UserListSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    模块<asp:DropDownList runat="server" ID="ddlModule" CssClass="kpms-ddl">
    </asp:DropDownList>
    台账名称<asp:TextBox ID="tbName" MaxLength="20" runat="server" Width="120px"></asp:TextBox>
    <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click" CssClass="kpms-btn">
    <img alt =""  src="../../Themes/Images/btn/btn_search.gif" /><span>查找</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" CssClass="kpms-btn" ID="btnReset" OnClick="btnReset_Click">
                     <img alt ="" src="../../Themes/Images/btn/btn_empty.gif"/><span>重置</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns>
            <asp:TemplateField HeaderText="台账名称" ItemStyle-Width="60%">
                <ItemTemplate>
                    <a href="<%# GetUrl(Eval("PageUrl").ToString(), Eval("PageId").ToString())%>" 
                        target="_blank">
                        <%#Eval("PageName").ToString()%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ParentName" HeaderText="父级名称" ItemStyle-Width="40%" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <style>
        a:link
        {
            text-decoration: none;
        }
        a:visited
        {
            text-decoration: none;
        }
        a:hover
        {
            text-decoration: underline;
        }
        a:active
        {
            text-decoration: none;
        }
    </style>
</asp:Content>
