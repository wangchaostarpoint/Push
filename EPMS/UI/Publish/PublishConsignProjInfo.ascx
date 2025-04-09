<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignProjInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishConsignProjInfo" %>
<table class="tz-table" width="100%" id="Table1">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('projDetail')">
            <span id="projInfo1">项目信息</span> <span id="projInfo2">出版委托信息</span>&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="projDetail">
    <tr>
        <td class="td-l">
            委托人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConsignUserName" runat="server" TableName="EPMS_PublishConsign"
                Field="ConsignUserName" activestatus="(23.*)(23.出版委托)" class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiConsignUserID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                field="ConsignUserID" />
        </td>
        <td class="td-l">
            项目编号<span id="red" class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectCode" IsMutiple="false"
                Writeable="false" field="ProjectCode" tablename="EPMS_PublishConsign" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationId':'id','txtProjectName':'name'}" EnableTheming="false"
                Text="选择项目" PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="ProjectCode" activestatus="(23.*)(2.出版委托)"
                OnClick="lbsProjectCode_Click" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                field="OrganizationId" tablename="EPMS_PublishConsign" />
        </td>
        <td class="td-l">
            项目名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.*)(2.出版委托)"
                class="kpms-textbox" readonly="readonly" field="ProjectName" tablename="EPMS_PublishConsign" />
        </td>
    </tr>
    <tr>
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
            卷册编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSCode" SourceMode="SelectorPage"
                Writeable="false" IsMutiple="false" ShowJsonRowColName="true" ResultAttr="WBSCode"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiWBSID':'id','txtWBSName':'name','txtChargeUser':'WBSOwnerName'}"
                activestatus="(23.*)(2.出版委托)" BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()"
                tablename="EPMS_PublishConsignWBS" field="WBSCode" req="1" OnClick="txtWBSCode_Click">
            </zhongsoft:LightObjectSelector>
            <input id="hiWBSID" type="hidden" runat="server" tablename="EPMS_PublishConsignWBS"
                field="WBSID" />
        </td>
        <td class="td-l">
            卷册名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtWBSName" runat="server" TableName="EPMS_PublishConsignWBS"
                Field="WBSName" activestatus="(23.*)(2.出版委托)" class="kpms-textbox" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否压力管道
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtIsYLGD" runat="server" activestatus="(23.?)" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            压力管道审核人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtYlgdCheckPerson" runat="server" activestatus="(23.?)"
                class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            压力管道审定人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtYlgdSDPerson" runat="server" activestatus="(23.?)"
                class="kpms-textbox" readonly="readonly">
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
            新制
        </td>
        <td class="td-m" colspan="7">
            0#<zhongsoft:XHtmlInputText ID="txtA0" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="A0" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            1#<zhongsoft:XHtmlInputText ID="txtA1" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="A1" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            2#<zhongsoft:XHtmlInputText ID="txtA2" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="A2" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            3#<zhongsoft:XHtmlInputText ID="txtA3" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="A3" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            4#<zhongsoft:XHtmlInputText ID="txtA4" runat="server" Regex="^[0-9]\d*$" errmsg="请输入整数"
                Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="A4" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            标准张<zhongsoft:XHtmlInputText ID="txtNewStandardMapSum" runat="server" regex="^[0-9]+(\.[0-9]{1,2})?$"
                errmsg="请输入数字（最多两位小数）" Style="width: 30px; border-top: solid windowtext 1.0pt;
                border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="NewStandardMapSum" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            活用<zhongsoft:XHtmlInputText ID="txtActiveSum" runat="server" regex="^[0-9]+(\.[0-9]{1,2})?$"
                errmsg="请输入数字（最多两位小数）" Style="width: 30px; border-top: solid windowtext 1.0pt;
                border-left: solid windowtext 1.0pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="ActiveSum" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            目录<zhongsoft:XHtmlInputText ID="txtCatalogSum" runat="server" Regex="^[0-9]\d*$"
                errmsg="请输入整数" Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="CatalogSum" activestatus="(23.*)(23.出版委托)(23.安排出版)" readonly="readonly">
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
                Field="IsOuter" activestatus="(23.*)(23.出版委托)(23.安排出版)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托出版日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtConsignTime" runat="server" TableName="EPMS_PublishConsign"
                Field="ConsignTime" activestatus="(23.*)(23.出版委托)(23.安排出版)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            要求出版日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRequireCompleteTime" runat="server" TableName="EPMS_PublishConsign"
                Field="RequireCompleteTime" activestatus="(23.*)(23.出版委托)(23.安排出版)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            要求送图日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRequireSendTime" runat="server" TableName="EPMS_PublishConsign"
                Field="RequireSendTime" activestatus="(23.*)(23.出版委托)(23.安排出版)" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            出版完成日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFactCompleteTime" runat="server" TableName="EPMS_PublishConsign"
                Field="FactCompleteTime" activestatus="(23.*)(23.出版委托)(23.安排出版)(23.核对及安排工作)"
                class="kpms-textbox-date" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            出版编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecordNumber" runat="server" activestatus="(23.*)(23.出版委托)(23.安排出版)(23.核对及安排工作)"
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
                Field="MapALLSum" activestatus="(23.*)(23.出版委托)(23.安排出版)">
            </zhongsoft:XHtmlInputText>
            张
        </td>
        <td class="td-l">
            份数<%--<span class="req-star">*</span>份数去掉必填 del by xuning 2016-09-12 --%>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtAmount" runat="server" Regex="^[0-9]\d*|0$" errmsg="请输入整数"
                Style="width: 30px; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt;
                border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt;"
                MaxLength="6" class="kpms-textbox-money" EnableTheming="false" TableName="EPMS_PublishConsignWBS"
                Field="Amount" activestatus="(23.*)(23.出版委托)(23.安排出版)">
            </zhongsoft:XHtmlInputText>
            份
        </td>
        <td class="td-l">
            缓急程度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlImportantLevel" runat="server" TableName="EPMS_PublishConsign"
                Field="ImportantLevel" activestatus="(23.*)(23.出版委托)(23.安排出版)(23.核对及安排工作)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.*)(23.出版委托)(23.安排出版)(23.核对及安排工作)(23.打印底图或蓝图)(23.重新打印)(23.打印)" field="Memo" tablename="EPMS_PublishConsign"
                TextMode="MultiLine" maxtext="512" Rows="4">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            成品修改状态
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox runat="server" ID="tbProductModify" activestatus="(23.?)"
                ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            修改的成品
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox runat="server" ID="tbProductInfo" activestatus="(23.?)" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--出版状态 --%>
<input type="hidden" runat="server" id="hiPublishState" field="PublishState" tablename="EPMS_PublishConsign" />
<%--计费状态--%>
<input type="hidden" runat="server" id="hiChargeState" field="ChargeState" tablename="EPMS_PublishConsign" />
<%--主键--%>
<input type="hidden" runat="server" id="hiPublishConsignID" tablename="EPMS_PublishConsign"
    field="PublishConsignID" />
<input type="hidden" runat="server" id="hiPublishConsignWBSID" tablename="EPMS_PublishConsignWBS"
    field="PublishConsignWBSID" />
<input id="hiPublishConsignID2" type="hidden" tablename="EPMS_PublishConsignWBS"
    field="PublishConsignID" runat="server" />
<%--出版类型--%>
<input type="hidden" runat="server" id="hiConsignTypeID" field="ConsignTypeID" tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiConsignTypeName" field="ConsignTypeName"
    tablename="EPMS_PublishConsign" />
<input type="hidden" runat="server" id="hiFlag" tablename="EPMS_PublishConsign" field="Flag" />
<%--缓急程度默认值--%>
<input type="hidden" runat="server" id="hiImportantLevel" value="平件" />
<script type="text/javascript">
    function initPublishProjInfo() {
        var key = '<%=IsFlowPage %>';
        if (key == "True") {
            $("#red").show();
            $("#projInfo2").show();
            $("#projInfo1").hide();
            $('#<%=lbsProjectCode.ClientID %>').attr('req', '1');
        }
        else {
            $("#red").hide();
            $("#projInfo1").show();
            $("#projInfo2").hide();
            $('#<%=lbsProjectCode.ClientID %>').removeAttr('req');
        }
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var josn = { "OrganizationID": $("#<%=hiOrganizationId.ClientID %>").val() };
        if ("<%=IsFlowPage %>" == "True") {
            josn = { "OrganizationID": $("#<%=hiOrganizationId.ClientID %>").val(), "WBSFormTypeSelect": "出版公司正式图纸资料及投标书出版" };
        }
        return josn;
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

</script>
