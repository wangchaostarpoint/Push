<%@ Page Language="C#" AutoEventWireup="true" Title="设计工作往来联系单" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="WorkContactList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.WorkContactList" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工作主题</span> <span>
        <zhongsoft:LightTextBox ID="tbWorkTheme" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《设计工作往来联系单》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <%--自定义按钮--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="100"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="WorkContactFormID"
        UseDefaultDataSource="false" BindGridViewMethod="BindList" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
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
                             onclick="viewForm('<%# Eval("WorkContactFormID") %>','');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="工作主题" DataField="WorkTheme" />
            <zhongsoft:LightBoundField HeaderText="提出人" DataField="PutUserName" />
            <zhongsoft:LightBoundField HeaderText="提出部门" DataField="PutDeptName" />
            <zhongsoft:LightBoundField HeaderText="提出专业" DataField="PutSpecialtyName" />
            <zhongsoft:LightBoundField HeaderText="提出时间" DataField="PutDate"  DataFormatString="{0:yyyy-MM-dd}" />
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
        //发起《设计工作往来联系单》
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSLinkBetweenDesign.xpdl', xpdlId: 'EPMSLinkBetweenDesign_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSLinkBetweenDesign.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            //发起流程在当前页面打开
            window.open(url, "workspace");
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
