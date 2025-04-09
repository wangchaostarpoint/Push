<%@ Page Language="C#" AutoEventWireup="true" Title="项目经费使用记录" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="ProjectFundsList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.ProjectFundsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="advSearch" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <%--查询条件1--%>
    <span class="filter-block"><span class="filter-block-lb">填写人</span> <span>
        <zhongsoft:LightTextBox ID="tbWriteUser" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">填写日期</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>-
        <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">花销金额（元）</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectFunds1" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="Decimal2" ></zhongsoft:LightTextBox>
        -
        <zhongsoft:LightTextBox runat="server" ID="tbProjectFunds2" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="Decimal2" ></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvProjFundsList" AllowPaging="True" PageSize="20"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="ProjectFundsID"
        UseDefaultDataSource="false" BindGridViewMethod="BindProjFundsList" ShowFooter="true" OnRowDataBound="gvProjFundsList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WriteUserName" SortExpression="WriteUserName" HeaderText="填写人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WriteDate" SortExpression="WriteDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="填写日期">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectFunds" SortExpression="ProjectFunds" ItemStyle-HorizontalAlign="Right" HeaderText="花销金额（元）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectFundsDec" SortExpression="ProjectFundsDec" HeaderText="花销说明">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightTemplateField HeaderText="花销说明">
                <ItemTemplate>
                    
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <%--JS区域--%>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvProjFundsList.CheckedClientID %>";

        //页面加载执行
        function initCustomerPlugin() {

        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
