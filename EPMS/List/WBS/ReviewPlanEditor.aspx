<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewPlanEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.ReviewPlanEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="评审计划" %>

<%@ Register Src="../../UI/WBS/WBSReleSpecialtyList.ascx" TagName="WBSReleSpecialtyList"
    TagPrefix="uc1" %>
<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                评审类别<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rbReviewType" field="ParamWBSTypeID" tablename="EPMS_WBSEntity"
                    req="1" activestatus="(2.*)" AutoPostBack="true" OnSelectedIndexChanged="rbReviewType_SelectedIndexChanged"
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                   <input type="hidden" runat="server" id="hiParamWBSTypeID" tablename="EPMS_WBSEntity"
                    field="ParamWBSTypeID" />
                <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_WBSEntity" field="WBSType" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectName"
                    req="1">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSEntity"
                    field="OrganizationID" />
            </td>
            <td class="td-l">
                项目编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
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
            <td class="td-l" style="display: none">
                成品号(校验号)<span class="req-star">*</span>
            </td>
            <td class="td-m" style="display: none">
                <zhongsoft:LightTextBox runat="server" ID="tbSerialCode" TableName="EPMS_WBSEntity"
                    Field="SerialCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText runat="server" ID="tbWBSCode" TableName="EPMS_WBSEntity"
                    readonly="readonly" Field="WBSCode" activestatus="(23.*)" class="kpms-textbox" />
                <zhongsoft:LightDropDownList runat="server" ID="ddlNowVer" Visible="false">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiWBSCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                评审内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="tbWBSName" TableName="EPMS_WBSEntity"
                    Field="WBSName" activestatus="(23.*)" class="kpms-textbox" req="1" maxLength="256" />
                <zhongsoft:LightDropDownList runat="server" ID="ddlRoll" Visible="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr id="trSpeAndDept" style="display: none">
            <td class="td-l">
                专业
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlExeSpecialty" TableName="EPMS_WBSEntity"
                    Field="ExecSpecialtyID" activestatus="(23.*)" req="1" AutoPostBack="true" OnSelectedIndexChanged="ddlExeSpecialty_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiExecSpecialtyID" tablename="EPMS_WBSEntity"
                    field="ExecSpecialtyID" />
                <input type="hidden" runat="server" id="hiExecSpecialtyCode" tablename="EPMS_WBSEntity"
                    field="ExecSpecialtyCode" />
                <input type="hidden" runat="server" id="hiExecSpecialtyName" tablename="EPMS_WBSEntity"
                    field="ExecSpecialtyName" />
                <!-- 所属专业-->
                <input type="hidden" runat="server" id="hiBelongSpecialtyID" tablename="EPMS_WBSEntity"
                    field="BelongSpecialtyID" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyCode" tablename="EPMS_WBSEntity"
                    field="BelongSpecialtyCode" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyName" tablename="EPMS_WBSEntity"
                    field="BelongSpecialtyName" />
            </td>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept" TableName="EPMS_WBSEntity"
                    Field="BelongDeptID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiDeptName" tablename="EPMS_WBSEntity" field="BelongDeptName" />
                <input type="hidden" runat="server" id="hiBelongDeptID" tablename="EPMS_WBSEntity"
                    field="BelongDeptID" />
            </td>
        </tr>
        <tr flag="roll" style="display: none">
            <td class="td-l">
                任务标识
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBoxList runat="server" ID="cblWBFFlag" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiWBSFlag" tablename="EPMS_WBSEntity" field="WBSFlag" />
            </td>
        </tr>
        <tr flag="relSpe" id="trRelSpe" style="display: none">
            <td class="td-l">
                <span>相关专业</span>
            </td>
            <td colspan="3" class="td-m">
                <span id="Span5" runat="server" style="float: right" class="req-star" displaystatus="(2.*)">
                    请先保存，再添加专业</span>
                <uc1:WBSReleSpecialtyList ID="ucWBSReleSpecialtyList" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                计划开始日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanStartTime"
                    runat="server" compare="1" readonly="readonly" activestatus="(23.*)" field="PlanStartTime"
                    tablename="EPMS_WBSEntity" />
            </td>
            <td class="td-l">
                计划结束日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanCompleteTime"
                    runat="server" compare="1" readonly="readonly" activestatus="(23.*)" field="PlanCompleteTime"
                    tablename="EPMS_WBSEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                计划情况
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbContent" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" MaxLength="512" tablename="EPMS_WBSEntity" field="Content"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!--任务负责人-->
    <input type="hidden" runat="server" id="hiWBSOwnerID" tablename="EPMS_WBSEntity"
        field="WBSOwnerID" />
    <input type="hidden" runat="server" id="hiWBSOwnerCode" tablename="EPMS_WBSEntity"
        field="WBSOwnerCode" />
    <input type="hidden" runat="server" id="hiWBSOwnerName" tablename="EPMS_WBSEntity"
        field="WBSOwnerName" />
    <!-- 业务主键-->
    <input type="hidden" runat="server" id="hiWBSId" tablename="EPMS_WBSEntity" field="WBSID" />
    <!-- 任务状态-->
    <input type="hidden" runat="server" id="hiWBSState" tablename="EPMS_WBSEntity" field="WBSState"
        value="0" />
    <!-- 任务来源，Memo字段-->
    <input type="hidden" runat="server" id="hiSource" value="新建" />
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_WBSEntity" field="Flag"
        value="1" />
    <script>
        function initCustomerPlugin() {
            initRelSpe();
            speDisplay();
            $('#<%=rbReviewType.ClientID %>').live("change", function () {
                speDisplay();
            });
        }

        function speDisplay() {
            var reviewType = getRadlName('<%=rbReviewType.ClientID %>');
            if (reviewType == "<%=WBSType.专业评审 %>") {
                $("#trSpeAndDept").show();
                $("#trRelSpe").hide();
            }
            else {
                $("#trSpeAndDept").hide();
                $("#trRelSpe").hide();
                if (reviewType == "<%=WBSType.综合评审 %>") {
                    $("#trRelSpe").show();
                }
            }
        }

        function getRadlName(radl) {
            var selectVal = "";
            $("#" + radl + " input").each(function () {
                if ($(this)[0].checked) {
                    selectVal = $(this).siblings(0).html();
                    return false;
                }
            });
            return selectVal;
        }
            
    </script>
</asp:Content>
