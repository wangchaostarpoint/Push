<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishConsignList"
    Title="交付" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="150px">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请人</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbConsignUserName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <%if (Request.QueryString["ViewPublishInfo"] == null)
        {
            if (Request.QueryString["ConsignTypeID"] == Zhongsoft.Portal.EPMS.NewPublishConsignType.出案印制归档申请.GetHashCode().ToString())
            {
    %>
    <br />
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF1()">
                <h4>发起《出案印制归档申请》</h4>
            </a></span>
    </span>
    <%
        }
        else if (Request.QueryString["ConsignTypeID"] == Zhongsoft.Portal.EPMS.NewPublishConsignType.普通印制申请.GetHashCode().ToString())
        {
    %>
    <br />
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF2()">
                <h4>发起《普通印制申请》</h4>
            </a></span>
    </span>
    <%
            }
        }
    %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" ShowExport="True" AllowPaging="True" PageSize="15" BindGridViewMethod="BindData"
        UseDefaultDataSource="True" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看出版单"
                             onclick="viewForm('<%# Eval("PublishConsignID") %>','');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="出版类型" DataField="ConsignTypeName" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode" />
            <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ConsignUserName" />
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="ConsignDeptName" />
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ConsignTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="计划完成" DataField="PlanSendTime" DataFormatString="{0:yyyy-MM-dd}" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="实际完成" DataField="FactSendTime" DataFormatString="{0:yyyy-MM-dd}" Visible="false" />
            <zhongsoft:LightBoundField HeaderText="状态" DataField="FormState" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 0, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //发起《出案印制归档申请》
        function startStateWF1() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MMPublishAndArchiveApply.xpdl', xpdlId: 'MMPublishAndArchiveApply_wp1', formId: '<%=FormHelper.GetFormIdByPackage("MMPublishAndArchiveApply.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url, "workspace");
            return false;
        }

        //发起《普通印制申请》
        function startStateWF2() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSPublishConsign4Normal.xpdl', xpdlId: 'EPMSPublishConsign4Normal_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSPublishConsign4Normal.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url, "workspace");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
