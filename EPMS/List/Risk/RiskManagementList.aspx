<%@ Page Language="C#" Title="部门/项目风险管理表" AutoEventWireup="true" CodeBehind="RiskManagementList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Risk.RiskManagementList" MasterPageFile="~/UI/Master/ObjectList.Master" %>
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
    <span class="filter-block"><span class="filter-block-lb">申报人</span><span>
        <zhongsoft:LightTextBox ID="tbApplyUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申报时间</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《部门/项目风险管理表》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
        PageSize="15" DataKeyNames="RiskManagementID" ShowExport="true" BindGridViewMethod="BindGrid" UseDefaultDataSource="true">
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
            <zhongsoft:LightBoundField HeaderText="申报人" DataField="ApplyUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申报时间" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="分析评估人员" DataField="AssessUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目负责人" DataField="ManagerUserName">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return openWorkFlow("<%#Eval("RiskManagementID") %>");' />
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
        //发起《部门/项目风险管理表》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSRiskManagement.xpdl', xpdlId: 'EPMSRiskManagement_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSRiskManagement.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
