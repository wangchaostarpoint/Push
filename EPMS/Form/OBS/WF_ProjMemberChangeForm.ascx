<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjMemberChangeForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_ProjMemberChangeForm" %>
<%@ Register Src="../../UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUserChange.ascx" TagName="ProjectMgrUserChange" TagPrefix="uc3" %>
<%@ Register Src="../../UI/OBS/ProjectSpeUserChange.ascx" TagName="ProjectSpeUserChange" TagPrefix="uc5" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l" nowrap="nowrap">变更类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblChangeType" ActiveStatus="(2.提出成员变更)" AutoPostBack="true" OnSelectedIndexChanged="rblChangeType_SelectedIndexChanged"
                TableName="EPMS_ProjectResource" Field="ResourceType" RepeatDirection="Horizontal"
                req="1">
            </asp:RadioButtonList>
        </td>
    </tr>
    <uc1:ProjectCommon ID="ProjectCommon1" runat="server" />
    <uc3:ProjectMgrUserChange ID="mgrUser" runat="server" />
    <!--是否隐藏小专业 HideChildSpe="true" 是-->
    <uc5:ProjectSpeUserChange ID="speUser" runat="server" HideChildSpe="true" />
    <tr>
        <td class="td-l" nowrap="nowrap">变更原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeReason" runat="server" TextMode="MultiLine" MaxText="512"
                CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.*)"
                Field="ChangeReason" TableName="EPMS_ProjectResource">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">配置要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbResourceRequire" runat="server" TextMode="MultiLine"
                MaxText="512" CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.*)"
                Field="ResourceRequire" TableName="EPMS_ProjectResource">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
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
<input type="hidden" id="hiPutUserID" runat="server" field="PutUserID" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiPutUserName" runat="server" field="PutUserName" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiPhaseName" runat="server" value="施工图" />
<input type="hidden" id="hiCheckFlowMes" name="hiCheckFlowMes" runat="server" value="《项目组成员配置》流程还未发起,不能进行变更！" />
<input type="hidden" id="hiCheckFlowMes1" name="hiCheckFlowMes1" runat="server" value="该项目正在走《项目组成员变更》流程，为了避免人员更新错误，请先将正在运转的《项目组成员变更》流程结束然后再次发起《项目组成员变更》流程！" />
<input type="hidden" id="hiCheckFlowMes2" name="hiCheckFlowMes2" runat="server" value="该项目正在走《项目组成员配置》流程，为了避免人员更新错误，请先将正在运转的《项目组成员配置》流程结束然后再发起《项目组成员变更》流程！" />
<input type="hidden" id="hiCheckFlowMes3" name="hiCheckFlowMes3" runat="server" value="该项目专业人员未配置，仅能变更管理人员！" />

<script type="text/javascript">
    function checkForm() {
        if ($formAction == 0) {
            if (typeof (checkSelAllUserRole) == "function") {
                checkSelAllUserRole();
            }
            //if ($actName == "提出成员变更" || $actName == "配置专业人员") {
            //    if (typeof (CheckZrgAndAsr) == "function") {
            //        var value = CheckZrgAndAsr();
            //        if (value == "") {
            //            return true;
            //        } else {
            //            alert(value);
            //            return false;
            //        }
            //    }
            //}

            if (typeof (CheckZrgAndAsr) == "function") {
                if ($actName == "提出成员变更") {
                    var value = CheckZrgAndAsr(1);
                    if (value == "") {
                        return true;
                    } else {
                        alert(value);
                        return false;
                    }
                }
                else if ($actName == "配置专业人员") {
                    var value = CheckZrgAndAsr(3);
                    if (value == "") {
                        return true;
                    } else {
                        alert(value);
                        return false;
                    }
                }
            }
        }
        else if ($formAction == 2) {
            if ($actName == "提出成员变更") {
                var value = $("#<%=hiOrganizationId.ClientID %>").val();
                if (value == "") {
                    alert("请先选择项目！");
                    return false;
                }
            }
        }
        return true;
    }
</script>
