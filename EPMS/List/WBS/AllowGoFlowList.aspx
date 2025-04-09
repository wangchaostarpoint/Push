<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllowGoFlowList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.AllowGoFlowList" Title="产品特殊放行" MasterPageFile="~/UI/Master/ObjectList.Master"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">任务编号</span> <span>
        <zhongsoft:LightTextBox ID="tbWBSCode" search="1" runat="server" MaxLength="64"
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
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="特殊放行申请原因" DataField="AllowReason" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="校审类型" DataField="VerifyType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="相关流程" EditItemClick="viewFormDetail"
                ImageUrl="../../../Themes/Images/btn_dg_detail.gif" DataParamFields="AllowGoFlowID,IsOld" ItemStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
