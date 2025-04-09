<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjMthPlanWBSDetailList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjMthPlanWBSDetailList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" style="display: none"><span class="filter-block-lb">计划周期</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanCycle" AutoPostBack="true"
                class="kpms-ddlsearch" EnableTheming="false" OnSelectedIndexChanged="lbtnReBindTimeDll_Click">
            </zhongsoft:LightDropDownList>
        </span></span>
    <!----->
    <span class="filter-block" id="ddlPlanYearSpan" runat="server"><span class="filter-block-lb">
        计划年度</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanYear" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
    <!----->
    <span class="filter-block" id="ddlPlanPeriodSpan" runat="server"><span class="filter-block-lb">
        <asp:Label runat="server" ID="lbPlanCycle" secondflag="noYear">计划月度</asp:Label>
    </span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPlanPeriod" class="kpms-ddlsearch"
            EnableTheming="false" secondflag="noYear">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false">
        </zhongsoft:LightTextBox>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false">
        </zhongsoft:LightTextBox>
    </span></span>
    <!----->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">项目设总</span> <span>
        <zhongsoft:LightTextBox ID="tbManagerName" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged"
            EnableTheming="false" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">专业室</span><span>
        <zhongsoft:LightDropDownList ID="ddlRoom" runat="server" OnSelectedIndexChanged="ddlRoom_SelectedIndexChanged"
            class="kpms-ddlsearch" EnableTheming="false" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!----->
    <span class="filter-block"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList ID="ddlSpecial" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <!-- 第二行 -->
    <br />
    <span class="filter-block"><span class="filter-block-lb">卷册状态</span><span>
        <zhongsoft:LightDropDownList ID="ddlWBSState" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">卷册负责人</span><span>
        <zhongsoft:LightTextBox ID="tbWBSOwnerName" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">室交出时间</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSPlanRecheckTime1" runat="server"
                readonly="readonly" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtFPlanRecheckTime1" runat="server"
                readonly="readonly" />
        </span></span><span class="filter-block"><span class="filter-block-lb">部交出时间</span>
            <span>
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSPlanRecheckTime2" runat="server"
                    readonly="readonly" />
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtFPlanRecheckTime2" runat="server"
                    readonly="readonly" />
            </span></span>
    <br />
    <!-- 隐藏项 -->
    <span class="filter-block"><span class="filter-block-lb">卷册来源</span> <span>
        <zhongsoft:LightDropDownList ID="ddlRollFrom" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">是否设总添加</span><span>
        <zhongsoft:LightDropDownList ID="ddlIsDesignAdd" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="0">否</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">卷册所属类别</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlRollType" Width="70px">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">
            卷册安排人</span><span>
                <zhongsoft:LightTextBox ID="tbAddUserName" search="1" runat="server" MaxLength="64"
                    CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
            </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvPlanWBS" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" UseDefaultDataSource="true"
        BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true" AllowFrozing="true"
        FrozenColNum="6" OnRowDataBound="gvPlanWBS_RowDataBound" PageSize="10" FrozenHeight="430px">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="档案袋" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lkRollBag" runat="server" OnClientClick='<%# String.Format("return viewRollInfo(\"{0}\")", Eval("WBSID")) %>'
                        EnableTheming="false" ForeColor="Blue">  <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" /></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="计划年月">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPlanTime"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="卷册来源" DataField="SourceType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设计阶段" DataField="PhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目设总" DataField="ManagerUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="卷册状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbState" Text='<%#Eval("WBSState") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="卷册负责人" DataField="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册安排人" DataField="AddUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="BelongDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划设计<br/>开始时间" HtmlEncode="false" DataField="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划个人<br/>出手时间" HtmlEncode="false" DataField="PlanHandTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划室<br/>交出时间" HtmlEncode="false" DataField="PlanReCheckTime1"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="调整后室<br/>交出时间" HtmlEncode="false" DataField="AdustRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际室<br/>交出时间" DataField="FactReCheckTime1"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际部<br/>交出时间" DataField="FactReCheckTime2"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划院<br/>交出时间" DataField="PlanCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="调整后院<br/>交出时间" DataField="AdustCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际院<br/>交出时间" DataField="FactCompleteTime"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="业主<br/>要求进度" DataField="MasterDemandSchedule"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <%--  <zhongsoft:LightButtonField HeaderText="档案袋" CommandName="ViewData" DataParamFields="WBSID"
                EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function viewRollInfo(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/RollFileBag.aspx", { actionType: 1, bizId: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
