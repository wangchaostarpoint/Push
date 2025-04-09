<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectInfoRecordList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.ProjectInfoRecordList" Title="项目有关签认/回函/工地备忘录审批记录表" MasterPageFile="~/UI/Master/ObjectList.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">签认/回函单位</span> <span>
        <zhongsoft:LightTextBox ID="tbSignDeptName" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false" ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true" ShowPageSizeChange="true" PageSize="10">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="签认/回函单位" DataField="SignDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="记录人" DataField="RecordUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="记录时间" DataField="RecordDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更类型" DataField="ChangeType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="拟处理意见" DataField="Opinions" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="相关流程" EditItemClick="viewFormDetail"
                ImageUrl="../../../Themes/Images/btn_dg_detail.gif" DataParamFields="ProjectInfoRecordID,IsOld" ItemStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
