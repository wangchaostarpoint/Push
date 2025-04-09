<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractProjSheduleList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ContractProjSheduleList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">市场项目编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbMarketProjectInfo" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView ID="gvShedule" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="10" UseDefaultDataSource="true"
        AllowSorting="true" BindGridViewMethod="BindShedule" ShowPageSizeChange="true" SelfIdColumn="MarketProjectID" 
        ParentIdColumn="ParentID" OnRowDataBound="gvShedule_RowDataBound" AllowFrozing="true" FrozenColNum="4" OnBeforeExporting="gvShedule_BeforeExporting" DataKeyNames="ParentID,ContractID,MARKETPROJECTID,RelMarketProjectID,PROJECTCODE,MARKETPROJECTNAME">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号"  ItemStyle-Width="30px">
                <ItemTemplate>
                    <%# gvShedule.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="市场项目名称及合同名称"  SortExpression="CONTRACTNAME"  >
                <ItemTemplate>
                    <asp:Label  runat="server" ID="lbCONTRACTNAME" Text=""></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同编号" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblCONTRACTCODE" Text=''></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%--<zhongsoft:LightBoundField HeaderText="设计阶段" DataField="MarketProjectName" 
                ShowToolTip="true" SortExpression="MarketProjectName">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightTemplateField  HeaderText="设计阶段"  SortExpression="MarketProjectName">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbMarketProjectName" Text=""></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同额（万元）" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbCheckValue" Text=''></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同进度应收<br/>款(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbShouldGetValue" Text=''></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="已收款(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbHadCharge"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="应收款-已收款<br/>(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbHadNotCharge"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="收款细项(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbSkmx" Text=''></asp:Label>
                    <a href="javascript:;" onclick="ShowDialog()"></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同相对方" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbwtf" Text=''></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:TreeGridView>
    <input type="hidden" runat="server" id="hiXml" />
    <script type="text/javascript">
        var rollXmlDoc = new KPMSXml();
        function initCustomerPlugin() {
            
        }
        function ShowDialog(url) {
            showDivDialog(url, "", 1000, 600, null);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
