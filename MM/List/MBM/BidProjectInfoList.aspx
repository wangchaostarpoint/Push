<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BidProjectInfoList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.BidProjectInfoList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工程名称</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">开标日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBidStart" class="kpms-textbox-comparedate"
            readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBidEnd" class="kpms-textbox-comparedate"
            readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">招标单位</span><span>
        <zhongsoft:LightTextBox ID="tbAgentUnit" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false">
        </zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvBidProject" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="5" UseDefaultDataSource="true"
        AllowSorting="true" AllowFrozing="true" FrozenColNum="2" BindGridViewMethod="BindDataGrid"
        DataKeyNames="TENDERENTITYID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="投标编号" DataField="BIDNUMBER" Width="100" SortExpression="BIDNUMBER">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MARKETPROJECTNAME" SortExpression="MARKETPROJECTNAME"
                ShowToolTip="true" Width="250">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工程类型" DataField="PROJECTTYPENAME" SortExpression="PROJECTTYPENAME"
                Width="90">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="招标单位" DataField="BIDCUSTOMERNAME" Width="350"
                SortExpression="BIDCUSTOMERNAME" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开标日期" DataField="STARTBIDDATE" SortExpression="STARTBIDDATE"
                Width="70" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开标地点" DataField="BidOpenAddress" SortExpression="BidOpenAddress">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="BIDORGDEPTNAME" SortExpression="BIDORGDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="承办部门" DataField="ApplyDeptName" SortExpression="ApplyDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="承办人" DataField="UNDERTAKEUSERNAME" SortExpression="UNDERTAKEUSERNAME">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <%-- <zhongsoft:LightPowerGridView ID="gvBidProjStatistic" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="12" UseDefaultDataSource="true"
        Visible="false" BindGridViewMethod="BindDataGrid" AllowSorting="true" OnRowDataBound="gvBidProjStatistic_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="业务部门" DataField="OrgUnitName" Width="100"
                SortExpression="OrgUnitName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="投标项目数" DataField="ALLCOUNT" SortExpression="ALLCOUNT"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="中标项目数" DataField="HADWIN" SortExpression="HADWIN"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="未揭标项目数" DataField="NOTHASRESULT" SortExpression="NOTHASRESULT"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="中标率" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbBidRate"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="签订合同数" DataField="HASSIGNCONTRACT" SortExpression="HASSIGNCONTRACT"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="签订合同率" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbContractSignRate"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="合同签订总额（万元）" DataField="SUMCONTRACTVALUE" SortExpression="SUMCONTRACTVALUE"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保证金归还数" DataField="SECURITYRETURNNUM" SortExpression="SECURITYRETURNNUM"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="保证金归还率" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbSecurityReturnRate"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>--%>
    <asp:Label runat="server" ID="lbContractInfo"></asp:Label>
    <script>

        $gridCheckedClientID = "<%=this.gvBidProject.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
