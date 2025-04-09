<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesignChangeApply.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.DesignChangeApply" MasterPageFile="~/UI/Master/ObjectList.Master" Title="设计变更申请" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">变更编号</span> <span>
        <zhongsoft:LightTextBox ID="tbChangeCode" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《设计变更申请》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvDiscloseRecord" AutoGenerateColumns="false" ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true" ShowPageSizeChange="true" PageSize="10">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyDeptName" HeaderText="申请部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请时间" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更类型" DataField="ChangeType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更编号" DataField="ChangeCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更原因" DataField="ChangeReason" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变更内容" DataField="ChangeContent" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="流程状态" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%# Convert.ToString(Eval("Flag"))=="1"?"结束":"流转中" %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="相关流程" EditItemClick="viewFormDetail"
                ImageUrl="../../../Themes/Images/btn_dg_detail.gif" DataParamFields="DesignChangeApplyID,IsOld" ItemStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        //发起《设计变更申请》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EMPSDesignChange.xpdl', xpdlId: 'EMPSDesignChange_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EMPSDesignChange.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
