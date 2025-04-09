<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectStateEditor.aspx.cs"
    Title="项目进度填报" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectStateEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>

<asp:Content ID="Content23" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbAddAlert" OnClientClick="return addPortalAlert()" runat="server"
        EnableTheming="false" CssClass="subtoolbarlink"><span>发送提醒</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">周期
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightDropDownList ID="ddlStatCycle" runat="server" req="1" tablename="ScheduleOfProject"
                    field="FillCycle" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">年份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlYear" runat="server" req="1" tablename="ScheduleOfProject"
                    field="FillYear" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">月份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" req="1" tablename="ScheduleOfProject"
                    field="FillMonth" activestatus="(2.*)" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">周
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlWeek" runat="server" tablename="ScheduleOfProject"
                    field="FillWeek" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">项目设总
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtManagerUserName" runat="server" activestatus="(23.*)"
                    class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">项目状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectState" activestatus="(23.*)"
                    tablename="ScheduleOfProject" field="ProjectState">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">合同状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlContractState" runat="server" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" style="white-space: nowrap">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode','txtManagerUserName':'ManagerUserName','ddlContractState':'ContractState','tbCompleteRate':'CompleteRate'}"
                    EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" OnClick="lbsSelectProject_OnClick"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" tablename="ScheduleOfProject"
                    field="ProjectName" PageWidth="850" />
            </td>
            <td class="td-l">项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectCode" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox" tablename="ScheduleOfProject" field="ProjectCode" />
                <input type="hidden" id="hiOrganizationId" runat="server" tablename="ScheduleOfProject"
                    field="OrganizationID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">上期完成百分比(%)
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtLastRate" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox-money">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">本期完成百分比(%)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCompleteRate" activestatus="(23.*)"
                    tablename="ScheduleOfProject" field="CompleteRate" EnableTheming="false" CssClass="kpms-textbox-money"
                    Regex="^([1-9]\d{0,2}|[0])(\.\d{1,4})?$" errmsg="请输入正数，最多3位整数，4位小数" onBlur="onProjectTextBlur();"
                    req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">实际完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtFactCompleteDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" tablename="ScheduleOfProject" field="CompleteDate">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">存在的问题
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbExistProblems" CssClass="kpms-textarea"
                    EnableTheming="false" activestatus="(23.*)" TextMode="MultiLine" maxtext="512"
                    Rows="4" tablename="ScheduleOfProject" field="ExistProblems">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">解决措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMeasures" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" tablename="ScheduleOfProject"
                    field="Measures">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" tablename="ScheduleOfProject"
                    field="Memo">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <!--2021/05/26 隐藏综合评审单-->
        <tr style="display:none;">
            <td class="td-l">综合评审单</td>
            <td class="td-m" colspan="5">
                <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(23.*)" EnableTheming="False" OnClientClick="return uploadFile('Module','综合评审单');">
                <img src="../../../Themes/Images/btn_upload.gif">
                <span>上传综合评审单</span>
                </asp:LinkButton>
                <uc1:AttachmentView ID="ucUploadFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('scheduleInfo')">专业完成进度&nbsp;<img src="<%=WebAppPath %>/Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <table width="100%" id="scheduleInfo">
                    <tr>
                        <td colspan="6">
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                                PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false"
                                DataKeyNames="ScheduleOfSpecialtyID,OrganizationID,SpecialtyID,SpecialtyCode"
                                UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand"
                                EmptyDataText="没有要查找的数据">
                                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                <Columns>
                                    <zhongsoft:LightTemplateField HeaderStyle-Width="80px" HeaderText="类别">
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField DataField="" HeaderText="部门">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightTemplateField HeaderText="设计完成情况">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openRollList(\"{0}\",\"{1}\",\"0\")", Eval("OrganizationID"), Eval("SpecialtyID")) %>'
                                                EnableTheming="false" ForeColor="Blue"><span title='' RollCompleteInfo='<%#Eval("OrganizationId") %>;<%#Eval("SpecialtyID") %>'></span></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="定额完成情况">
                                        <ItemTemplate>
                                            <span workdayinfo='<%#Eval("OrganizationId") %>;<%#Eval("SpecialtyID") %>'></span>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="专业进度">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbSpeCompleteRate" activestatus="(23.*)"
                                                EnableTheming="false" CssClass="kpms-textbox-money" Regex="^([1-9]\d{0,2}|[0])(\.\d{1,4})?$"
                                                errmsg="请输入正数，最多3位整数，4位小数" Text='<%#Eval("CompleteRate") %>'></zhongsoft:LightTextBox>%
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="存在问题">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbExistProblems" CssClass="kpms-textarea"
                                                EnableTheming="false" activestatus="(23.*)" TextMode="MultiLine" maxtext="512"
                                                Rows="4" Text='<%#Eval("ExistProblems") %>'>
                                            </zhongsoft:LightTextBox>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="解决措施">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox runat="server" ID="tbMeasures" CssClass="kpms-textarea" EnableTheming="false"
                                                activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" Text='<%#Eval("Measures") %>'>
                                            </zhongsoft:LightTextBox>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiProjectState" runat="server" />
    <input type="hidden" id="hiFillTime" runat="server" tablename="EPMS_ScheduleOfProject"
        field="FillTime" />
    <input type="hidden" id="hiFillUserID" runat="server" tablename="EPMS_ScheduleOfProject"
        field="FillUserID" />
    <input type="hidden" id="hiFillUserName" runat="server" tablename="EPMS_ScheduleOfProject"
        field="FillUserName" />
    <input type="hidden" id="hiScheduleOfProjectID" runat="server" tablename="EPMS_ScheduleOfProject"
        field="ScheduleOfProjectID" />
    <asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            setProjectAccess();
            getWBSCompleteInfo();
        }

        function checkForm() {
            <%--//2021/5/26 项目进度填报，去掉完成比例填写100%的时候，必须上传综合评审单的限制，综合评审单内容隐藏
            //var value = $("#<%=tbCompleteRate.ClientID%>").val();
            //var fileCount = '<%=ucUploadFile.FileCount%>';            
            //if (parseFloat(value) >= 90 && parseInt(fileCount) == 0) {
            //    alert("本期完成百分比大于等于90，请上传综合评审单。");
            //    return false;
            //}--%>
            return true;
        }

        //上传附件
        function uploadFile(flag, fileType) {
            var fileSrcId = '<%=OrganizationId%>';
            if (fileSrcId == "") {
                fileSrcId = $("#<%=hiOrganizationId.ClientID%>").val();
            }
            if (fileSrcId == "") {
                alert("请先选择项目!");
                return false;
            }
            showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
        }

        //控制项目进度
        function setProjectAccess() {
            var ddlID = "<%=ddlProjectState.ClientID %>";

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
            var ddlID = "<%=ddlProjectState.ClientID %>";

            var rate = $("#<%=tbCompleteRate.ClientID %>").val();
            var floatRate = parseFloat(rate);
            if (isNaN(floatRate)) {
                $("#<%=txtFactCompleteDate.ClientID %>").val("");
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
                //添加所有项
            } else if (floatRate < 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").val("");
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
                selectedoption(ddlID, 3);
            } else if (floatRate == 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").removeAttr("disabled");
                var today = new Date();
                var day = today.getDate();
                var month = today.getMonth() + 1; //显示月份比实际月份小1,所以要加1
                var year = today.getFullYear();  //获取完整的年份(4位)
                month = month < 10 ? "0" + month : month; //数字<10，实际显示为，如5，要改成05  
                day = day < 10 ? "0" + day : day;
                $("#<%=txtFactCompleteDate.ClientID %>").val(year + "-" + month + "-" + day);
                selectedoption(ddlID, 7);
            } else if (floatRate > 100.00) {
                $("#<%=txtFactCompleteDate.ClientID %>").val("");
                $("#<%=txtFactCompleteDate.ClientID %>").attr("disabled", "disabled");
                $("#<%=tbCompleteRate.ClientID %>").val("");
                alert("项目进度应小于等于100%");
            }
        }

        //下拉列表选中 option
        function selectedoption(ddlID, value) {
            $("#" + ddlID + " option").removeAttr("selected");
            $("#" + ddlID + " option[value='" + value + "']").attr("selected", "selected");
        }

        //发送工作提醒
        function addPortalAlert() {
            var title = "";
            var content = "";
            content = $("#<%=tbExistProblems.ClientID %>").val();
            var projectName = $("#<%=lbsSelectProject.ClientID %>").val();
            title = projectName + "进度填报";
            var projectID = $("#<%=hiOrganizationId.ClientID %>").val();
            var projectCode = $("#<%=tbProjectCode.ClientID %>").val();
            var url = buildQueryUrl("/EPMS/List/Sys/PortalAlertEditor.aspx", { actionType: 2, SourceID: "<%=BusinessObjectId %>" });
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        //异步加载设计完成情况和设计完成定额
        function getWBSCompleteInfo() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                $ids += $(this).attr("RollCompleteInfo") + "|";
            });
            $.post("<%=WebAppPath %>/EPMS/List/Project/ProjectListZsr.aspx",
                { asyfunc: "GetRollCompleteInfo", orgIdList: $ids },
                function (res) {
                    var $l = eval('(' + res + ')');
                    //设计完成情况
                    $("#<%=gvList.ClientID %> span[RollCompleteInfo]").each(function () {
                        var $orgID = $(this).attr("RollCompleteInfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $rollCompleteInfo = $l[i][1];
                            if ($orgID == $id) {
                                if ($rollCompleteInfo == "")
                                    $(this).html("");
                                else {
                                    $(this).html($rollCompleteInfo);
                                    if ($rollCompleteInfo.indexOf("延期") > 0) {
                                        $(this).parent().parent().parent().css('background-color', '#fb7c7c');
                                    } else if ($rollCompleteInfo.indexOf("到期") > 0) {
                                        $(this).parent().parent().parent().css('background-color', '#fcf18b');
                                    }
                                }
                            }
                        }
                    });
                    //设计完成定额
                    $("#<%=gvList.ClientID %> span[WorkDayInfo]").each(function () {
                        var $orgID = $(this).attr("WorkDayInfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $workDayInfo = $l[i][2];
                            if ($orgID == $id) {
                                if ($workDayInfo == "")
                                    $(this).html("");
                                else {
                                    $(this).html($workDayInfo);
                                }
                            }
                        }
                    });
                }
            );
        }

        function openRollList(orgID, SpeID, showWaringRow) {
            var isShow = false;
            var isShowLbtnApprove = false;
            if ("<%=this.ActionType %>" == "Update" || "<%=this.ActionType %>" == "Create") {
                isShow = true;
                isShowLbtnApprove = true;
            }

            var url = buildQueryUrl("/EPMS/List/WBS/C_RollList.aspx", { OrganizationID: orgID, SpecialtyID: SpeID, secid: '9dd62921-edc5-4767-b46a-817756ea5ca7', IsShowAllButn: 'false', ShowWaringRow: showWaringRow, IsShowBtnAdd: isShow, IsShowLbtnApprove: isShowLbtnApprove });
            showDivDialog(url, null, 1200, 600, null);

            return false;
        }



    </script>
</asp:Content>
