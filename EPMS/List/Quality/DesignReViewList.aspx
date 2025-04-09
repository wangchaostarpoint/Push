<%@ Page Language="C#" Title="设计评审" AutoEventWireup="true" CodeBehind="DesignReViewList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.DesignReViewList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

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
    <span class="filter-block"><span class="filter-block-lb">评审编号</span><span>
        <zhongsoft:LightTextBox ID="txtSerialNumber" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">评审级别</span><span>
        <zhongsoft:LightDropDownList ID="ddlReViewLevel" runat="server"></zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">评审时间</span><span>
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
                <h4>发起《设计评审》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
        PageSize="15" DataKeyNames="QualityActivityOfProjectID" ShowExport="true" BindGridViewMethod="BindGrid" UseDefaultDataSource="true"
        HideFieldOnExport="查看">
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
            <zhongsoft:LightBoundField HeaderText="评审编号" DataField="SerialNumber">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="评审级别" DataField="ReViewLevel">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="评审时间" DataField="InnerTime" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="评审内容" DataField="ActivityContent" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="评审方式" DataField="ReViewMethod">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="评审组长" DataField="InnerEmceeUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="记录人" DataField="StartUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="参加人员" DataField="InnerParticipantName" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return openWorkFlow("<%#Eval("QualityActivityOfProjectID") %>");' />
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
        //发起《设计评审》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSDesignReView.xpdl', xpdlId: 'EPMSDesignReView_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSDesignReView.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
