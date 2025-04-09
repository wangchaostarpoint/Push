<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapChargeEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.MapChargeEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/EPMS/UI/Publish/PublishCostInfo.ascx" TagName="PublishCostInfo"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnPrint" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClientClick="showPrint()"><span>打印</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%" id="Table2">
        <tr id="tr1">
            <td class="flexible" onclick="openDetail('projConsign')">
                <span id="Span1">项目信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
    </table>
    <table class="tz-table" id="projConsign">
        <tr>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" IsMutiple="false"
                    field="ProjectName" tablename="EPMS_PublishConsign" SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    EnableTheming="false" Text="选择项目编号" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" />
                <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                    field="OrganizationId" tablename="EPMS_PublishConsign" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" TableName="EPMS_PublishConsign"
                    Field="ProjectCode" activestatus="(23.*)" class="kpms-textbox" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                卷册编号
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSCode" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="WBSCode"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    ResultForControls="{'hiWBSID':'id','txtWBSName':'name'}" activestatus="(23.*)"
                    BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()" tablename="EPMS_PublishConsignWBS"
                    field="WBSCode"></zhongsoft:LightObjectSelector>
                <input id="hiWBSID" type="hidden" runat="server" tablename="EPMS_PublishConsignWBS"
                    field="WBSID" />
            </td>
            <td class="td-l">
                资料名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtWBSName" runat="server" TableName="EPMS_PublishConsignWBS"
                    req="1" Field="WBSName" activestatus="(23.*)" class="kpms-textbox" />
            </td>
            <td class="td-l">
                负责人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtChargeUserName" TableName="EPMS_PublishWork"
                    Field="ChargeUserName" activestatus="(23.*)" SourceMode="SelectorPage" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ResultForControls="{'hiChargeUserID':'id'}"
                    FilterFunction="userFilter()" PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    req="1"></zhongsoft:LightObjectSelector>
                <%--<zhongsoft:XHtmlInputText ID="txtChargeUserName" runat="server" TableName="EPMS_PublishWork"
                    Field="ChargeUserName" activestatus="(23.*)" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>--%>
                <input id="hiChargeUserID" type="hidden" runat="server" tablename="EPMS_PublishWork"
                    field="ChargeUserID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                绘图类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlWorkTypeID" runat="server" req="1" activestatus="(2.*)"
                    field="WorkTypeID" tablename="EPMS_PublishWork" OnSelectedIndexChanged="ddlWorkTypeID_SelectedIndexChanged"
                    AutoPostBack="true" />
                <input type="hidden" runat="server" id="hiWorkTypeName" field="WorkTypeName" tablename="EPMS_PublishWork" />
            </td>
            <td class="td-l">
                出版类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlConsignTypeID" runat="server" req="1" activestatus="(2.*)"
                    field="ConsignTypeID" tablename="EPMS_PublishConsign" />
                <input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName"
                    tablename="EPMS_PublishConsign" />
            </td>
            <td class="td-m" colspan="2">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                委托人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtConsignUserName" field="ConsignUserName"
                    tablename="EPMS_PublishConsign" activestatus="(23.*)" SourceMode="SelectorPage"
                    DoCancel="true" ResultAttr="name" EnableTheming="false" ResultForControls="{'hiConsignUserID':'id',hiConsignDeptID:'OrgUnitId',txtConsignDeptName:'OrgUnitName'}"
                    FilterFunction="allUserFilter()" PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    req="1"></zhongsoft:LightObjectSelector>
                <input id="hiConsignUserID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                    field="ConsignUserID" />
                <input id="hiConsignUserTel" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                    field="ConsignUserTel" />
            </td>
            <td class="td-l">
                委托部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtConsignDeptName" runat="server" TableName="EPMS_PublishConsign"
                    Field="ConsignDeptName" activestatus="(23.*)(23.出版委托)" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiConsignDeptID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                    field="ConsignDeptID" />
            </td>
            <td class="td-l">
                委托日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTime" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="ConsignTime"
                    tablename="EPMS_PublishConsign" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                流水号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtRecordNumber" runat="server" activestatus="(23.*)"
                    TableName="EPMS_PublishConsign" Field="RecordNumber" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                完成日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCompleteDate" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="FactCompleteTime"
                    tablename="EPMS_PublishConsign" />
            </td>
            <td class="td-l">
                计费日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtChargeDate" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="ChargeDate"
                    tablename="EPMS_PublishWork" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" field="Memo"
                    tablename="EPMS_PublishConsign">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <uc1:PublishCostInfo ID="PublishCostInfo1" runat="server" />
    <%-- 主键--%>
    <input id="hiPublishConsignID" type="hidden" tablename="EPMS_PublishConsign" field="PublishConsignID"
        runat="server" />
    <input id="hiPublishState" type="hidden" tablename="EPMS_PublishConsign" field="PublishState"
        runat="server" />
    <input id="hiChargeState" type="hidden" tablename="EPMS_PublishConsign" field="ChargeState"
        runat="server" />
    <input id="hiChargeDate" type="hidden" tablename="EPMS_PublishConsign" field="ChargeDate"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_PublishConsign" field="Flag" runat="server" />
    <input id="hiChargeSum" type="hidden" tablename="EPMS_PublishConsign" field="ChargeSum"
        runat="server" />
    <input id="hiPublishConsignWBSID" type="hidden" tablename="EPMS_PublishConsignWBS"
        field="PublishConsignWBSID" runat="server" />
    <input id="hiPublishConsignID2" type="hidden" tablename="EPMS_PublishConsignWBS"
        field="PublishConsignID" runat="server" />
    <input id="hiChargeSum2" type="hidden" tablename="EPMS_PublishConsignWBS" field="ChargeSum"
        runat="server" />
    <input id="hiPublishWorkID" type="hidden" tablename="EPMS_PublishWork" field="PublishWorkID"
        runat="server" />
    <input id="hiPublishConsignWBSID2" type="hidden" tablename="EPMS_PublishWork" field="PublishConsignWBSID"
        runat="server" />
    <input id="hiAmount" type="hidden" tablename="EPMS_PublishWork" field="Amount" runat="server" />
    <input id="hiChargeSum3" type="hidden" tablename="EPMS_PublishWork" field="ChargeSum"
        runat="server" />
    <input id="hiFlag2" type="hidden" tablename="EPMS_PublishWork" field="Flag" runat="server" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            initCostPlugin();
        }
        //选择任务之前的逻辑判断
        function beforeSelectWbs() {
            var orgId = $('#<%=hiOrganizationId.ClientID %>').val();
            if (orgId == '' || orgId == undefined) {
                alert('请先选择项目，再选择卷册！');
                return false;
            }
            return true;
        }

        //选择任务的筛选条件
        function wbsFilter() {
            var orgId = $('#<%=hiOrganizationId.ClientID %>').val();
            return { OrganizationID: orgId, WBSType: '<%= DAL.EPMS.WBSMode.任务管理.GetHashCode() %>', IsShowMore: 1 };
        }

        function userFilter() {
            return { IsDefaultMyDept: 0 };
        }

        function allUserFilter() {
            return { IsDefaultMyDept: 1 };
        }

        function showPrint() {
            var id = $('#<%=hiPublishConsignID.ClientID %>').val();
            var urlStr = buildQueryUrl("/EPMS/List/Publish/MapChargeInfoPrint.aspx", { bizId: id });
            window.open(urlStr, '_blank');
            return false;
        }

    </script>
</asp:Content>
