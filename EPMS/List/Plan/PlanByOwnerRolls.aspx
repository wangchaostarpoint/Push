<%@ Page Title="" Language="C#" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    AutoEventWireup="true" CodeBehind="PlanByOwnerRolls.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.PlanByOwnerRolls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="fixedFilter" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">月份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">人员名称/工号</span>
        <span>
            <asp:TextBox ID="tbUserInfo" search="1" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span>
    <%--<span class="filter-block"><span class="filter-block-lb">工程类型</span> <span>
                    <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Style="margin: 3px 0px;">
                    </zhongsoft:LightDropDownList>
                </span></span>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WBSOwnerID,RollAlertInfo" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" EmptyDataText="没有要查找的数据">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="WBSOwnerCode" HeaderText="工号" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="姓名" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="预警提醒">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbAlertInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"1\")", Eval("WBSOwnerID")) %>'
                        Text='<%#Eval("RollAlertInfo").ToString().Length > 5 ? Eval("RollAlertInfo").ToString().Substring(0, 5) + "..." : Eval("RollAlertInfo") %>'
                        ToolTip='<%#Eval("RollAlertInfo") %>' EnableTheming="false" ForeColor="Blue"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="BelongDeptName" HeaderText="科室" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollsNumber" HeaderText="卷册总数" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LestMonthCompleteNumber" HeaderText="上期累计完成"
                ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanNumber" HeaderText="本月安排" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanningNumber" HeaderText="计划进行" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteNumber" HeaderText="计划完成" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteNumber" HeaderText="实际完成" ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteNumberPercent" HeaderText="计划累计完成%"
                ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteNumberPercent" HeaderText="实际累计完成%"
                ItemStyle-Width="100px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function openRollList(userID, showWaringRow) {
            var roleName = "Sjr";
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { UserID: userID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', RoleName: roleName, IsShowAllButn: 'false', ShowWaringRow: showWaringRow });
            showDivDialog(url, null, 1200, 600, null);

            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
