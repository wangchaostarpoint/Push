<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptUsersWorkDay.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.DeptUsersWorkDay" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="工作进度填报统计" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="180px">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">年</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">月</span> <span>
        <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">人员</span> <span>
        <asp:TextBox ID="tbUserInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
        DataKeyNames="UserId" ShowExport="true" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" AllowSorting="true" HideFieldOnExport="详细">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="年月" DataField="YearAndMonth" SortExpression="YearAndMonthSort">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="OrgUnitName" SortExpression="OrgUnitName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="人员" DataField="UserName" SortExpression="UserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="填报状态" DataField="WriteState" SortExpression="WriteState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成工天" DataField="WorkDay" SortExpression="WorkDay">
                <ItemStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="填报日期" DataField="CreateDate" SortExpression="CreateDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="详细" CommandName="viewData" EditItemClick="viewUserWorkDetail"
                DataParamFields="UserId,M">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initPagePlugin() {
            $("#trleader").hide();
        }

        function viewUserWorkDetail(userID, month) {
            var year = $("#<%=ddlYear.ClientID %> option:selected").val();
            var url = buildQueryUrl("/EPMS/List/Sys/DeptUsersWorkDayDetail.aspx", { UserID: userID, Year: year, Month: month, secid: '8C1C9189-E3B3-4ED4-B04B-4CCA7AB6B864' });
            showDivDialog(url, null, 1000, 550, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
