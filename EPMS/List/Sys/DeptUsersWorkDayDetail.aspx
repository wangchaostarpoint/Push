<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptUsersWorkDayDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.DeptUsersWorkDayDetail" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="工作进度填报明细" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="180px">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">
        年</span> <span>
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
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false"
        AllowSorting="true" DataKeyNames="WBSID" UseDefaultDataSource="true" AllowPaging="true"
        PageSize="6" ShowExport="true" ShowPageSizeChange="false" AllowFrozing="true"
        FrozenColNum="8" Width="200px">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                <ItemStyle Width="100px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目名称">
                <ItemStyle Width="100px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkType" HeaderText="工作类别">
                <ItemStyle Width="100px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                <ItemStyle Width="100px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="任务名称">
                <ItemTemplate>
                    <div tip="1" style="width: 100px" class="autoskip" title='<%#Eval("WBSName") %>'>
                        <%#Eval("WBSName")%></div>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PartakerUserName" HeaderText="人员姓名">
                <HeaderStyle Width="100px"></HeaderStyle>
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="累计完成%">
                <ItemTemplate>
                    <%#Eval("CompleteRate")%>%
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="完成日期">
                <ItemTemplate>
                    <%#Eval("CompleteDate")%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WorkDayOfComplete" HeaderText="完成工天" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注(进展描述)">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExistProblems" HeaderText="存在的问题">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Measures" HeaderText="解决措施">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="任务负责人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfDesign" HeaderText="设计工天">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfCheck" HeaderText="校核工天">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfRecheck" HeaderText="审核工天">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfConfirm" HeaderText="批准工天">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactStartTime" HeaderText="实际开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanHandTime" HeaderText="计划设计完成" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactHandTime" HeaderText="实际设计完成" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanRecheckTime1" HeaderText="计划审核完成" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactRecheckTime1" HeaderText="实际审核完成" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际完成日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initPagePlugin() {
            $("#trleader").hide();
        }
        function openWbsDetail(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
