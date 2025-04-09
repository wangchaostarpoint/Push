<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjBidOpenRecordList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.ProjBidOpenRecordList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">投标单位</span> <span>
        <zhongsoft:LightTextBox ID="tbBidUnitName" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">开标日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtBidStartDate" runat="server"
            readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtBidFinishDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span><span class="filter-block"><span class="filter-block-lb">投标报价</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbPriceValueStart" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
            Width="70" errmsg="投标报价请输入正数，最多8位整数，6位小数" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        <zhongsoft:LightTextBox runat="server" ID="tbPriceValueEnd" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$"
            Width="70" errmsg="投标报价请输入正数，最多8位整数，6位小数" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvBidUnit" runat="server" ShowExport="true" UseDefaultDataSource="true"
        DataKeyNames="OTHERBIDUNITID" AllowPaging="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvBidUnit_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="MARKETPROJECTNAME" Width="350"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开标时间" DataField="STARTBIDDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开标地点" DataField="BidOpenAddress" Width="200"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <%--    <zhongsoft:LightBoundField HeaderText="招标单位" DataField="BIDCUSTOMERNAME" Width="200"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="投标单位" DataField="BIDUNITNAME" Width="200"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="投标报价<br/>（万元）" DataField="BIDDINGUNITPRICE"
                HtmlEncode="false" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="修正报价<br/>（万元）" DataField="RevisedQuotation"
                HtmlEncode="false" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="报价得分" DataField="QuotationScore" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工期" DataField="WorkTerm" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="质量" DataField="Quality">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>

        $gridCheckedClientID = "<%=this.gvBidUnit.CheckedClientID %>";
    </script>
</asp:Content>
