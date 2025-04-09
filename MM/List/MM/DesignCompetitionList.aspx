<%@ Page Title="设计竞赛管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="DesignCompetitionList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.DesignCompetitionList" %>

<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务版块</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlat" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">所属工程包</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectPackage" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">业绩状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPerformanceStatus" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15" ShowExport="True" 
                                  BindGridViewMethod="BindData" DataKeyNames="ProjectManagerID" OnRowDataBound="gvList_OnRowDataBound" HideFieldOnExport="编辑">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" ToolTip="查看" DataParamFields="MarketProjectID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif" ItemStyle-Width="30px"/>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnEdit" CommandName="ViewData" EnableTheming="false" ToolTip="编辑">
                        <img alt="" src="../../../Themes/Images/btn_dg_edit.gif" onclick="return editDetail('<%#Eval("MarketProjectID")%>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="业务板块" DataField="BusinessPlate" />
            <zhongsoft:LightBoundField HeaderText="工程包" DataField="ProjectPackage" />
            <zhongsoft:LightBoundField HeaderText="工程编号" DataField="MarketProjectCode" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MarketProjectName" />
            <zhongsoft:LightBoundField HeaderText="业主单位" DataField="CustomerName" />
            <zhongsoft:LightBoundField HeaderText="项目地点" DataField="BuildPlace" />
            <zhongsoft:LightBoundField HeaderText="业绩状态" DataField="PerformanceStatus" />
            <zhongsoft:LightBoundField HeaderText="规模" DataField="ProjectScale" Width="100px" ShowToolTip="True" />
            <zhongsoft:LightBoundField HeaderText="投资金额" DataField="ProjectInvestment" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="设计竞赛结果" DataField="DesignCompetitionResults" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnReLoadData" runat="server" Visible="false" OnClick="btnReLoadData_OnClick" />
    <script type="text/javascript">
        //查看详细信息
        function viewDetail(id) {
            var url = buildBizUrl(1, id, "MM/List/MM/PerformanceAndDesignEditor.aspx", { listType: "<%=(int)ProjectListType.设计竞赛管理%>" });
            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        //编辑详细信息
        function editDetail(id) {
            var url = buildBizUrl(3, id, "MM/List/MM/PerformanceAndDesignEditor.aspx", { listType: "<%=(int)ProjectListType.设计竞赛管理%>" });
            showDivDialog(url, null, 850, 550, loadDataCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function loadDataCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnReLoadData,"") %>
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
