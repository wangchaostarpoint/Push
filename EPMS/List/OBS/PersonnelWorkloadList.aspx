<%@ Page Title="人员工作负荷查询" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="PersonnelWorkloadList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.OBS.PersonnelWorkloadList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="150px" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="UserId" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门" ItemStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OrganizationName" HeaderText="科室" ItemStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LoginId" HeaderText="工号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="当前工作" ItemStyle-Width="500px">
                <ItemTemplate>
                    <%--<asp:LinkButton ID="lbtnWorkInfo" runat="server" EnableTheming="false" ForeColor="Blue"></asp:LinkButton>--%>
                    <a runat="server" id="aWorkInfo" class="aStyle" title="点击查看详细"></a>
                    <input type="hidden" id="hiKeyID" runat="server" value='<%#Eval("UserId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function viewCurrWork(userId) {
            var url = buildQueryUrl("/EPMS/List/OBS/CurrentTaskDetailList.aspx", { secid: "c3455630-e393-4f75-b471-0e9151c39a6b", IsDashboard: "1", ShowToolbar: "1", userId: userId });
            showDivDialog(url, null, 1000, 600, '');
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
