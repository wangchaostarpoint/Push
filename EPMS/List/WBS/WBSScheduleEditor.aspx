<%@ Page Title="任务进度" Language="C#" AutoEventWireup="true" CodeBehind="WBSScheduleEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSScheduleEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                填报周期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlStatCycle" runat="server" ActiveStatus="(23.*)"
                    Field="FillCycle" TableName="EPMS_ScheduleOfWBS" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                年<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlYear" runat="server" activestatus="(23.*)" field="FillYear"
                    tablename="EPMS_ScheduleOfWBS" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                月<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" activestatus="(23.*)" field="FillMonth"
                    tablename="EPMS_ScheduleOfWBS" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                周
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlWeek" runat="server" activestatus="(23.*)" field="FillWeek"
                    tablename="EPMS_ScheduleOfWBS">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                完成工天
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbWorkDayOfComplete" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" activestatus="(23.*)" field="WorkDayOfComplete" tablename="EPMS_ScheduleOfWBS"
                    Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                处理人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPartakerUserName" activestatus="(23.*)"
                    field="PartakerUserName" tablename="EPMS_ScheduleOfWBS" class="kpms-textbox"
                    EnableTheming="false" readonly="readonly" />
                <input type="hidden" id="hiPartakerUserID" runat="server" field="PartakerUserID"
                    tablename="EPMS_ScheduleOfWBS" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否项目<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rdblIsProject" runat="server" Field="IsProjectWork" TableName="EPMS_ScheduleOfWBS"
                    activestatus="(23.*)" req="1" RepeatColumns="2">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                类型
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsProjectWork" runat="server" activestatus="(23.*)"
                    field="IsProjectWork" tablename="EPMS_ScheduleOfWBS">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                工作分类
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlWorkType" runat="server" ctivestatus="(23.*)"
                    field="WorkType" tablename="EPMS_ScheduleOfWBS">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr id="trProject">
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" style="white-space: nowrap">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectPhaseCode':'ProjectCode'}"
                    PageWidth="850" EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" field="ProjectName"
                    tablename="EPMS_ScheduleOfWBS" />
            </td>
            <td class="td-l" runat="server" id="tdProjectCode">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectPhaseCode" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" field="ProjectCode"
                    tablename="EPMS_ScheduleOfWBS" />
                <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                    field="OrganizationID" tablename="EPMS_ScheduleOfWBS" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工作内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbWBSName" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" field="WBSName" tablename="EPMS_ScheduleOfWBS" TextMode="MultiLine"
                    maxtext="512" Rows="4" req="1">
                </zhongsoft:LightTextBox>
                <input type="hidden" id="hiWBSCode" runat="server" field="WBSCode" tablename="EPMS_ScheduleOfWBS"
                    value='非计划工作' />
                <input type="hidden" id="hiWBSState" runat="server" field="WBSState" tablename="EPMS_ScheduleOfWBS"
                    value='0' />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" field="Memo" tablename="EPMS_ScheduleOfWBS" TextMode="MultiLine"
                    maxtext="1024" Rows="4">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiScheduleOfWBSID" runat="server" field="ScheduleOfWBSID"
        tablename="EPMS_ScheduleOfWBS" />
    <script type="text/javascript">
        function initCustomerPlugin() {

            $("#<%=rdblIsProject.ClientID %> input").each(function () {
                $(this).click(function () { setProjectAccess(); });
            });
            setProjectAccess();
        }

        function setProjectAccess() {
            //获取select 选中的 text :
            var text = $("#<%=rdblIsProject.ClientID  %> input:radio:checked").val();
            if (text == "1") {
                $("#trProject").show();
                $("#<%=lbsSelectProject.ClientID %>").attr("req", "1");
            } else {
                $("#trProject").hide();
                $("#<%=lbsSelectProject.ClientID %>").removeAttr("req");
            }
        }
    </script>
</asp:Content>
