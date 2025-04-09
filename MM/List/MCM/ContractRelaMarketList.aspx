<%@ Page Title="合同工程绑定信息" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ContractRelaMarketList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractRelaMarketList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">合同编号/名称</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbContract" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">签约日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStartTime"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEndTime"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="False" AllowPaging="True" PageSize="15"
        ShowExport="True" BindGridViewMethod="BindData" AllowSorting="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="ContractCode" SortExpression="ContractCode" />
            <zhongsoft:LightTemplateField HeaderText="合同名称" HeaderStyle-Width="500px" SortExpression="ContractName">
                <ItemTemplate>
                    <div class="autoskip" style="width: 500px" title="<%# Eval("ContractName") %>">
                        <a onclick="viewItem('1','<%# Eval("ContractID") %>');" class="aStyle"><%# Eval("ContractName") %></a>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="签订状态" DataField="ContractStatus" SortExpression="ContractStatus" />
            <zhongsoft:LightBoundField HeaderText="合同金额(万元)" DataField="ContractValue" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right" SortExpression="CE.ContractValue" />
            <zhongsoft:LightBoundField HeaderText="工程编号" DataField="MarketProjectCode" SortExpression="MPE.MarketProjectCode" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MarketProjectName" ShowToolTip="true" HeaderStyle-Width="350px" SortExpression="MPE.MarketProjectName" />
            <zhongsoft:LightBoundField HeaderText="工程金额(万元)" DataField="ContractValueMPE" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right" SortExpression="MPE.ContractValue" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function viewItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/MM/List/MCM/ContractEditorNew.aspx', json);
            showDivDialog(url, "", 1000, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
