<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkSummaryList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.WorkSummaryList" Title="设代工作总结" MasterPageFile="~/UI/Master/ObjectList.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">编写说明</span> <span>
        <zhongsoft:LightTextBox ID="tbWriteExplain" search="1" runat="server" MaxLength="64"
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
            <zhongsoft:LightBoundField HeaderText="编写人" DataField="WriteUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编写日期" DataField="WriteExplain" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编写说明" DataField="WriteExplain" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="相关流程" EditItemClick="viewFormDetail"
                ImageUrl="../../../Themes/Images/btn_dg_detail.gif" DataParamFields="WorkSummaryID,IsOld" ItemStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
