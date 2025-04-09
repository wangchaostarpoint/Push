<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BatchProjMgrUserChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_BatchProjMgrUserChangeForm" %>
<%@ Register Src="~/EPMS/UI/OBS/BatchProjectMgrUserChange.ascx" TagName="BatchProjectMgrUserChange"
    TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <uc1:BatchProjectMgrUserChange ID="ucBatchProjectMgrUserChange" runat="server" />
    <tr>
        <td class="td-l" nowrap="nowrap">
            提出人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                req="1" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="PutUserName" tablename="EPMS_ProjectResource">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutUserId" field="PutUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-l" nowrap="nowrap">
            批准人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbConfirmUserName" IsMutiple="false"
                req="1" activestatus="(23.审批)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiConfirmUserID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" field="ConfirmUserName" tablename="EPMS_ProjectResource"
                ShowSelectBtn="false"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiConfirmUserID" field="ConfirmUserID" tablename="EPMS_ProjectResource" />
        </td>
        <td class="td-l">
            批准时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbConfirmDate" activestatus="(23.审批)"
                EnableTheming="false" req="1" class="kpms-textbox-date" readonly="readonly" field="ConfirmDate"
                tablename="EPMS_ProjectResource" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">
            变更原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeReason" runat="server" TextMode="MultiLine" MaxText="512"
                CssClass="kpms-textarea" Width="96%" EnableTheming="false" ActiveStatus="(23.*)"
                Field="ChangeReason" TableName="EPMS_ProjectResource"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!--主键 -->
<input type="hidden" id="hiProjectResourceID" name="hiProjectResourceID" runat="server"
    field="ProjectResourceID" tablename="EPMS_ProjectResource" />
<input type="hidden" id="hiResourceType" name="hiResourceType" runat="server" field="ResourceType"
    tablename="EPMS_ProjectResource" value="2" />
<!---有权限的岗位名称-->
<input type="hidden" runat="server" id="hiAuthorRoleName" value='计划工程师' />
<script>
    function initCustomerPlugin() {
        initClickEvent();
    }

    //发送时的相关提示
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "提出成员变更") {
                var changeProjNum = getChangeProj();
                if (changeProjNum < 1) {
                    alert("请选择项目信息");
                    return false;
                }
                //是否有不符合规范的变更，同一角色存在多个人时，不能通过此流程进行变更
                var wrongProject = checkSelWrongProject();
                if (wrongProject != "") {
                    alert(wrongProject);
                    return false;
                }
                if (typeof (checkDelProj) == 'function') {
                    if (!checkDelProj()) return false;
                }
            }
        }
        return true;
    }

    //是否有不符合规范的变更，同一角色存在多个人时，不能通过此流程进行变更
    function checkSelWrongProject() {
        var json = { "projectSourceID": $bizCtx.bizId };
        var wrongProject = formCallback("CheckSelWrongProject", json);
        return wrongProject;
    }
</script>
