<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ProjTypeAndDeptValueSum.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjTypeAndDeptValueSum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>年份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlYear" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>月份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBeginMonth" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
        &nbsp;至&nbsp;<zhongsoft:LightDropDownList runat="server" ID="ddlEndMonth" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="text-align: center; font-weight: bold; font-size: larger">
        <asp:Label runat="server" ID="lbTitle"></asp:Label>
    </div>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="40" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
        AllowFrozing="true" UseDefaultDataSource="true" BindGridViewMethod="BindData"
        ShowEmptyDataHeader="false" EmptyDataText="没有数据" OnRowDataBound="gvList_RowDataBound">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
