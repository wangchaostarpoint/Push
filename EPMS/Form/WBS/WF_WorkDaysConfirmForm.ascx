<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WorkDaysConfirmForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_WorkDaysConfirmForm" %>
<%@ Register Src="../../UI/WBS/WBSWorkDaysList.ascx" TagName="WBSWorkDaysList" TagPrefix="uc1" %>
<%@ Register Src="../../UI/Plan/DeptTreeListOfPlan.ascx" TagName="DeptTreeListOfPlan"
    TagPrefix="uc2" %>
<table class="tz-table" width="100%">
    <tr>
        <td style="vertical-align: top; width: 20%;" align="left">
            <div style="overflow: scroll; height: 470px">
                <uc2:DeptTreeListOfPlan ID="ucDeptTreeListOfPlan" runat="server" OnNodeChanged="treeSelectedNodeChanged"
                    OnInitNodeNumDt="InitNodeNumDt" />
            </div>
        </td>
        <td style="vertical-align: top; width: 70%;" align="left">
            <table class="tz-table" width="100%">
                <tr>
                    <td class="td-l">
                        项目名称
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText ID="txtProjectName" runat="server" activestatus="(23.*)"
                            class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        项目编号
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" activestatus="(23.*)"
                            class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        设计阶段
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtPhaseName" runat="server" activestatus="(23.*)"
                            class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        设计规模
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtProjectScale" runat="server" activestatus="(23.*)"
                            class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        项目设总
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtManagerUserName" runat="server" activestatus="(23.*)"
                            class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        专业
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtSpecialty" runat="server" activestatus="(23.*)"
                            class="kpms-textbox" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        设计总工天
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtTotalDays" runat="server" activestatus="(23.*)"
                            class="kpms-textbox-money" readonly="readonly">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-m" colspan="2">
                    </td>
                </tr>
                <uc1:WBSWorkDaysList ID="ucWBSWorkDaysList" runat="server" OnAfterGridBindEvent="AfterGridBindEvent" />
            </table>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (getWBSChecker) == 'function') {
            getWBSChecker();
        }
    }
</script>
