<%@ Page Language="C#" AutoEventWireup="true" Title="印制费用统计" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="PublishConsignPriceList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishConsignPriceList" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb"></span><span>
        <asp:RadioButtonList runat="server" ID="rblSearchType" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblSearchType_OnSelectedIndexChanged">
            <asp:ListItem runat="server" Text="按项目" Value="1" Selected="True"></asp:ListItem>
            <asp:ListItem runat="server" Text="按部门" Value="2"></asp:ListItem>
        </asp:RadioButtonList>
    </span></span>
    <span class="filter-block" flag="Proj"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbProject" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>

    <span class="filter-block" flag="Dept"><span class="filter-block-lb">申请部门：</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请时间：</span> <span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTimeStart" class="kpms-textbox-comparedate" activestatus="(23.*)" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTimeEnd" class="kpms-textbox-comparedate" activestatus="(23.*)" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <%--自定义按钮--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="OrganizationID"
        UseDefaultDataSource="true" BindGridViewMethod="BindList" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看项目" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看"
                             onclick="queryPrint('<%# Eval("OrganizationID") %>','');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看部门" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看"
                             onclick="queryPrint('','<%# Eval("ConsignDeptID") %>');" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="ConsignDeptName" />
            <zhongsoft:LightBoundField HeaderText="印制费用" DataField="ChargeSum" ItemStyle-HorizontalAlign="Right" />
        </Columns>
    </zhongsoft:LightPowerGridView>

    <%--JS区域--%>
    <script type="text/javascript">

        //页面加载执行
        function initCustomerPlugin() {
            $("#<%=rblSearchType.ClientID %> input[type=radio]").each(function () {
                $(this).bind('click', function () {
                    onSearchTypeChange();
                });
            });
            onSearchTypeChange();
        }
        function onSearchTypeChange() {
            var selectVal = $("#<%=rblSearchType.ClientID %> input[type=radio]:checked").val();
            if (selectVal != 2) {
                $("[flag='Proj']").show();
                $("[flag='Dept']").hide();
                $("#<%=ddlDept.ClientID%>").val('');
            } else {
                $("[flag='Proj']").hide();
                <%--$("#<%=txtConsignTimeEnd.ClientID%>").val('');
                $("#<%=txtConsignTimeStart.ClientID%>").val('');--%>
                $("#<%=tbProject.ClientID%>").val('');
                $("[flag='Dept']").show();
            }
        }
        //查看印制申请单
        function queryPrint(organizationID, deptID) {
            var timeStart = $("#<%=txtConsignTimeStart.ClientID%>").val();
            var timeEnd = $("#<%=txtConsignTimeEnd.ClientID%>").val();
            var url = buildQueryUrl("/EPMS/List/Publish/PublishConsignApplyList.aspx", { organizationID: organizationID, deptid: deptID, timeStart: timeStart, timeEnd: timeEnd });
            showDivDialog(url, null, 1000, 500, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>