﻿<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ProjValueDetailOfManager.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjValueDetailOfManager" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="text-align: center; font-weight: bold; font-size: larger">
        <asp:Label runat="server" ID="lbTitle"></asp:Label>
    </div>
    <br />
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        ShowPageSizeChange="true" PageSize="30" AutoGenerateColumns="false" ShowExport="true"
        AllowSorting="false" ShowEmptyDataHeader="false" AllowFrozing="false" UseDefaultDataSource="true"
        BindGridViewMethod="BindData" EmptyDataText="没有数据" OnRowDataBound="gvList_RowDataBound"
        OnRowCreated="gvList_RowCreated">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
