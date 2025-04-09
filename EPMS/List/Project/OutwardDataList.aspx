<%@ Page Language="C#" Title="向外提供资料单" AutoEventWireup="true" CodeBehind="OutwardDataList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.OutwardDataList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称</span><span>
        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目编号</span><span>
        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">资料名称</span><span>
        <zhongsoft:LightTextBox ID="tbFileName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">资料编号</span><span>
        <zhongsoft:LightTextBox ID="tbFileCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">提出专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlPutSpecialty" runat="server" />
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《向外提供资料单》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
        PageSize="15" DataKeyNames="OutwardDataFormID" ShowExport="true" BindGridViewMethod="BindGrid" UseDefaultDataSource="true"
        HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料名称" DataField="FileName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料编号" DataField="FileCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提出专业" DataField="PutSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="接收单位" DataField="ReceiveUnit">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="接收人" DataField="ReceivePerson">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="提出日期" DataField="PutDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否签署保密协议" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Eval("IsSecret")==DBNull.Value?"":Enum.GetName(typeof(BoolType),Convert.ToInt32(Eval("IsSecret"))) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否签署保密协议" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Eval("IsAgreement")==DBNull.Value?"":Enum.GetName(typeof(BoolType),Convert.ToInt32(Eval("IsAgreement"))) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="事由" DataField="Reason" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资料内容" DataField="FileContent" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return openWorkFlow("<%#Eval("OutwardDataFormID") %>");' />
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
        //发起《向外提供资料单》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSOutwardProvideDocForm.xpdl', xpdlId: 'EPMSOutwardProvideDocForm_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSOutwardProvideDocForm.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
