<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiscloseRecordList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.DiscloseRecordList" MasterPageFile="~/UI/Master/ObjectList.Master" Title="安全环保交底" %>


<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">记录编号</span> <span>
        <zhongsoft:LightTextBox ID="tbRecordCode" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvDiscloseRecord" AutoGenerateColumns="false" ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true" ShowPageSizeChange="true" PageSize="10">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="记录人" DataField="RecordUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DiscloseUserName" HeaderText="交底人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="时间" DataField="RecordDate" DataFormatString="{0:yyyy-MM-dd}">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="记录编号" DataField="RecordCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="地点" DataField="RecordPlace" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="参加人员" DataField="JoinUserName" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="主要内容" DataField="MainContent" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="相关流程" EditItemClick="viewFormDetail"
                ImageUrl="../../../Themes/Images/btn_dg_detail.gif" DataParamFields="DiscloseRecordID,IsOld" ItemStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
