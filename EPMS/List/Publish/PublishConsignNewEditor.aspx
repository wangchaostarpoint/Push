<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignNewEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishConsignNewEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%--工种安排列表--%>
<%@ Register Src="~/EPMS/UI/Publish/PublishWorkInfo.ascx" TagName="PublishWorkInfo"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnPrint" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClientClick="return showPrint();"><span>打印</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                委托人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtConsignUserName" field="ConsignUserName"
                    tablename="EPMS_PublishConsign" activestatus="(23.*)" SourceMode="SelectorPage"
                    SelectPageMode="Dialog" req="1" EnableTheming="false" ResultAttr="name" ResultForControls="{'hiConsignUserID':'id',hiConsignDeptID:'OrgUnitId',txtConsignDeptName:'OrgUnitName'}"
                    PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="filterFuc();">
                </zhongsoft:LightObjectSelector>
                <input id="hiConsignUserID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                    field="ConsignUserID" />
                <input id="hiConsignUserTel" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                    field="ConsignUserTel" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectCode" IsMutiple="false"
                    EnableTheming="false" Writeable="false" field="ProjectCode" tablename="EPMS_PublishConsign"
                    SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectName':'name'}"
                    Text="选择项目" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="ProjectCode" activestatus="(23.*)" Filter="{ProjectState:'all'}" />
                <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                    field="OrganizationId" tablename="EPMS_PublishConsign" />
            </td>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.*)"
                    class="kpms-textbox" field="ProjectName" tablename="EPMS_PublishConsign" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                委托部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtConsignDeptName" runat="server" TableName="EPMS_PublishConsign"
                    Field="ConsignDeptName" activestatus="(23.*)" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiConsignDeptID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                    field="ConsignDeptID" />
            </td>
            <td class="td-l">
                卷册编号
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSCode" SourceMode="SelectorPage"
                    Writeable="false" IsMutiple="false" ShowJsonRowColName="true" ResultAttr="WBSCode"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    PageWidth="850px" ResultForControls="{'hiWBSID':'id','txtWBSName':'name','txtChargeUser':'WBSOwnerName'}"
                    activestatus="(23.*)" FilterFunction="wbsFilter()" tablename="EPMS_PublishConsignWBS"
                    field="WBSCode" OnClick="txtWBSCode_Click"></zhongsoft:LightObjectSelector>
                <input id="hiWBSID" type="hidden" runat="server" tablename="EPMS_PublishConsignWBS"
                    field="WBSID" />
            </td>
            <td class="td-l">
                卷册名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtWBSName" runat="server" TableName="EPMS_PublishConsignWBS"
                    Field="WBSName" activestatus="(23.*)" class="kpms-textbox" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                新制
            </td>
            <td class="td-m" colspan="5">
                0#<zhongsoft:XHtmlInputText ID="txtA0" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="A0" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                1#<zhongsoft:XHtmlInputText ID="txtA1" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="A1" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                2#<zhongsoft:XHtmlInputText ID="txtA2" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="A2" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                3#<zhongsoft:XHtmlInputText ID="txtA3" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="A3" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                4#<zhongsoft:XHtmlInputText ID="txtA4" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="A4" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                标准张<zhongsoft:XHtmlInputText ID="txtNewStandardMapSum" runat="server" regex="^[0-9]+(\.[0-9]{1,2})?$"
                    errmsg="请输入数字（最多两位小数）" Style="width: 30px; border-top: solid windowtext 1.0pt;
                    border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="NewStandardMapSum" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                活用<zhongsoft:XHtmlInputText ID="txtActiveSum" runat="server" regex="^[0-9]+(\.[0-9]{1,2})?$"
                    errmsg="请输入数字（最多两位小数）" Style="width: 30px; border-top: solid windowtext 1.0pt;
                    border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="ActiveSum" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                目录<zhongsoft:XHtmlInputText ID="txtCatalogSum" runat="server" Regex="^[0-9]\d*$"
                    errmsg="请输入整数" Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="CatalogSum" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                负责人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtChargeUser" runat="server" activestatus="(23.?)"
                    class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设备清册
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtLiquidationSum" runat="server" Regex="^[0-9]\d*$"
                    errmsg="请输入整数" Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="LiquidationSum" activestatus="(23.*)(23.出版委托)(23.安排出版)">
                </zhongsoft:XHtmlInputText>
                张
                <zhongsoft:XHtmlInputText ID="txtLiquidationPage" runat="server" Regex="^[0-9]\d*$"
                    errmsg="请输入整数" Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="LiquidationPage" activestatus="(23.*)(23.出版委托)(23.安排出版)">
                </zhongsoft:XHtmlInputText>
                份
            </td>
            <td class="td-l">
                说明书
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txttExplainSum" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="ExplainSum" activestatus="(23.*)(23.出版委托)(23.安排出版)">
                </zhongsoft:XHtmlInputText>
                张
                <zhongsoft:XHtmlInputText ID="txtExplainPage" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="ExplainPage" activestatus="(23.*)(23.出版委托)(23.安排出版)">
                </zhongsoft:XHtmlInputText>
                份
            </td>
            <td class="td-l">
                概算
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtBudgetSum" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="BudgetSum" activestatus="(23.*)(23.出版委托)(23.安排出版)">
                </zhongsoft:XHtmlInputText>
                张
                <zhongsoft:XHtmlInputText ID="txtBudgetPage" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="BudgetPage" activestatus="(23.*)(23.出版委托)(23.安排出版)">
                </zhongsoft:XHtmlInputText>
                份
            </td>
            <td class="td-l">
                是否外部委托
            </td>
            <td class="td-r">
                <asp:CheckBox ID="chkIsOuter" runat="server" Checked="false" TableName="EPMS_PublishConsignWBS"
                    Field="IsOuter" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                委托出版日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtConsignTime" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="ConsignTime"
                    tablename="EPMS_PublishConsign" req="1" />
            </td>
            <td class="td-l">
                要求出版日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtRequireCompleteTime" runat="server" TableName="EPMS_PublishConsign"
                    Field="RequireCompleteTime" activestatus="(23.*)" class="kpms-textbox-date" readonly="readonly"
                    req="1">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                要求送图日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtRequireSendTime" runat="server" TableName="EPMS_PublishConsign"
                    Field="RequireSendTime" activestatus="(23.*)" class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                出版完成日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtFactCompleteTime" runat="server" TableName="EPMS_PublishConsign"
                    Field="FactCompleteTime" activestatus="(23.*)" class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                出版编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtRecordNumber" runat="server" activestatus="(23.*)"
                    TableName="EPMS_PublishConsign" Field="RecordNumber" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                图纸总计
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtMapALLSum" runat="server" Regex="^[0-9]\d*|0$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="MapALLSum">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                份数
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtAmount" runat="server" Regex="^[0-9]\d*|0$" errmsg="请输入整数"
                    Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                    border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                    MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                    Field="Amount">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                缓急程度
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlImportantLevel" runat="server" TableName="EPMS_PublishConsign"
                    Field="ImportantLevel" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                出版状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlPublishState" runat="server" TableName="EPMS_PublishConsign"
                    Field="PublishState" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-m" colspan="6">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" field="Memo"
                    tablename="EPMS_PublishConsign">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <uc4:PublishWorkInfo ID="PublishWorkInfo" runat="server" />
    </table>
    <%-- 主键--%>
    <input id="hiPublishConsignID" type="hidden" tablename="EPMS_PublishConsign" field="PublishConsignID"
        runat="server" />
    <input id="hiConsignTypeID" type="hidden" tablename="EPMS_PublishConsign" field="ConsignTypeID"
        runat="server" />
    <input id="hiConsignTypeName" type="hidden" tablename="EPMS_PublishConsign" field="ConsignTypeName"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="EPMS_PublishConsign" field="Flag" runat="server"
        value="1" />
    <input id="hiPublishConsignWBSID" type="hidden" tablename="EPMS_PublishConsignWBS"
        field="PublishConsignWBSID" runat="server" />
    <input id="hiPublishConsignID2" type="hidden" tablename="EPMS_PublishConsignWBS"
        field="PublishConsignID" runat="server" />
    <%--缓急程度默认值--%>
    <input type="hidden" runat="server" id="hiImportantLevel" value="平件" />
    <%--出版状态默认值--%>
    <input type="hidden" runat="server" id="hiPublishState" value="出版中" />
    <script type="text/javascript">
        //选择任务的筛选条件
        function wbsFilter() {
            var orgId = $('#<%=hiOrganizationId.ClientID %>').val();
            return { OrganizationID: orgId, WBSType: '<%= DAL.EPMS.WBSMode.任务管理.GetHashCode() %>', IsShowMore: 1 };
        }

        //传参
        function filterFuc() {
            var isDefaultMyDept = "1";

            return "{IsDefaultMyDept:'" + isDefaultMyDept + "'}";
        }

        function showPrint() {
            var id = $('#<%=hiPublishConsignID.ClientID %>').val();
            var typeId = $('#<%=hiConsignTypeID.ClientID %>').val();
            var urlStr;
            if (typeId == '<%= DAL.EPMS.PublishConsignType.正式出版.GetHashCode() %>') {
                urlStr = buildQueryUrl("/EPMS/List/Publish/PublishConsignBillInfoPrint.aspx", { bizId: id, IsSingle: false });
            }
            else {
                urlStr = buildQueryUrl("/EPMS/List/Publish/PublishConsignBillInfoPrint.aspx", { bizId: id, IsSingle: true });
            }
            window.open(urlStr, '_blank');
            return false;
        }

    </script>
</asp:Content>
