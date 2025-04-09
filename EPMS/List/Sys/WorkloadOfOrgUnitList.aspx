<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkloadOfOrgUnitList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.WorkloadOfOrgUnitList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年&nbsp;份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYears" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">月&nbsp;份</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlMonths" runat="server" class="kpms-ddlsearch"
                EnableTheming="false" Width="60">
            </zhongsoft:LightDropDownList>
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
            <zhongsoft:LightBoundField HeaderText="科室" DataField="DeptName" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="生产人数" DataField="EmployeeNum" SortExpression="EmployeeNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="年份" DataField="StatYear" SortExpression="StatYear">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月份" DataField="StatMonth" SortExpression="StatMonth">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="人均负荷">
                <ItemTemplate>
                    <span avgworkload='<%#Eval("DeptID") %>'></span>
                </ItemTemplate>
                <ItemStyle Width="80px" />
            </zhongsoft:LightTemplateField>
            <%--<zhongsoft:LightTemplateField HeaderText="完成定额（人/天）" Visible="false">
                <ItemTemplate>
                    <span workdayofcomplete='<%#Eval("DeptID") %>'></span>
                </ItemTemplate>
                <ItemStyle Width="80px" />
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightButtonField HeaderText="人员明细" CommandName="ViewData" EditItemClick="openUserWorkload"
                DataParamFields="DeptID">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <%--图表插件--%>
    <zhongsoft:EChart ID="EChartWorkload" runat="server" Width="600" Height="250px" MainTitle="科室负荷分析折线图">
    </zhongsoft:EChart>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWorkload.CheckedClientID %>";

        function openUserWorkload(deptid) {
            var year = $("#<%=ddlYears.ClientID %>").find("option:selected").val();
            var month = $("#<%=ddlMonths.ClientID %>").find("option:selected").val();
            var url = buildQueryUrl("/EPMS/List/Sys/WorkloadOfUserMonthList.aspx", { secid: '8B9D8D08-BCB5-405E-AA4A-4899BF5DB628', 'DeptID': deptid, Year: year, Month: month });
            showDivDialog(url, null, 900, 600, null);
            return false
        }

        function initPagePlugin() {
            getDeptInfo();
        }
        //异步加载 部门名称、人均负荷、完成定额
        function getDeptInfo() {
            var year = $("#<%=ddlYears.ClientID %>").find("option:selected").val();
            var month = $("#<%=ddlMonths.ClientID %>").find("option:selected").val();

            var $ids = "";
            $("#<%=gvWorkload.ClientID %> span[avgworkload]").each(function () {
                $ids += $(this).attr("avgworkload") + "|";
            });
            $.post("WorkloadOfDeptMonthList.aspx",
                 { asyfunc: "GetDeptInfo", deptIdList: $ids, strYear: year, steMonth: month },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //人均负荷
                     $("#<%=gvWorkload.ClientID %> span[avgworkload]").each(function () {
                         var $avgworkload = $(this).attr("avgworkload");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][2];
                             if ($avgworkload == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });

                     //完成定额
                     $("#<%=gvWorkload.ClientID %> span[workdayofcomplete]").each(function () {
                         var $workdayofcomplete = $(this).attr("workdayofcomplete");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][3];
                             if ($workdayofcomplete == $id) {
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
