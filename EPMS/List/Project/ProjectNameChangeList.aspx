<%@ Page Language="C#" AutoEventWireup="true" Title="项目名称变更" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjectNameChangeList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectNameChangeList" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <%--查询条件1--%>
    <span class="filter-block"><span class="filter-block-lb">变更后名称</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectNameOfChanged" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《项目名称变更》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <%--自定义按钮--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvProjectNameChangeList" AllowPaging="True" PageSize="100"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="ProjectNameChangeID"
        UseDefaultDataSource="false" BindGridViewMethod="BindProjectNameChangeList" OnRowDataBound="gvProjectNameChangeList_RowDataBound"
        OnRowCommand="gvProjectNameChangeList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看"
                             onclick="viewForm('<%# Eval("ProjectNameChangeID") %>','');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="变更后名称" DataField="ProjectNameOfChanged" />
            <zhongsoft:LightBoundField HeaderText="变更前名称" DataField="ProjectNameOfOriginal" />
            <zhongsoft:LightBoundField HeaderText="变更原因" DataField="ChangeReason" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName" />
            <zhongsoft:LightBoundField HeaderText="申请时间" DataField="ApplyDate"  DataFormatString="{0:yyyy-MM-dd}" />
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
        //发起《项目名称变更》
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSProjectNameChange.xpdl', xpdlId: 'ProjectNameChange_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProjectNameChange.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            //发起流程在当前页面打开
            window.open(url, "workspace");
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
