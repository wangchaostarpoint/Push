<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectValueInfoSta.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectValueInfoSta" Title="生产任务完成情况" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">产值统计截止月</span> <span>
        <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>月
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="false" PageSize="15" UseDefaultDataSource="true"
        BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="统计项" DataField="StaType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="说明" ItemStyle-Width="300px">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important;">
                        <%# Eval("Memo")%>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
