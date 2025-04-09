<%@ Page Language="C#" AutoEventWireup="true" Title="出案印制归档" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ArchivedProductList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.ArchivedProductList" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <%--查询条件1--%>
    <span class="filter-block">
        <span class="filter-block-lb">专业</span>
        <span>
            <zhongsoft:LightTextBox ID="tbBelongSpecialtyName" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">归档状态</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlIsArchived" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Value="" Selected="True">全部</asp:ListItem>
                <asp:ListItem Value="1">已归档</asp:ListItem>
                <asp:ListItem Value="0">未归档</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《出案印制归档申请》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <%--自定义按钮--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="WBSID"
        UseDefaultDataSource="false" BindGridViewMethod="BindList" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="ExecSpecialtyName" />
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode" />
            <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName" />
            <zhongsoft:LightBoundField HeaderText="归档状态" DataField="IsArchived" />
        </Columns>
    </zhongsoft:LightPowerGridView>

    <%--JS区域--%>
    <script type="text/javascript">

        //页面加载执行
        function initCustomerPlugin() {

        }
        //查看流程
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 0, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //发起《出案印制归档申请》
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MMPublishAndArchiveApply.xpdl', xpdlId: 'MMPublishAndArchiveApply_wp1', formId: '<%=FormHelper.GetFormIdByPackage("MMPublishAndArchiveApply.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url, "workspace");
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
