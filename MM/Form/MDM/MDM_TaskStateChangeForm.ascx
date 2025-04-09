<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MDM_TaskStateChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MDM.MDM_TaskStateChangeForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            任务编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtTaskCode" field="TASKCODE" tablename="MDM_TASKSTATECHANGEFORM"
                activestatus="(2.填写项目状态变更情况)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="TASKCODE" EnableTheming="false" Writeable="false"
                ShowAttrs="name" ResultForControls="{'hiTaskInfoFormID':'id','txtTaskName':'name','hiMarketProjectID':'MARKETPROJECTID','txtMarketProjectCode':'MARKETPROJECTCODE','txtMarketProjectName':'MARKETPROJECTNAME'}"
                req="1" PageUrl="~/MM/Obsolete/ProjectIssuedTaskSelector.aspx" OnClick="btnTask_Click">
            </zhongsoft:LightObjectSelector>
            <input id="hiTaskInfoFormID" type="hidden" field="TASKINFOFORMID" runat="server"
                tablename="MDM_TASKSTATECHANGEFORM" />
        </td>
        <td class="td-l">
            任务名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskName" field="TASKNAME" class="kpms-textbox"
                readonly="readonly" tablename="MDM_TASKSTATECHANGEFORM" activestatus="(23.填写项目状态变更情况)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectCode" field="MARKETPROJECTCODE"
                class="kpms-textbox" activestatus="(23.填写项目状态变更情况)" readonly="readonly" tablename="MDM_TASKSTATECHANGEFORM">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            工程名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectName" field="MARKETPROJECTNAME"
                class="kpms-textbox" activestatus="(23.填写项目状态变更情况)" readonly="readonly" tablename="MDM_TASKSTATECHANGEFORM">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiMarketProjectID" field="MARKETPROJECTID"
                tablename="MDM_TASKSTATECHANGEFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更状态<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbChangeState" field="CHANGESTATE" tablename="MDM_TASKSTATECHANGEFORM"
                req="1" activestatus="(23.填写项目状态变更情况)" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            是否同意<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rbIsAgree" field="ISAGREE" tablename="MDM_TASKSTATECHANGEFORM"
                req="1" activestatus="(3.主管院长审批)(3.院长审批)" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td colspan="6" height="25" style="font-weight: bold; text-align: center">
            项目列表
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvProjList" runat="server" UseDefaultDataSource="true"
                DataKeyNames="TASKSTATECHANGEDETAILID" OnRowCommand="gvChange_RowCommand" ShowExport="true"
                AllowPaging="true">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Wrap="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" MaxLength="20"
                        Width="200">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="DESIGNNAME" HeaderText="项目设总" Width="70">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FinishRate" HeaderText="完成率">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="TASKCODE" HeaderText="任务编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="TASKNAME" HeaderText="任务名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MANAGERNAME" HeaderText="经营经理">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该项目{0}吗？"
                        DeleteTipField="PROJECTCODE">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目状态变更基本情况<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeContent" CssClass="kpms-textarea" runat="server"
                req="1" TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_TASKSTATECHANGEFORM"
                field="CHANGEINFO" ActiveStatus="(23.填写项目状态变更情况)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<!---生产任务状态变更审批管理ID--->
<input type="hidden" runat="server" id="hiTaskStateChangeFormID" field="TASKSTATECHANGEFORMID"
    tablename="MDM_TASKSTATECHANGEFORM" />
