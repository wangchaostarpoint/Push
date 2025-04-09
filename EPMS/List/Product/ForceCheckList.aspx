<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForceCheckList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Product.ForceCheckList" Title="产品涉及工程建设标准强制性条文执行情况检查表" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">编号</span> <span>
        <zhongsoft:LightTextBox ID="tbForceCode" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《产品涉及工程建设标准强制性条文执行情况检查表》</h4>
            </a></span>
    </span>
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
            <zhongsoft:LightBoundField HeaderText="产品名称" DataField="ProductName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="检查专业" DataField="CheckSpecialtyNames">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="ForceCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="流程状态" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%# Convert.ToString(Eval("Flag"))=="1"?"结束":"流转中" %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="相关流程" EditItemClick="viewFormDetail"
                ImageUrl="../../../Themes/Images/btn_dg_detail.gif" DataParamFields="ForceCheckID,IsOld" ItemStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        //发起《产品涉及工程建设标准强制性条文执行情况检查表》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSForceCheck.xpdl', xpdlId: 'EPMSForceCheck_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSForceCheck.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
