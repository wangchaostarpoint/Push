<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkloadOfProjectList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.WorkloadOfProjectList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">设计人</span> <span>
            <asp:TextBox ID="tbUserInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
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
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="科室" DataField="BelongDeptName" SortExpression="BelongDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成定额" DataField="WorkDayOfFact" SortExpression="WorkDayOfFact">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="完成百分比%" DataField="CompleteRate" DataFormatString="{0:N2}"
                SortExpression="CompleteRate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计人" DataField="WBSOwnerName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="校核人">
                <ItemTemplate>
                    <span checker='<%#Eval("WBSID") %>'></span>
                </ItemTemplate>
                <ItemStyle Width="120px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="设计完成定额" DataField="WorkDayOfFact" SortExpression="WorkDayOfFact">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="校核完成定额">
                <ItemTemplate>
                    <span workday='<%#Eval("WBSID") %>'></span>
                </ItemTemplate>
                <ItemStyle Width="120px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="详细" CommandName="ViewData" EditItemClick="openDetail"
                DataParamFields="WBSID">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWorkload.CheckedClientID %>";
        function initPagePlugin() {
            getChecker();
        }

        function openDetail(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false
        }

        //异步加载考核人和校核完成定额
        function getChecker() {
            var $ids = "";
            $("#<%=gvWorkload.ClientID %> span[checker]").each(function () {
                $ids += $(this).attr("checker") + "|";
            });
            $.post("WorkloadOfProjectList.aspx",
                 { asyfunc: "GetWbsCheckInfo", wbsid: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //校核人
                     $("#<%=gvWorkload.ClientID %> span[checker]").each(function () {
                         var $checker = $(this).attr("checker");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $name = $l[i][1];
                             if ($checker == $id) {
                                 if ($name == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($name);
                                 }
                             }
                         }
                     });
                     //校核完成定额
                     $("#<%=gvWorkload.ClientID %> span[workday]").each(function () {
                         var $workday = $(this).attr("workday");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $workdays = $l[i][2];
                             if ($workday == $id) {
                                 if ($workdays == "")
                                     $(this).html("0");
                                 else {
                                     $(this).html($workdays);
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
