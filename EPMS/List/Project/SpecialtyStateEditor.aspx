<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialtyStateEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.SpecialtyStateEditor" Title="专业进度填报"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content23" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbAddAlert" OnClientClick="return addPortalAlert()" runat="server"
        EnableTheming="false" CssClass="subtoolbarlink"><span>发送提醒</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                周期
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlStatCycle" runat="server" req="1" tablename="ScheduleOfSpecialty"
                    field="FillCycle" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td colspan="5" class="td-m">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                年份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlYear" runat="server" req="1" tablename="ScheduleOfSpecialty"
                    field="FillYear" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                月份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" req="1" tablename="ScheduleOfSpecialty"
                    field="FillMonth" activestatus="(2.*)" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                周
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlWeek" runat="server" tablename="ScheduleOfSpecialty"
                    field="FillWeek" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" style="white-space: nowrap">
                <%--<zhongsoft:XHtmlInputText ID="txtProjectName" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" tablename="ScheduleOfSpecialty"
                    field="ProjectName" req="1" />--%>
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                    PageWidth="850" SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode','txtManagerUserName':'ManagerUserName'}"
                    EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" tablename="ScheduleOfProject"
                    field="ProjectName" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectCode" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox" tablename="ScheduleOfSpecialty" field="ProjectCode" />
                <input type="hidden" id="hiOrganizationId" runat="server" tablename="ScheduleOfSpecialty"
                    field="OrganizationID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设总
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtManagerUserName" runat="server" activestatus="(23.*)"
                    class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                专业<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSpecialty" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiSpecialtyID':'ParamSpecialtyID','txtDeptName':'DeptName','tbCompleteRate':'CompleteRate'}"
                    EnableTheming="false" Text="选择专业" PageUrl="~/EPMS/Obsolete/ProjSpeSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" FilterFunction="getFilter()" AfterSelect="afterSelect()"
                    activestatus="(23.*)" tablename="ScheduleOfProject" field="SpecialtyCode" OnClick="lbsSpecialty_Click" />
                <input type="hidden" id="hiSpecialtyID" runat="server" tablename="ScheduleOfSpecialty"
                    field="SpecialtyID" />
                <input type="hidden" id="hiSpecialtyCode" runat="server" tablename="ScheduleOfSpecialty"
                    field="SpecialtyCode" />
            </td>
            <%-- <td class="td-l">
                专业编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSpecialtyCode" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" tablename="ScheduleOfSpecialty"
                    field="SpecialtyCode" />
            </td>--%>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主设人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtZsr" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox" />
            </td>
            <td class="td-l">
                设计完成情况
            </td>
            <td class="td-r">
                <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='return openRollList()'
                    EnableTheming="false" ForeColor="Blue"><span id="desginInfo"></span></asp:LinkButton>
            </td>
            <td class="td-l">
                接口完成情况
            </td>
            <td class="td-r">
                <asp:LinkButton ID="lkbFileInfo" runat="server" OnClientClick='return openFileList()'
                    EnableTheming="false" ForeColor="Blue"><span id="fileInfo"></span></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                上期完成百分比(%)
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtLastRate" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox-money" />
            </td>
            <td class="td-l">
                本期完成百分比(%)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCompleteRate" activestatus="(23.*)"
                    tablename="ScheduleOfSpecialty" field="CompleteRate" EnableTheming="false" CssClass="kpms-textbox-money"
                    Regex="^([1-9]\d{0,2}|[0])(\.\d{1,4})?$" errmsg="请输入正数，最多3位整数，4位小数" onBlur="onProjectTextBlur();"
                    req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                实际完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtFactCompleteDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" tablename="ScheduleOfSpecialty"
                    field="CompleteDate">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                存在的问题
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbExistProblems" CssClass="kpms-textarea"
                    EnableTheming="false" activestatus="(23.*)" TextMode="MultiLine" maxtext="512"
                    Rows="4" tablename="ScheduleOfSpecialty" field="ExistProblems">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                解决措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMeasures" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" tablename="ScheduleOfSpecialty"
                    field="Measures">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" tablename="ScheduleOfSpecialty"
                    field="Memo">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiProjectState" runat="server" />
    <input type="hidden" id="hiFillTime" runat="server" tablename="ScheduleOfSpecialty"
        field="FillTime" />
    <input type="hidden" id="hiFillUserID" runat="server" tablename="ScheduleOfSpecialty"
        field="FillUserID" />
    <input type="hidden" id="hiFillUserName" runat="server" tablename="ScheduleOfSpecialty"
        field="FillUserName" />
    <input type="hidden" id="hiScheduleOfSpecialtyID" runat="server" tablename="ScheduleOfSpecialty"
        field="ScheduleOfSpecialtyID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            setProjectAccess();
            getWBSCompleteInfo();
        }

        function afterSelect() {

            var rate = $("#<%=tbCompleteRate.ClientID %>").val()
            var deRate = parseFloat(rate);
            if (!isNaN(deRate)) {
                $("#<%=tbCompleteRate.ClientID %>").val(Math.round(deRate * 100) / 100.00);
            }
            return false;
        }

        function getFilter() {
            var orgID = $("#<%=hiOrganizationId.ClientID %>").val();
            return { 'OrganizationID': orgID };
        }

        function getWBSCompleteInfo() {
            var $ids = $("#<%=hiOrganizationId.ClientID %>").val() + ";" + $("#<%=hiSpecialtyID.ClientID %>").val();
            $.post("ProjectListZsr.aspx",
                 { asyfunc: "GetRollCompleteInfo", orgIdList: $ids },
                 function (res) {
                     try {
                         var $l = eval('(' + res + ')');
                         //设计完成情况
                         var $rollCompleteInfo = $l[0][1];
                         $("#desginInfo").html($rollCompleteInfo);
                         $("#fileInfo").html($l[0][4]);
                     } catch (e) {
                     }
                 }
                );
        }

        function openFileList() {
            var url = buildQueryUrl("/EPMS/List/WBS/C_MutualFileList.aspx", { OrganizationID: $("#<%=hiOrganizationId.ClientID %>").val(), SpecialtyID: $("#<%=hiSpecialtyID.ClientID %>").val(), secid: '58799f61-7761-43e8-961f-4ca93fa67039', IsShowAllButn: 'false', IsShowRollEdit: 'false', ShowWaringRow: 0, IsShowBtnAdd: 'false' });
            showDivDialog(url, null, 1200, 600, null);

            return false;
        }

        function openRollList() {
            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: $("#<%=hiOrganizationId.ClientID %>").val(), SpecialtyID: $("#<%=hiSpecialtyID.ClientID %>").val(), secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'false', ShowWaringRow: 0, IsShowRollEdit: 'false', IsShowWorkDay: 'false', IsShowLbtnApprove: 'false' });
            showDivDialog(url, null, 1200, 600, null);

            return false;
        }

        //控制项目进度
        function setProjectAccess() {

            var rate = $("#<%=tbCompleteRate.ClientID %>").val();
            var floatRate = parseFloat(rate);
            if (isNaN(floatRate)) {
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
            } else if (floatRate < 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
            } else if (floatRate == 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").removeAttr("disabled");
            } else if (floatRate > 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
            }
        }

        function onProjectTextBlur() {

            var rate = $("#<%=tbCompleteRate.ClientID %>").val();
            var floatRate = parseFloat(rate);
            if (isNaN(floatRate)) {
                $("#<%=txtFactCompleteDate.ClientID %>").val("");
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
                //添加所有项
            } else if (floatRate < 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").val("");
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
            } else if (floatRate == 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").removeAttr("disabled");
                var today = new Date();
                var day = today.getDate();
                var month = today.getMonth() + 1; //显示月份比实际月份小1,所以要加1
                var year = today.getFullYear();  //获取完整的年份(4位)
                month = month < 10 ? "0" + month : month; //数字<10，实际显示为，如5，要改成05  
                day = day < 10 ? "0" + day : day;
                $("#<%=txtFactCompleteDate.ClientID %>").val(year + "-" + month + "-" + day);
            } else if (floatRate > 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").val("");
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
                $("#<%=tbCompleteRate.ClientID %>").val("");
                alert("项目进度应小于等于100%");
            }
        }

        //发送工作提醒
        function addPortalAlert() {
            var title = "";
            var content = "";
            content = $("#<%=tbExistProblems.ClientID %>").val();
            var projectName = $("#<%=lbsSelectProject.ClientID %>").val();
            var specName = $("#<%=lbsSpecialty.ClientID %>").val();
            title = projectName + specName + "专业进度填报";
            var projectID = $("#<%=hiOrganizationId.ClientID %>").val();
            var projectCode = $("#<%=tbProjectCode.ClientID %>").val();
            var url = buildQueryUrl("/EPMS/List/Sys/PortalAlertEditor.aspx", { actionType: 2, SourceID: "<%=BusinessObjectId %>" });
            showDivDialog(url, null, 800, 500, null);
            return false;
        }
    </script>
</asp:Content>
