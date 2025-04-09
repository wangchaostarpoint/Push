<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjResourceAppointForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_ProjResourceAppointForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<%@ Register Src="../../UI/OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc3" %>
<script type="text/javascript">
    //查看关联项目立项、启动通知单
    function ViewProjectTask(formid, processid) {
        url = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=" + formid + "&prcinstid=" + processid;
        window.open(url, '_blank');
        return false;
    }
</script>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">项目模板<%--<span class="req-star">*</span>--%>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectTemplate" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectTemplateID':'id'}" EnableTheming="false"
                Text="选择模板" PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" FilterFunction="projTempFilter()" activestatus="(23.提出人员需求)"
                BeforeSelect="beforeSelectTemplate()" AfterSelect="return afterSelTemplate()" />
            <input type="hidden" runat="server" id="hiProjectTemplateID" name="hiProjectTemplateID" />
            <span color="red" displaystatus="(23.提出人员需求)" runat="server">如果找不到合适的模板请选择“空模板”</span>
            <input type="hidden" runat="server" id="hiOrginalTemplateID" />
        </td>
    </tr>

    <uc1:ProjectCommon ID="ProjectCommon1" runat="server" Filter="{ProjectState:'2'}"
        IsShowProjectUser="true" />
    <tr>
        <td class="td-l" nowrap="nowrap">提出人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                req="1" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                SelectPageMode="Dialog" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                ResultForControls="{'hiPutUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="PutUserName" tablename="EPMS_ProjectResource"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutUserId" field="PutUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-m" colspan="4"></td>
        <td class="td-l" nowrap="nowrap" style="display: none">关联工程立项审批单
        </td>
        <td class="td-r" style="display: none">
            <a runat="server" id="aProjectStart" title="点击查看工程立项审批单" class="aStyle"></a>
            <asp:Label runat="server" ID="lbNoProjectStartMsg" Text="该项目没有工程立项审批单" CssClass="aStyle-red"
                Visible="false"></asp:Label>
        </td>
        <td class="td-l" nowrap="nowrap" style="display: none">关联生产任务单
        </td>
        <td class="td-m" colspan="3" style="display: none">
            <a runat="server" id="aProjectTask" title="点击查看生产任务单" class="aStyle"></a>
            <asp:Label runat="server" ID="lbNoTaskMsg" Text="该项目没有生产任务单" CssClass="aStyle-red"
                Visible="false"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">配置要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbResourceRequire" runat="server" TextMode="MultiLine"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.提出人员需求)"
                Field="ResourceRequire" TableName="EPMS_ProjectResource"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <uc2:ProjectMgrUser ID="ProjectMgrUser1" runat="server" />
    <!--是否隐藏小专业 HideChildSpe="true" 是-->
    <uc3:ProjectSpeUser ID="ProjectSpeUser1" runat="server" HideChildSpe="true" />
</table>
<!--主键 -->
<input type="hidden" id="hiProjectResourceID" name="hiProjectResourceID" runat="server"
    field="ProjectResourceID" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
    field="OrganizationID" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiResourceType" name="hiResourceType" runat="server" field="ResourceType"
    tablename="EPMS_ProjectResource" value="3" />
<input type="hidden" id="hiParamBusinessPlateID" name="hiParamBusinessPlateID" runat="server" />
<input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="已经存在发起的项目组成员配置流程,不能重复发起！" />
<input type="hidden" runat="server" id="hiIsAllUsers" />
<asp:Button ID="btnBindTemSpe" runat="server" OnClick="btnBindTemSpe_Click" Style="display: none" />
<script type="text/javascript">
    function afterSelTemplate() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindTemSpe,"")%>;
        return false;
    }

    //选择项目模板筛选（业务类型、业务板块筛选）
    function projTempFilter() {
        var organizationID = '<%=OrganizationId %>';
        if (organizationID == "") {
            organizationID = '<%=ProjectCommon1.ProjectId %>';
        }
        return { 'OrganizationID': organizationID };
    }

    //选择项目模板前
    function beforeSelectTemplate() {
        var orgID = $("#<%=hiOrganizationId.ClientID %>").val();
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        $("#<%=hiOrginalTemplateID.ClientID %>").val($("#<%=hiProjectTemplateID.ClientID %>").val());
        return true;
    }

    function checkForm() {
        if ($formAction == 2) {
            if ($actName == "提出人员需求") {
                var value = $("#<%=hiOrganizationId.ClientID %>").val();
                if (value == "") {
                    alert("请先选择项目！");
                    return false;
                }
            }
        }
        else if ($formAction == 0) {
            if (!beforSend()) {
                return false;
            }
            else if (($actName == "配置专业人员" || $actName == "各分院配置专业人员" || $actName == "提出人员需求") && !checkHasUser()) {
                alert("请将人员配置完全");
                return false;
            } else if (($actName == "汇总") && checkHasUser()) {
                $("#<%=hiIsAllUsers.ClientID%>").val("1");
                return true;
            } else {
                $("#<%=hiIsAllUsers.ClientID%>").val("0");
            }
        }
        return true;
    }
</script>
