<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSInfoDetail.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSInfoDetail" %>
<tr>
    <td class="td-l">
        项目名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            PageWidth="850" IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName'}"
            TableName="EPMS_WBSEntity" Field="ProjectName" activestatus="(23.*)" req="1">
        </zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSEntity"
            field="OrganizationID" />
    </td>
    <td class="td-l">
        项目编号<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectCode"
            req="1">
        </zhongsoft:XHtmlInputText>
    </td>
</tr>
<tr>
    <td class="td-l">
        项目阶段
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" activestatus="(23.*)" readonly="readonly"
            class="kpms-textbox">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        所属部门<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept" TableName="EPMS_WBSEntity"
            Field="BelongDeptID" activestatus="(23.*)" req="1">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiDeptName" tablename="EPMS_WBSEntity" field="BelongDeptName" />
    </td>
    <td class="td-l">
        执行专业
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtExecSpecialtyName" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ExecSpecialtyName">
        </zhongsoft:XHtmlInputText>
        <asp:ImageButton runat="server" ID="ibtnSelectSpe" ImageUrl="~/Themes/Images/look-up.gif"
            OnClientClick="return selectSpe()" EnableTheming="false" class="btn-look-up"
            displaystatus="(2.*)" />
        <input type="hidden" runat="server" id="hiExecSpecialtyID" tablename="EPMS_WBSEntity"
            field="ExecSpecialtyID" />
        <input type="hidden" runat="server" id="hiExecSpecialtyCode" tablename="EPMS_WBSEntity"
            field="ExecSpecialtyCode" />
    </td>
</tr>
<tr>
    <td class="td-l">
        任务类型<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" TableName="EPMS_WBSEntity"
            Field="ParamWBSTypeID" activestatus="(23.*)" req="1">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_WBSEntity" field="WBSType" />
    </td>
    <td class="td-l">
        名称（中文）<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightTextBox runat="server" ID="tbWBSName" TableName="EPMS_WBSEntity"
            Field="WBSName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr>
    <td class="td-l">
        编号<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox runat="server" ID="tbWBSCode" TableName="EPMS_WBSEntity"
            Field="WBSCode" activestatus="(2.*)" req="1"></zhongsoft:LightTextBox>
    </td>
    <td class="td-l">
        名称（英文）
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightTextBox runat="server" ID="tbWBSNameForEnglish" TableName="EPMS_WBSEntity"
            Field="WBSNameForEnglish" activestatus="(23.*)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr>
    <td class="td-l" style="white-space: nowrap;">
        成品号（校验号）<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox runat="server" ID="tbSerialCode" TableName="EPMS_WBSEntity"
            Field="SerialCode" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
    </td>
    <td class="td-l">
        负责人
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox runat="server" ID="tbWBSOwner" TableName="EPMS_WBSEntity"
            Field="WBSOwnerName" activestatus="(23.?)"></zhongsoft:LightTextBox>
    </td>
    <td class="td-l">
        作业（系统）方式
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlWBSWay" TableName="EPMS_WBSEntity"
            Field="WBSWay" activestatus="(23.*)">
        </zhongsoft:LightDropDownList>
    </td>
</tr>
<tr>
    <td class="td-l">
        任务标识
    </td>
    <td class="td-m" colspan="3">
        <asp:CheckBoxList runat="server" ID="cblWBFFlag" RepeatDirection="Horizontal" activestatus="(23.*)">
        </asp:CheckBoxList>
        <input type="hidden" runat="server" id="hiWBSFlag" tablename="EPMS_WBSEntity" field="WBSFlag" />
    </td>
    <td class="td-l" style="white-space: nowrap;">
        所属模块（系统、区域）
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlBelongModule" TableName="EPMS_WBSEntity"
            Field="BelongModuleID" activestatus="(23.*)">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiBelongModule" ablename="EPMS_WBSEntity"
            field="BelongModule" />
    </td>
</tr>
<tr>
    <td class="td-l">
        计划开始时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanStartTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSEntity" Field="PlanStartTime">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        计划个人出手时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanHandTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="PlanHandTime">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        计划互校完成时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanCheckTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="PlanCheckTime">
        </zhongsoft:XHtmlInputText>
    </td>
</tr>
<tr>
    <td class="td-l">
        实际开始时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactStartTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSEntity" Field="FactStartTime">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        实际个人出手时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactHandTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="FactHandTime">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        实际互校完成时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactCheckTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="FactCheckTime">
        </zhongsoft:XHtmlInputText>
    </td>
</tr>
<tr>
    <td class="td-l">
        计划科/室交出时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanRecheckTime1" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="PlanRecheckTime1">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        计划司/部交出时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanRecheckTime2" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="PlanRecheckTime2">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        计划完成时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanCompleteTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSEntity" Field="PlanCompleteTime">
        </zhongsoft:XHtmlInputText>
    </td>
</tr>
<tr>
    <td class="td-l">
        实际科/室交出时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactRecheckTime1" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="FactRecheckTime1">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        实际司/部交出时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactRecheckTime2" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="FactRecheckTime2">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        实际完成时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactCompleteTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSEntity" Field="FactCompleteTime">
        </zhongsoft:XHtmlInputText>
    </td>
</tr>
<tr>
    <td class="td-l">
        计划交付时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanDeliveryTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="PlanDeliveryTime">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">
        实际交付时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactDeliveryTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_RollEntity" Field="FactDeliveryTime">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-m" colspan="2">
    </td>
</tr>
<!-- 业务主键-->
<input type="hidden" runat="server" id="hiWBSId" tablename="EPMS_WBSEntity" field="WBSID" />
<input type="hidden" runat="server" id="hiRollID" tablename="EPMS_RollEntity" field="RollID" />
<!-- 任务状态-->
<input type="hidden" runat="server" id="hiWBSState" tablename="EPMS_WBSEntity" field="WBSState"
    value="0" />
<!-- 任务来源，Memo字段-->
<input type="hidden" runat="server" id="hiSource" tablename="EPMS_WBSEntity" field="Memo"
    value="新建" />
<script type="text/javascript">

    function initCustomerPlugin() {
        if ('<%=ActionType %>' == 'Create' || '<%=ActionType %>' == 'Update') {
            if ($('#<%=tbWBSCode.ClientID %>').('readonly')!='readonly') {
                //卷册编号再进行验证，可用状态才进行验证
                $('#<%=tbWBSCode.ClientID %>').live('blur', function () {
                    checkWBSCode();
                });
            }
        }
    }

    function checkWBSCode() {
        var wbsCode = $('#<%=tbWBSCode.ClientID %>').val();
        var organizationId = '<%=OrganizationID %>';
        var wbsWay = $('#<%=ddlWBSWay.ClientID %>').val();
        var bizId = '<%=BizId %>';
        var isRepeat = false;
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
            data: { 'checkType': 'WBSCode', 'code': wbsCode, 'OrganizationID': organizationId, 'BizID': bizId, 'WBSWay': wbsWay },
            async: false,
            //dataType: "json",
            cache: false,
            success: function (res) {
                isRepeat = parseBool(res);
            },
            error: function (err) {
                //alert(err);
            }
        });

        if (isRepeat) {
            //编号重复，给出提示、焦点定位
            alert('任务编号重复，请重新输入！');
            $('#<%=tbWBSCode.ClientID %>').focus();
            //$('#<%=tbWBSCode.ClientID %>').val('');

            return false;
        }
        else {
            //验证通过，将任务编号默认为成品校验号
            $('#<%=tbSerialCode.ClientID %>').val(wbsCode);
            return true;
        }
    }

    //选择执行专业
    function selectSpe() {
        var xml = $("#<%//=hiExeSpeXML.ClientID %>").val();
        var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
        var json = { ActionFlag: 1, SelectFlag: 0, OrganizationID: orgId };
        var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", json);
        showDivDialog(url, xml, 850, 550, setSpeVal);
        return false;
    }

    //根据选择专业后返回值，设置控件值
    function setSpeVal(re) {
        var arr = re.split('|');
        $("#<%//=hiExeSpeXML.ClientID %>").val(arr[0]);
        $("#<%=hiExecSpecialtyID.ClientID %>").val(arr[1]);
        $("#<%=hiExecSpecialtyCode.ClientID %>").val(arr[2]);
        $("#<%=txtExecSpecialtyName.ClientID %>").val(arr[3]);
    }
</script>
