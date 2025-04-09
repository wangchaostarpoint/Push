<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkloadOfUserMonthList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.WorkloadOfUserMonthList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年&nbsp;份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYears" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">月&nbsp;份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlMonths" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="60">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">部&nbsp;门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">人&nbsp;员</span> <span>
        <asp:TextBox ID="tbUserInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style>
        body, html
        {
            overflow: hidden;
        }
    </style>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWorkload" AutoGenerateColumns="false"
        DataKeyNames="" ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>           
            <zhongsoft:LightTemplateField HeaderText="部门">
                <ItemTemplate>
                    <span userid='<%#Eval("EmployeeCode") %>'></span>
                </ItemTemplate>
                <ItemStyle Width="120px" />
            </zhongsoft:LightTemplateField>
             <zhongsoft:LightBoundField HeaderText="科室" DataField="DeptName" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="EmployeeCode" SortExpression="EmployeeCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="EmployeeName" SortExpression="EmployeeName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成定额（人/天）" DataField="WorkDayOfComplete" SortExpression="WorkDayOfComplete">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="人力负荷" DataField="Workload" SortExpression="Workload">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="详细" CommandName="ViewData" EditItemClick="openUserWorkload" DataParamFields="EmployeeID">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWorkload.CheckedClientID %>";
        function initPagePlugin() {
            getDeptName();
        }

        function openUserWorkload(userid) {
            var year = $("#<%=ddlYears.ClientID %>").find("option:selected").val();
            var month = $("#<%=ddlMonths.ClientID %>").find("option:selected").val();
            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfUserList.aspx", { secid: '4998EE31-928C-49B4-A652-12EB1FB83AEE', 'UserID': userid, Year: year, Month: month });
            showDivDialog(url, null, 900, 600, null);
            return false
        }

        //异步加载部门信息
        function getDeptName() {
            var $ids = "";
            $("#<%=gvWorkload.ClientID %> span[userid]").each(function () {
                $ids += $(this).attr("userid") + "|";
            });
            $.post("WorkloadOfUserMonthList.aspx",
                 { asyfunc: "GetDeptName", userIdList: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     $("#<%=gvWorkload.ClientID %> span[userid]").each(function () {
                         var $userid = $(this).attr("userid");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][1];
                             if ($userid == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                 }
                );
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
