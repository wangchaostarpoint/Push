<%@ Page Language="C#" Title="用户登录系统记录" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="PortalUserLoginList.aspx.cs" Inherits="Zhongsoft.Portal.Sys.PortalUserLoginList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span> <span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="120px" AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">登录日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStartTime"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEndTime"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="PortalUserLoginID" UseDefaultDataSource="false" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%#Eval("RowNumber")%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LoginID" HeaderText="工号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TypeName" HeaderText="登录类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LoginTime" HeaderText="登录时间">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MachineName" HeaderText="登录机器名" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="IpAddress" HeaderText="登陆IP">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

