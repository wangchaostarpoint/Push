<%@ Page Language="C#"  Title="勘测设计工作计划" AutoEventWireup="true" CodeBehind="SurveyDesignWorkPlanList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.SurveyDesignWorkPlanList" MasterPageFile="~/UI/Master/ObjectList.Master" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">子项目名称</span><span>
        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">子项目编号</span><span>
        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《勘测设计工作计划》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
        PageSize="15" DataKeyNames="SurveyDesignWorkPlanID" ShowExport="true" BindGridViewMethod="BindGrid" 
        UseDefaultDataSource="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="子项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="子项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否涉密项目" SortExpression="IsSecretProject" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Eval("IsSecretProject")==DBNull.Value?"":Enum.GetName(typeof(BoolType),Convert.ToInt32(Eval("IsSecretProject"))) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="密级" SortExpression="SecretLevel" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Eval("SecretLevel")==DBNull.Value?"":Enum.GetName(typeof(SecretLevel), Convert.ToInt32(Eval("SecretLevel"))) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return openWorkFlow("<%#Eval("SurveyDesignWorkPlanID") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function openWorkFlow(bizid) {
            var url = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizid });
            window.open(url);
        }
        //发起《勘测设计工作计划》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSSurveyDesignWorkPlan.xpdl', xpdlId: 'EPMSSurveyDesignWorkPlan_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSSurveyDesignWorkPlan.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
