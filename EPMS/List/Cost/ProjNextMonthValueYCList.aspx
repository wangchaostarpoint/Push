<%@ Page Title="阶段项目下月计划完成产值预测" Language="C#" AutoEventWireup="true" CodeBehind="ProjNextMonthValueYCList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjNextMonthValueYCList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>请选择项目 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            AfterSelect="afterSelect()" ResultForControls="{'hiOrganizationID':'id','tbDate':'FormDate'}"
            TableName="EPMS_ConfirmSpeQuotaForm" Field="ProjectName" req="1"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block"><span>项目立项时间 </span><span>
        <zhongsoft:LightTextBox ID="tbDate" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false" Enabled="false">
        </zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span>开始时间</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBegin" class="kpms-textbox-yearmonthdate"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <%-- <div style="float: right; padding-right: 5px; padding-top: 3px; margin-top: 2px">
        <asp:LinkButton runat="server" class="searchbtn" ID="btnAdvSearch" OnClientClick="return CheckEmpty()">
                     <span>查看合同额变更信息</span>
        </asp:LinkButton></div>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="text-align: center; font-weight: bold; font-size: larger">
        <asp:Label runat="server" ID="lbTitle"></asp:Label>
    </div>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
        ShowPageSizeChange="true" ShowEmptyDataHeader="false" AllowFrozing="true" FrozenColNum="4"
        UseDefaultDataSource="true" BindGridViewMethod="BindData" EmptyDataText="所选项目在指定年份内没有数据"
        OnRowCreated="gvList_RowCreated" OnRowDataBound="gvList_RowDataBound">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript" language="javascript">
        function afterSelect() {
            var value = $("#<%=tbDate.ClientID %>").val();
            if (value != "") {
                $("#<%=tbDate.ClientID %>").val(parseDate(value.toString(), false));
            }
        }

        function CheckEmpty() {
            var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
            if (orgId != "") {
                var url = buildQueryUrl("EPMS/List/Cost/ProjContractValueChangeInfo.aspx", { "OrganizationID": orgId });
                showDivDialog(url, null, 850, 550, null);
                return false;
            }
            else {
                alert("请选择项目！");
                return false;
            }
        }
        //查看专业定额工日调整记录
        function viewSpeDayInfo(orgId, speId) {
            var url = buildQueryUrl("/Custom/List/DispListNew.aspx", { secid: '78713525-6B4D-4ABA-8D47-218DF11A7D64', orgId: orgId, speId: speId });
            return checkReturn(showModal(url, null, 1080, 600));
        }
        //查看合同额调整记录
        function viewConInfo(orgId, type) {
            var url = buildQueryUrl("EPMS/List/Cost/ProjContractValueChangeInfo.aspx", { "OrganizationID": orgId, "Type": type });
            showDivDialog(encodeURI(url), null, 850, 550, null);
            return false;
        }
    </script>
</asp:Content>
