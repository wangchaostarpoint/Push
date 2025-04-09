<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapChargeStaticsList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.MapChargeStaticsList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="出版绘图统计台账" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">委托日期</span> <span>
        <zhongsoft:XHtmlInputText runat="server" ID="tbBegin" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至<zhongsoft:XHtmlInputText runat="server" ID="tbEnd" compare="2" class="kpms-textbox-comparedate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
        ShowExport="true" runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true"
        AllowSorting="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工种名称" DataField="WorkTypeName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="A0" DataField="A0">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="A1" DataField="A1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="A2" DataField="A2">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="A3" DataField="A3">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="A4" DataField="A4">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="小计" DataField="SumCount">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
