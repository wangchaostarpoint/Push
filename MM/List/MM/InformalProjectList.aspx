<%@ Page Title="未列入正式工程的信息列表" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="InformalProjectList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.InformalProjectList" %>

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
    <span class="filter-block"><span class="filter-block-lb">工程编号/名称</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch" EnableTheming="False" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" BindGridViewMethod="BindData" PageSize="15" ShowExport="True" UseDefaultDataSource="True"
        AllowFrozing="True" FrozenColNum="4" OnRowCommand="gvList_OnRowCommand" DataKeyNames="MarketProjectID">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%#Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" ToolTip="查看" DataParamFields="MarketProjectID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif" />
            <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" ToolTip="编辑" DataParamFields="MarketProjectID"
                ImageUrl="../../../Themes/Images/btn_dg_edit.gif" />
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ToolTip="删除" DataParamFields="MarketProjectID"
                ImageUrl="../../../Themes/Images/btn_dg_delete.gif" />
            <zhongsoft:LightBoundField HeaderText="业务版块" DataField="BusinessPlate" />
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" Width="200px" ShowToolTip="True" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="MarketProjectName" />
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="预计开始日期" DataField="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="计划完成日期" DataField="PlanFinishTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="评审状态" DataField="ReviewState" />
            <zhongsoft:LightBoundField HeaderText="评审方式" DataField="CheckMode" />
            <zhongsoft:LightBoundField HeaderText="跟踪状态" DataField="TrackingState" />
            <zhongsoft:LightBoundField HeaderText="跟踪执行人" DataField="TrackingExecutor" />
            <zhongsoft:LightBoundField HeaderText="工程规模" DataField="ProjectScale" ShowToolTip="True" Width="300px" />
            <zhongsoft:LightBoundField HeaderText="工程情况说明" DataField="ProjectDescription" ShowToolTip="True" Width="300px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindData" OnClick="btnBindData_OnClick" Style="display: none" />
    <script type="text/javascript">
        //查看详细信息
        function viewDetail(id) {
            var url = buildBizUrl(1, id, "MM/List/MM/AddToFormalProject.aspx", null);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        //查看详细信息
        function editDetail(id) {
            var url = buildBizUrl(3, id, "MM/List/MM/AddToFormalProject.aspx", null);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, bindData);
            return false;
        }

        //执行后台绑定列表
        function bindData() {
            $('#<%=btnBindData.ClientID %>').click();
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
