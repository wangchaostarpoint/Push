<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PurchaseApplyChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_PurchaseApplyChangeForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l" nowrap>
            申请类型（大类）<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5" nowrap>
            <asp:RadioButtonList ID="rblApplyBigType" runat="server" RepeatDirection="Horizontal"
                req="1" AutoPostBack="true" OnSelectedIndexChanged="rblApplyBigType_SelectedIndexChanged"
                field="APPLYBIGTYPE" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(2.填写变更申请) ">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            采购申请号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsApplyCode" ActiveStatus="(2.填写变更申请)"
                SourceMode="SelectorPage" field="APPLYCODE" tablename="MBM_PURCHASEAPPLYORBGFORM"
                OnClientClick="return getApplyValue();" OnClick="lbsApplyCode_Click" />
            <%--            <input type="hidden" id="hiApplyCode" runat="server" field="APPLYCODE" tablename="MBM_PURCHASEAPPLYORBGFORM" />
            --%>
        </td>
        <td class="td-l">
            变更流水号
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtApplyCode" Field="APPLYBCODE" class="kpms-textbox"
                tableName="MBM_PURCHASEAPPLYORBGFORM" readonly="readonly" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr id="applyLittleType">
        <td class="td-l" nowrap>
            申请类型（小类）<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5" nowrap>
            <asp:RadioButtonList ID="rblApplyLittleType" runat="server" RepeatDirection="Horizontal"
                applyGCNX="1" specialType="1" readonly="readonly" field="APPLYLITTLETYPE" tablename="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(2.?)">
            </asp:RadioButtonList>
            <input type="hidden" id="hiApplyLittleType" runat="server" field="APPLYLITTLETYPE"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr id="projBase">
        <td class="td-l">
            项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" ActiveStatus="(23.填写变更申请)(23.修改变更申请)"
                applyGCKY="1" readonly="readonly" class="kpms-textbox" field="PROJECTCODE" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtProjectName" Field="PROJECTNAME" class="kpms-textbox"
                applyGCKY="1" readonly="readonly" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiProjectId" runat="server" field="PROJECTID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr id="projExpend">
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtDesignPhase" Field="DESIGNPHASE" class="kpms-textbox"
                applyGC="1" readonly="readonly" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l" nowrap>
            项目合同额（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectMoney" Field="PROJECTMONEY" ReadOnly="true"
                applyGC="1" class="kpms-textbox-money" EnableTheming="false" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            工程合同状态
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractState" Field="CONTRACTSTATE" class="kpms-textbox-short"
                applyGC="1" specialType="1" EnableTheming="false" ReadOnly="true" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l" gcky="1" runat="server">
            项目设总
        </td>
        <td class="td-r" gcky="1" runat="server">
            <zhongsoft:XHtmlInputText ID="txtProjectManager" Field="PROJECTMANAGER" class="kpms-textbox"
                applyGCKY="1" readonly="readonly" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiProjectManagerId" runat="server" field="PROJECTMANAGERID"
                applygc="1" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l" ky="1" runat="server">
            项目实施部门
        </td>
        <td class="td-r" ky="1" runat="server">
            <zhongsoft:XHtmlInputText ID="txtImplementDept" Field="IMPLEMENTDEPT" class="kpms-textbox"
                applyKY="1" readonly="readonly" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l" ky="1" runat="server">
            联系方式
        </td>
        <td class="td-r" ky="1" runat="server">
            <zhongsoft:XHtmlInputText ID="txtPhone" Field="PHONE" class="kpms-textbox" tableName="MBM_PURCHASEAPPLYORBGFORM"
                applyKY="1" activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr applygc="1">
        <td class="td-l">
            任务编号
        </td>
        <td class="td-r">
            <%--  <zhongsoft:LightObjectSelector runat="server" ID="lboTaskCode" field="ISSIUEDTASKCODE"
                tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(2.填写变更申请)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" ResultForControls="{'hiIssuedTaskID':'id','txtTaskName':'name'}"
                DoCancel="true" ResultAttr="TASKCODE" EnableTheming="false" Writeable="false"
                ShowAttrs="name" FilterFunction="selTask();" PageUrl="~/MM/Obsolete/ProjectIssuedTaskSelector.aspx">
            </zhongsoft:LightObjectSelector>--%>
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskCode" field="ISSIUEDTASKCODE"
                readonly="readonly" class="kpms-textbox" tablename="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiIssuedTaskID" field="ISSIUEDTASKID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            任务名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="XHtmlInputText1" field="ISSUEDTASKNAME"
                tablename="MBM_PURCHASEAPPLYORBGFORM" readonly="readonly" class="kpms-textbox"
                activestatus="(23.填写变更申请)(23.修改变更申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr applygc="1">
        <td class="td-l">
            工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="ttxProjectCode" field="MARKETPROJECTCODE"
                readonly="readonly" class="kpms-textbox" tablename="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)">
            </zhongsoft:XHtmlInputText>
            <%--  <zhongsoft:LightObjectSelector runat="server" ID="losProjectCode" field="MARKETPROJECTCODE"
                tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(2.填写变更申请)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="PROJECTCODE" FilterFunction="selMarketProject();"
                EnableTheming="false" Writeable="false" ResultForControls="{'hiMarketProjectID':'id','txtMarketProjectName':'name'}"
                ShowAttrs="name" PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx"></zhongsoft:LightObjectSelector>--%>
            <input type="hidden" runat="server" id="hiMarketProjectID" field="MARKETPROJECTID"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            工程名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectName" field="MARKETPROJECTNAME"
                readonly="readonly" class="kpms-textbox" tablename="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr id="purchase">
        <td class="td-l">
            项目负责人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtChargerName" Field="CHARGERNAME" class="kpms-textbox"
                applyNX="1" readonly="readonly" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiChargerId" applynx="1" runat="server" field="CHARGERID"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
            <input type="hidden" id="hiChargerCode" applynx="1" runat="server" field="CHARGERCODE"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            设备类型
        </td>
        <td class="td-m" nowrap colspan="3">
            <asp:RadioButtonList ID="rblDeviceType" runat="server" RepeatDirection="Horizontal"
                applyNX="1" specialType="1" readonly="readonly" field="DEVICETYPE" tablename="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="purchaseContent">
        <td class="td-l">
            采购任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtTaskName" Field="TASKNAME" class="kpms-textbox"
                applyGCNX="1" ReadOnly="readonly" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            估算价格（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEstimatedPrice" Field="ESTIMATEDPRICE" readonly="readonly"
                class="kpms-textbox-money" EnableTheming="false" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(2.填写变更申请)" runat="server">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyerName" Field="APPLYERNAME" class="kpms-textbox"
                EnableTheming="false" ReadOnly="true" tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)"
                runat="server">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiApplyerId" runat="server" field="APPLYERID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
            <input type="hidden" id="hiApplyerCode" runat="server" field="APPLYERCODE" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            创建日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtFillDate" tablename="MBM_PURCHASEAPPLYORBGFORM"
                readonly="readonly" class="kpms-textbox-date" field="FILLDATE" activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
    </tr>
    <tr id="dept">
        <td class="td-l">
            采购申请部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" Field="APPLYDEPTNAME" class="kpms-textbox"
                EnableTheming="false" ReadOnly="true" applyGCNX="1" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiApplyDeptId" runat="server" applygcnx="1" field="APPLYDEPTID"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l">
            专业室
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtProfessionalRoomName"
                applyGCNX="1" tablename="MBM_PURCHASEAPPLYORBGFORM" class="kpms-textbox" EnableTheming="false"
                ReadOnly="true" field="PROFESSIONALROOMNAME" activestatus="(23.填写变更申请)(23.修改变更申请)" />
            <input type="hidden" id="hiProfessionalRoomId" applygcnx="1" runat="server" field="PROFESSIONALROOMID"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-m" colspan="2">
        </td>
    </tr>
    <tr id="range">
        <td class="td-l">
            采购范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList ID="rblPurchaseRange" runat="server" RepeatDirection="Horizontal"
                applyGC="1" specialType="1" readonly="readonly" field="PURCHASERANGE" tablename="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(1.?)">
            </asp:RadioButtonList>
            <input type="hidden" id="hiPurchaseRange" runat="server" field="PURCHASERANGE" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr id="trSpecialty">
        <td class="td-l">
            委托内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cbSpecialty" activestatus="(23.?)" RepeatDirection="Horizontal"
                RepeatColumns="5">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr id="isBudget">
        <td class="td-l" nowrap>
            是否为预算项目<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsBudget" runat="server" RepeatDirection="Horizontal"
                applyGCNX="1" specialType="1" field="ISBUDGET" tablename="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(2.?)">
                <asp:ListItem Value="0">是</asp:ListItem>
                <asp:ListItem Value="1">否</asp:ListItem>
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiIsBudget" field="ISBUDGET" tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
        <td class="td-l" id="budget">
            预算额度（万元）
        </td>
        <td class="td-r" id="budgetMoney">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtBudgetMoney" applyGCNX="1"
                tablename="MBM_PURCHASEAPPLYORBGFORM" class="kpms-textbox" EnableTheming="false"
                ReadOnly="true" field="BUDGETMONEY" activestatus="(23.填写变更申请)(23.修改变更申请)" />
            <%--  <zhongsoft:LightTextBox ID="tbBudgetMoney" Field="BUDGETMONEY" applyGCNX="1" Regex="(^[1-9]\d{0,9}(\.\d{1,6})?$)|(^[0]\.\d{1,6}$)"
                ErrMsg="请输入正数，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(2.?)" runat="server">
            </zhongsoft:LightTextBox>--%>
        </td>
        <td class="td-m" colspan="2" id="tdBudget1">
        </td>
    </tr>
    <tr id="reason">
        <td class="td-l">
            非预算内项目原因说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbNotBudgetReason" Field="NOTBUDGETREASON" CssClass="kpms-textarea"
                EnableTheming="false" Rows="2" TextMode="MultiLine" applyGCNX="1" tableName="MBM_PURCHASEAPPLYORBGFORM"
                ReadOnly="true" activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server" maxtext="1024">
            </zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiNotBudgetReason" field="NOTBUDGETREASON"
                tablename="MBM_PURCHASEAPPLYORBGFORM" />
        </td>
    </tr>
    <tr id="delegateRollInfo">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvDelegateRoll" runat="server" AllowPaging="true"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="DELEGATEDETAILID"
                BindGridViewMethod="UserControl.BindRollInfo" ShowHeaderWhenEmpty="true" ShowExport="true">
                <Columns>
                    <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="专业代字" />
                    <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" />
                    <zhongsoft:LightBoundField DataField="RollCode" HeaderText="卷册编号" />
                    <zhongsoft:LightBoundField DataField="RollName" HeaderText="卷册名称" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="value">
        <td class="td-l">
            采购内容签入合同额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSignMoney" tablename="MBM_PURCHASEAPPLYORBGFORM"
                class="kpms-textbox" EnableTheming="false" ReadOnly="true" field="SIGNMONEY"
                activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
        <td class="td-m" colspan="4">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            采购承办人<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsPurchaseHandlerName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                req="1" ResultAttr="name" ActiveStatus="(23.填写变更申请)(23.修改变更申请)" ResultForControls="{'hiPurchaseHandlerId':'id','hiPurchaseHandlerCode':'code'}"
                IsMutiple="true" SourceMode="SelectorPage" field="PURCHASEHANDLERNAME" tablename="MBM_PURCHASEAPPLYORBGFORM" />
            <input id="hiPurchaseHandlerId" type="hidden" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                field="PURCHASEHANDLERID" />
            <input id="hiPurchaseHandlerCode" type="hidden" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                field="PURCHASEHANDLERCODE" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="applyReason">
    <tr>
        <td align="center" style="font-weight: bold" colspan="6">
            申请理由
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            <asp:CheckBox runat="server" ID="cbIsHumanResourceReason" field="ISHUMANRESOURCE"
                checkBoxType="1" tablename="MBM_PURCHASEAPPLYORBGFORM" applyReason="1" Text="人力资源"
                activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightTextBox ID="tbProjectRun" runat="server" activestatus="(23.填写变更申请)(23.修改变更申请)"
                Field="PROJECTRUN" TableName="MBM_PURCHASEAPPLYORBGFORM" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="3" maxtext="1024"></zhongsoft:LightTextBox>
        </td>
        <td class="td-m" colspan="2">
            简述
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbHRMemo" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="HRMEMO"
                TableName="MBM_PURCHASEAPPLYORBGFORM" applyGCKY="1" Rows="3" maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsEquipmentReason" field="ISEQUIPMENT" tablename="MBM_PURCHASEAPPLYORBGFORM"
                checkBoxType="1" applyReason="1" Text="设备" activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightTextBox ID="tbEquipmentName" runat="server" activestatus="(23.填写变更申请)(23.修改变更申请)"
                Field="EQUIPMENTNAME" TableName="MBM_PURCHASEAPPLYORBGFORM" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="3" maxtext="1024" />
        </td>
        <td class="td-m" colspan="2">
            简述
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbEquipmentMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="EQUIPMENTMEMO" TableName="MBM_PURCHASEAPPLYORBGFORM" applyGCKY="1" Rows="3"
                maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsProfessionReason" field="ISPROFESSION" tablename="MBM_PURCHASEAPPLYORBGFORM"
                checkBoxType="1" applyReason="1" Text="资质" activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightTextBox ID="tbNeedProfession" runat="server" activestatus="(23.填写变更申请)(23.修改变更申请)"
                Field="NEEDPROFESSION" TableName="MBM_PURCHASEAPPLYORBGFORM" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" Rows="3" maxtext="1024" />
        </td>
        <td class="td-m" colspan="2">
            简述
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbProfessionMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="ProfessionMemo" TableName="MBM_PURCHASEAPPLYORBGFORM" applyGCKY="1" Rows="3"
                maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbAbilityReason" field="ISABILITY" tablename="MBM_PURCHASEAPPLYORBGFORM"
                checkBoxType="1" applyReason="1" Text="能力" activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbAbilityMemo"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="ABILITYMEMO" TableName="MBM_PURCHASEAPPLYORBGFORM" applyGCKY="1" Rows="3"
                maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsReason" field="ISREASON" tablename="MBM_PURCHASEAPPLYORBGFORM"
                checkBoxType="1" applyReason="1" Text="成本原因（经济核算）" activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbReasonMemo" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="REASONMEMO"
                TableName="MBM_PURCHASEAPPLYORBGFORM" applyGCKY="1" Rows="3" maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <asp:CheckBox runat="server" ID="cbIsOtherReason" field="ISOTHER" tablename="MBM_PURCHASEAPPLYORBGFORM"
                checkBoxType="1" applyReason="1" Text="其他" activestatus="(23.填写变更申请)(23.修改变更申请)" />
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbOtherMemo" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="OTHERMEMO"
                TableName="MBM_PURCHASEAPPLYORBGFORM" applyGCKY="1" Rows="3" maxtext="1024" />
        </td>
    </tr>
</table>
<table id="projRequire" class="tz-table" width="100%">
    <tr>
        <td align="center" style="font-weight: bold" colspan="6">
            项目要求
        </td>
    </tr>
    <tr>
        <td class="td-l">
            具体采购范围、内容、资质要求
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbQualificatioinYq"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="QUALIFICATIONYQ" TableName="MBM_PURCHASEAPPLYORBGFORM" applyNX="1" Rows="3"
                maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工期或供货时间要求
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbDateYq" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="DATEYQ"
                TableName="MBM_PURCHASEAPPLYORBGFORM" applyNX="1" Rows="3" maxtext="1024" />
        </td>
    </tr>
    <tr id="parameter">
        <td class="td-l">
            规格型号、配置、参数
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbParameterYq"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="PARAMETERYQ" TableName="MBM_PURCHASEAPPLYORBGFORM" applyNX="1" Rows="3"
                maxtext="1024" />
        </td>
    </tr>
    <tr id="detail">
        <td class="td-l">
            图纸、工作量清单
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbDetailedList"
                runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="DETAILEDLIST" TableName="MBM_PURCHASEAPPLYORBGFORM" applyNX="1" Rows="3"
                maxtext="1024" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验收标准及方式
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.填写变更申请)(23.修改变更申请)" ID="tbMethod" runat="server"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Field="METHODS"
                TableName="MBM_PURCHASEAPPLYORBGFORM" applyNX="1" Rows="3" maxtext="1024" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            采购内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbPurchaseContent" Field="PURCHASECONTENT" CssClass="kpms-textarea"
                ReadOnly="true" EnableTheming="false" TextMode="MultiLine" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server" Rows="3">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="purchaseReason">
        <td class="td-l">
            采购原因
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbPurchaseReason" Field="PURCHASEREASON" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" applyNX="1" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="qualified">
        <td align="center" style="font-weight: bold" colspan="6">
            合格供方推荐单位<span id="Span2" class="req-star" runat="server" displaystatus="(2.*)">先保存再选择单位</span>
        </td>
    </tr>
    <tr id="qualifiedAdd" displaystatus="(23.填写变更申请)(23.修改变更申请)" runat="server">
        <td align="right" colspan="6">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsQualifiedSupplier" IsMutiple="true"
                FilterFunction="qualifiedSupplierFilter()" EnableTheming="false" Text="选择合格供方单位"
                OnlyShowButton="true" PageUrl="~/MM/Obsolete/SupplierSelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(3.填写变更申请)(3.修改变更申请)" OnClick="lbsQualifiedSupplier_Click" />
        </td>
    </tr>
    <tr id="qualifiedList">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvQualifiedList" runat="server" DataKeyNames="UINTID"
                AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="gvQualifiedList_RowCommand"
                UseDefaultDataSource="true">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SUPPLYNAME" HeaderText="单位名称" />
                    <asp:BoundField DataField="CONTACTER" HeaderText="联系人" />
                    <asp:BoundField DataField="TELEPHONE" HeaderText="联系电话" />
                    <asp:TemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                            <input type="hidden" id="hiSupplierId" value='<%#Eval("SUPPLYID") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="unit">
        <td align="center" style="font-weight: bold" colspan="6">
            供方推荐单位<span id="Span3" class="req-star" runat="server" displaystatus="(2.*)">先保存再选择单位</span>
        </td>
    </tr>
    <tr id="unitAdd">
        <td align="right" colspan="6">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsUnit" IsMutiple="true" FilterFunction="unitFilter()"
                EnableTheming="false" Text="选择供方单位" OnlyShowButton="true" PageUrl="~/MM/Obsolete/SupplierSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(3.填写变更申请)(3.修改变更申请)"
                OnClick="lbsUnit_Click" />
        </td>
    </tr>
    <tr id="unitList">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvUnit" runat="server" DataKeyNames="UINTID" AutoGenerateColumns="False"
                AllowPaging="True" OnRowCommand="gvUnit_RowCommand" UseDefaultDataSource="true">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SUPPLYNAME" HeaderText="单位名称" />
                    <asp:BoundField DataField="CONTACTER" HeaderText="联系人" />
                    <asp:BoundField DataField="TELEPHONE" HeaderText="联系电话" />
                    <asp:TemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                            <input type="hidden" id="hiSupplierId" value='<%#Eval("SUPPLYID") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="notIn">
        <td align="center" style="font-weight: bold" colspan="6">
            非库中推荐单位<span id="Span4" class="req-star" runat="server" displaystatus="(2.*)">先保存再选择单位</span>
        </td>
    </tr>
    <tr id="notInAdd">
        <td align="right" colspan="6">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsNotInUnit" IsMutiple="true"
                Filter="{SupplierType:'3'}" EnableTheming="false" Text="选择非库中单位" OnlyShowButton="true"
                PageUrl="~/MM/Obsolete/SupplierSelector.aspx" ShowJsonRowColName="true" ResultAttr="name"
                activestatus="(3.填写变更申请)(3.修改变更申请)" OnClick="lbsNotInUnit_Click" />
        </td>
    </tr>
    <tr id="notInList">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvNotInUnit" runat="server" DataKeyNames="UINTID"
                AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="gvNotInUnit_RowCommand"
                UseDefaultDataSource="true">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SUPPLYNAME" HeaderText="单位名称" />
                    <asp:BoundField DataField="CONTACTER" HeaderText="联系人" />
                    <asp:BoundField DataField="TELEPHONE" HeaderText="联系电话" />
                    <asp:TemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                            <input type="hidden" id="hiSupplierId" value='<%#Eval("SUPPLYID") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <%--<tr id="more">
        <td align="left" style="color: Red" colspan="6">
            <span id="Span5" class="req-star" runat="server" displaystatus="(23.填写变更申请)(23.修改变更申请)">
                推荐单位之间请用英文逗号隔开</span>
        </td>
    </tr>--%>
    <tr id="inUnit">
        <%-- <td class="td-l">
            推荐单位
        </td>--%>
        <%-- <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtApplyUnit" Field="APPLYUNIT" class="kpms-textbox"
                tableName="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server">
            </zhongsoft:XHtmlInputText>
        </td>--%>
        <td align="center" style="font-weight: bold" colspan="6">
            推荐单位<span id="Span5" class="req-star" runat="server" displaystatus="(2.*)">先保存再添加单位</span>
        </td>
    </tr>
    <tr id="inUnitAdd" displaystatus="(3.填写变更申请)(3.修改变更申请)" runat="server">
        <td align="right" style="font-weight: bold" colspan="6">
            添加
            <zhongsoft:LightTextBox runat="server" ID="tdNum" Width="30px" Style="text-align: right"
                regex="\d{1,3}" errmsg="请输入正确的行号！">
            </zhongsoft:LightTextBox>
            行
            <asp:Button ID="btnAddApply" runat="server" Text="确定" OnClick="btnAddApply_Click"
                class="btn" />
        </td>
    </tr>
    <tr id="inUnitList">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvApplyUnit" runat="server" DataKeyNames="UINTID"
                AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="gvApplyUnit_RowDataBound"
                OnRowCommand="gvApplyUnit_RowCommand" UseDefaultDataSource="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="单位名称<span class='req-star'>*</span>" HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbName" runat="server" class="kpms-textbox" MaxLength="64"
                                req="1" Text='<%# DataBinder.Eval(Container.DataItem, "SUPPLYNAME") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="联系人<span class='req-star'>*</span>" HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPerson" runat="server" class="kpms-textbox" MaxLength="18"
                                req="1" Text='<%# DataBinder.Eval(Container.DataItem, "CONTACTPERSON") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="联系电话<span class='req-star'>*</span>" HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPhone" runat="server" class="kpms-textbox" MaxLength="16"
                                Regex="^[1-9]\d*$" errmsg="请输入整数" req="1" Text='<%# DataBinder.Eval(Container.DataItem, "TELEPHONE") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("UINTID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            推荐供方理由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRecommendReason" Field="RECOMMENDREASON" CssClass="kpms-textarea"
                EnableTheming="false" Rows="2" TextMode="MultiLine" req="1" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            不足三家原因说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbNotMeetReason" Field="NOTMEETREASON" CssClass="kpms-textarea"
                EnableTheming="false" Rows="2" TextMode="MultiLine" tableName="MBM_PURCHASEAPPLYORBGFORM"
                activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server" maxtext="1024">
            </zhongsoft:LightTextBox>
            <br />
            填写说明：
            <asp:Label runat="server" ID="lbDescription"></asp:Label>
        </td>
    </tr>
    <tr id="memo">
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" Field="MEMO" tableName="MBM_PURCHASEAPPLYORBGFORM"
                applyNX="1" activestatus="(23.填写变更申请)(23.修改变更申请)" runat="server" maxtext="256"
                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="5">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="materials">
    <tr>
        <td align="center" style="font-weight: bold" colspan="6">
            科技项目资料<span id="Span1" class="req-star" runat="server" displaystatus="(2.*)">请先保存再上传资料</span>
        </td>
    </tr>
    <tr displaystatus="(3.填写变更申请)(3.修改变更申请)" runat="server">
        <td align="right" style="font-weight: bold" colspan="6">
            添加
            <zhongsoft:XHtmlInputText runat="server" ID="txtRowNum" Regex="\d{1,3}" ErrMsg="请输入正确的行号！"
                class="kpms-textbox-money" EnableTheming="false">
            </zhongsoft:XHtmlInputText>
            行
            <asp:Button runat="server" ID="btnSure" Text="确定" OnClick="btnSure_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvMaterials" runat="server" ShowExport="false"
                UseDefaultDataSource="true" AllowPaging="true" DataKeyNames="MATERIALSID" OnRowDataBound="gvMaterials_RowDataBound"
                OnRowCommand="gvMaterials_RowCommand" PermissionStatus="true">
                <Columns>
                    <asp:TemplateField HeaderText="资料编号" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbMaterialsCode" Text='<%#Eval("MATERIALSCODE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="资料类别" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="13%">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlType" activestatus="(23.填写变更申请)(23.修改变更申请)"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                            </zhongsoft:LightDropDownList>
                            <input type="hidden" id="hiType" value='<%#Eval("MATERIALSTYPE") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="资料名称" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="55%">
                        <ItemTemplate>
                            <uc1:AttachmentView ID="AttaListFile" runat="server" RepeatColumns="1" ShowDelete="true"
                                ShowDeleteBySelf="true" />
                            <input type="hidden" runat="server" id="hiUploadId" value='<%#Eval("MATERIALSID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="上传资料" ItemStyle-HorizontalAlign="center" HeaderStyle-Width="60px">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif" runat="server"
                                CommandName="UploadFile" Style="cursor: hand; height: 16px;" ToolTip="上传资料" CausesValidation="false"
                                DisplayStatus="(3.*)" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDeleteActor" EnableTheming="false" CommandName="DeleteData"
                                OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("MATERIALSID") %>'>
                                <img alt="删除" title="删除" src="../../Themes/Images/btn_dg_delete.gif" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" nodisplaystatus="(2.填写变更申请)" runat="server">
    <tr>
        <td align="center" style="font-weight: bold" colspan="6">
            历史信息
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvOldData" runat="server" ShowExport="false" UseDefaultDataSource="true"
                AllowPaging="true">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField DataField="APPLYBIGTYPE" HeaderText="申请类型">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PURCHASECONTENT" HeaderText="采购内容" MaxLength="20">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="TASKNAME" HeaderText="采购任务名称" MaxLength="15">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FILLDATE" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd }">
                        <ItemStyle HorizontalAlign="Center" />
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnView" EnableTheming="false">
                                <img alt="查看" title="查看" src="../../Themes/Images/btn_dg_view.gif"                                 
                                     onclick="return viewFlow('<%#Eval("Fid") %>','<%#Eval("Pid") %>')" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<%--流程主键ID--%>
<input type="hidden" id="hiApplyId" runat="server" field="APPLYID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
<input type="hidden" id="hiParentId" runat="server" field="PARENTID" tablename="MBM_PURCHASEAPPLYORBGFORM" />
<%-- 申请批准时间--%>
<input type="hidden" id="hiReceive" runat="server" field="RECEIVETIME" tablename="MBM_PURCHASEAPPLYORBGFORM" />
<%--申请OR变更--%>
<input type="hidden" id="hiApplyOrBg" runat="server" field="APPLYORBG" tablename="MBM_PURCHASEAPPLYORBGFORM"
    value="1" />
<input type="hidden" id="hiValue" runat="server" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameA" runat="server" value="部门负责人" />
<input type="hidden" id="hiRoleNameC" runat="server" value="主管院长" />
<input type="hidden" id="hiRoleNameE" runat="server" value="科室负责人" />
<input type="hidden" id="hiRoleNameF" runat="server" value="采购专责" />
<input type="hidden" id="hiDeptNameD" runat="server" value="总承包事业部" />
<input type="hidden" id="hiDeptNameC" runat="server" value="总包采购室" />
<input type="hidden" runat="server" id="hiPurchaseContent" />
<%--有效--%>
<input type="hidden" id="hiIsEffective" runat="server" field="ISEFFECTIVE" tablename="MBM_PURCHASEAPPLYORBGFORM"
    value="0" />
<script type="text/javascript">
    var changeValue = 0;
    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();
        //控制卷册和专业的显隐性
        displayOfRollAndSpe();
        //控制供方列表的显隐，工程项目外委时才显示供方列表
        displayOfSupply();
        //控制推荐单位不足三家的说明
        displayOfDescription();
        if ($actName == "填写变更申请") {
            $("#applyLittleType").hide();
            $("#projBase").hide();
            $("#projExpend").hide();
            $("#purchase").hide();
            $("#purchaseContent").hide();
            $("#dept").hide();
            $("#range").hide();
            $("#isBudget").hide();
            $("#budget").hide();
            $("#budgetMoney").hide();
            $("#reason").hide();
            $("#checkMoney").hide();
            $("#purchaser").hide();
            $("#applyReason").hide();
            $("#purchaseReason").hide();
            $("#memo").hide();
            $("#isNeedMaterial").hide();
            $("#projRequire").hide();
            $("#parameter").hide();
            $("#detail").hide();
            $("#materials").hide();
            $("#inUnit").hide();
            $("#<%=inUnitAdd.ClientID %>").hide();
            $("#inUnitList").hide();
            //            $("#more").hide();
            $("#qualified").hide();
            $("#<%=qualifiedAdd.ClientID %>").hide();
            $("#qualifiedList").hide();
            $("#unit").hide();
            $("#unitAdd").hide();
            $("#unitList").hide();
            $("#notIn").hide();
            $("#notInAdd").hide();
            $("#notInList").hide();
            $("#value").hide();
            var $value = $("[ky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[gcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[gc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
        }

        //采购申请类型（大类）不同，显示不同内容
        var applyType = $("#<%=rblApplyBigType.ClientID %> input[type='radio']:checked").val();
        setApplyTypeControl(applyType, "");

        $('#<%=rblApplyBigType.ClientID %>').click(function () {
            var applyBigType = $("#<%=rblApplyBigType.ClientID %> input[type='radio']:checked").val();
            setApplyTypeControl(applyBigType, "change");
        })

        //采购申请类型（小类）不同，显示不同内容
        var applyLitType = $("#<%=rblApplyLittleType.ClientID %> input[type='radio']:checked").val();
        setLittleTypeControl(applyLitType);

        $('#<%=rblApplyLittleType.ClientID %>').click(function () {
            var applyLittleType = $("#<%=rblApplyLittleType.ClientID %> input[type='radio']:checked").val();
            setLittleTypeControl(applyLittleType);
        })

        //是否为预算项目，显示不同内容
        var budget = $("#<%=rblIsBudget.ClientID %> input[type='radio']:checked").val();
        setBudgetControl(budget);

        $('#<%=rblIsBudget.ClientID %>').click(function () {
            var isBudget = $("#<%=rblIsBudget.ClientID %> input[type='radio']:checked").val();
            setBudgetControl(isBudget);
        })
    }

    //查看申请流程
    function viewFlow(formid, processInstanceId) {
        //待改，拼url方法
        var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + formid + "&prcInstId=" + processInstanceId;
        window.open(urlStr);
        return false;
    }

    //选择采购申请后，带出相应的数据
    function getApplyValue() {
        var applyType = $("#<%=rblApplyBigType.ClientID %> input[type='radio']:checked").val();

        if (applyType != "" && applyType != null) {
            applyType = "'" + applyType + "'";
            var param = new InputParamObject("s");
            //只可选择同一采购类型的采购申请
            var re = getApplyInfo('<%=hiValue.ClientID %>', param, "{ApplyType:" + applyType + "}");
            if (re != null) {
                var $value = $("[Field]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    if ($($value[i]).attr("specialType") != undefined && $($value[i]).attr("specialType") != null && $($value[i]).attr("specialType") != "") {
                        selectRadlItem($($value[i]).attr("id"), re.buildAttrJson("o", $($value[i]).attr("Field")));
                        continue;
                    }
                    $($value[i]).next().val(re.buildAttrJson("o", $($value[i]).attr("Field")));
                    $($value[i]).val(re.buildAttrJson("o", $($value[i]).attr("Field")));
                }

                $("#<%=hiApplyOrBg.ClientID %>").val("1");
                $("#<%=hiPurchaseContent.ClientID %>").val(re.buildAttrJson("o", "PURCHASECONTENT"));
            }
            return true;
        }
        else {
            alert("请先选择申请类型！");
            return false;
        }
    }

    //让radiobutton选中值
    function selectRadlItem(radl, itemValue) {
        $("#" + radl).find("input").each(function () {
            if ($(this).val() == itemValue) {
                $(this).attr("checked", "checked");
                return false;
            }
        });
    }

    function selectCheckBoxItem(obj, itemValue) {
        alert(($(obj)).next()[0].checked);
    }

    //采购申请类型（大类）不同，显示不同内容
    function setApplyTypeControl(applyType, type) {
        if (applyType == "工程项目外委") {
            $("#value").show();
            $("#applyLittleType").show();
            $("#projBase").show();
            $("#projExpend").show();
            $("#purchase").hide();
            $("#purchaseContent").show();
            $("#dept").show();
            $("#range").show();
            $("#isBudget").show();
            $("#checkMoney").show();
            $("#purchaser").show();
            $("#applyReason").show();
            $("#purchaseReason").hide();
            $("#memo").show();
            $("#isNeedMaterial").show();
            $("#projRequire").hide();
            $("#materials").hide();
            $("#inUnit").hide();
            $("#<%=inUnitAdd.ClientID %>").hide();
            $("#inUnitList").hide();
            //$("#more").hide();
            $("#qualified").show();
            $("#<%=qualifiedAdd.ClientID %>").show();
            $("#qualifiedList").show();
            $("#unit").show();
            $("#unitAdd").show();
            $("#unitList").show();
            $("#notIn").show();
            $("#notInAdd").show();
            $("#notInList").show();

            var $value = $("[ky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[gcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[gc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }

            if (type == "change") {
                if (changeValue != 0) {
                    alert("更改采购申请类型时，将会清空之前填写的部分信息！");
                }
                $("#<%=txtApplyCode.ClientID %>").val("");
                $("#<%=lbsApplyCode.ClientID %>").val("");
                $("#<%=lbsApplyCode.ClientID %>").next().val("");
                var $value = $("[applyKY]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }

                var $value = $("[applyNX]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }
                var $value = $("[applyGCKY]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }
                changeValue = 1;
            }
        }
        else if (applyType == "科研项目外委") {
            $("#applyLittleType").hide();
            $("#value").hide();
            $("#projBase").show();
            $("#projExpend").hide();
            $("#purchase").hide();
            $("#purchaseContent").hide();
            $("#dept").hide();
            $("#range").hide();
            $("#isBudget").hide();
            $("#checkMoney").hide();
            $("#purchaser").hide();
            $("#applyReason").show();
            $("#purchaseReason").hide();
            $("#memo").hide();
            $("#isNeedMaterial").hide();
            $("#projRequire").hide();
            $("#materials").show();
            $("#inUnit").show();
            $("#<%=inUnitAdd.ClientID %>").show();
            $("#inUnitList").show();
            //$("#more").hide();
            $("#qualified").hide();
            $("#<%=qualifiedAdd.ClientID %>").hide();
            $("#qualifiedList").hide();
            $("#unit").hide();
            $("#unitAdd").hide();
            $("#unitList").hide();
            $("#notIn").hide();
            $("#notInAdd").hide();
            $("#notInList").hide();
            var $value = $("[ky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[gcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }
            var $value = $("[gc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).show();
            }

            if (type == "change") {
                if (changeValue != 0) {
                    alert("更改采购申请类型时，将会清空之前填写的部分信息！");
                }
                $("#<%=txtApplyCode.ClientID %>").val("");
                $("#<%=lbsApplyCode.ClientID %>").val("");
                $("#<%=lbsApplyCode.ClientID %>").next().val("");
                var $value = $("[applyGC]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }

                var $value = $("[applyNX]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }

                var $value = $("[applyGCNX]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }
                var $value = $("[applyGCKY]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }
                changeValue = 1;
            }
        }
        else if (applyType == "内需采购") {
            $("#applyLittleType").show();
            $("#value").hide();
            $("#projBase").hide();
            $("#projExpend").hide();
            $("#purchase").show();
            $("#purchaseContent").show();
            $("#dept").show();
            $("#range").hide();
            $("#isBudget").show();
            $("#checkMoney").hide();
            $("#purchaser").show();
            $("#applyReason").hide();
            $("#purchaseReason").show();
            $("#memo").show();
            $("#isNeedMaterial").show();
            $("#projRequire").show();
            $("#materials").hide();
            $("#inUnit").show();
            $("#<%=inUnitAdd.ClientID %>").show();
            $("#inUnitList").show();
            //$("#more").show();
            $("#qualified").hide();
            $("#<%=qualifiedAdd.ClientID %>").hide();
            $("#qualifiedList").hide();
            $("#unit").hide();
            $("#unitAdd").hide();
            $("#unitList").hide();
            $("#notIn").hide();
            $("#notInAdd").hide();
            $("#notInList").hide();
            var $value = $("[ky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[gcky]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }
            var $value = $("[gc]");
            var count = $value.length;
            for (var i = 0; i < count; i++) {
                $($value[i]).hide();
            }

            if (type == "change") {
                if (changeValue != 0) {
                    alert("更改采购申请类型时，将会清空之前填写的部分信息！");
                }
                $("#<%=txtApplyCode.ClientID %>").val("");
                $("#<%=lbsApplyCode.ClientID %>").val("");
                $("#<%=lbsApplyCode.ClientID %>").next().val("");
                var $value = $("[applyGC]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }

                var $value = $("[applyKY]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }

                var $value = $("[applyGCKY]");
                var count = $value.length;
                for (var i = 0; i < count; i++) {
                    $($value[i]).val("");
                }
                changeValue = 1;
            }
        }
    }
    //采购申请类型（小类）不同，显示不同内容
    function setLittleTypeControl(applyLittleType) {
        if (applyLittleType == "设备物资") {
            $("#parameter").show();
            $("#detail").hide();
            $("#<%=tbDetailedList.ClientID %>").val("");
        }
        else if (applyLittleType == "小型基建") {
            $("#parameter").hide();
            $("#detail").show();
            $("#<%=tbParameterYq.ClientID %>").val("");
        }
        else {
            $("#parameter").hide();
            $("#detail").hide();
            $("#<%=tbParameterYq.ClientID %>").val("");
            $("#<%=tbDetailedList.ClientID %>").val("");
        }
    }

    //是否为预算项目
    function setBudgetControl(isBudget) {
        $("#tdBudget1").hide();
        $("#tdBudget2").show();
        if (isBudget == "0") {
            $("#budget").show();
            $("#budgetMoney").show();
            $("#reason").hide();
            $('#<%=tbNotBudgetReason.ClientID %>').removeAttr('req');
            $("#<%=tbNotBudgetReason.ClientID %>").val("");
            $("#tdBudget2").hide();
            $("#tdBudget1").show();
        }
        else if (isBudget == "1") {
            $("#budget").hide();
            $("#budgetMoney").hide();
            $("#reason").show();
            $("#tdBudget2").show();
            $("#tdBudget1").hide();
        }
    }

    //上传附件
    function upLoadFile(fileSrcId) {
        showUploadForm(fileSrcId, "Module");
        return true;
    }

    function checkForm() {
        if ($formAction == 0) {
            var reason = $("#<%=tbNotMeetReason.ClientID %>").val();
            var applyType = $("#<%=rblApplyBigType.ClientID %> input[type='radio']:checked").val();

            var reason = $("#<%=tbNotMeetReason.ClientID %>").val();
            if (applyType == "内需采购" || applyType == "科研项目外委") {
                var unit = $('#<%=gvApplyUnit.ClientID %>')[0].rows.length;
                if (unit < 5 && reason == "") {
                    alert("推荐单位不足三家，请补充推荐单位或填写不足三家的理由！");
                    return false;
                }
            }
            else {
                var qualifiedCount = $('#<%=gvQualifiedList.ClientID %>')[0].rows.length;
                var unitCount = $('#<%=gvUnit.ClientID %>')[0].rows.length;
                var notInUnitCount = $('#<%=gvNotInUnit.ClientID %>')[0].rows.length;
                if (applyType == "工程项目外委") {
                    if (qualifiedCount < 3 && unitCount < 3 && notInUnitCount < 3) {
                        alert("请至少推荐一个合格供方库中单位或供方库中单位或推荐三家非库中单位");
                        return false;
                    }
                    if (qualifiedCount < 3 && unitCount < 3 && notInUnitCount < 5 && reason == "") {
                        alert("非库中推荐单位不足三家，请补充非库中推荐单位或填写其不足三家的理由！");
                        return false;
                    }
                }
                //                else if (applyType == "科研项目外委") {
                //                    //推荐单位不足三家时，提示
                //                    if (unit.split(",").length - 1 < 2 && reason == "") {
                //                        alert("推荐单位不足三家，请补充推荐单位或填写其不足三家的理由！");
                //                        return false;
                //                    }
                //                }
                //非内需采购时，必须至少选择一个申请理由
                var isChecked = checkHasCheckReason();
                if (applyType != "内需采购" && !isChecked) {
                    alert("请至少选择一个申请理由!");
                    return false;
                }
            }
        }
        return true;
    }

    //控制卷册和专业的显隐
    function displayOfRollAndSpe() {
        var rangeValue = getPurchaseRange();
        if (rangeValue == "专业委托") {
            $("#trSpecialty").show();
            $("#delegateRollInfo").hide();
        }
        else {
            $("#trSpecialty").hide();
            if (rangeValue == "卷册委托") {
                $("#delegateRollInfo").show();
            }
            else {
                $("#delegateRollInfo").hide();
            }
        }
    }

    //判断是否选择了申请理由
    function checkHasCheckReason() {
        var isChecked = false;
        var $applyReason = $("input[type='checkbox'][id$=Reason]");
        for (var j = 0; j <= $applyReason.length; j++) {
            if ($($applyReason[j]).attr("checked") == "checked") {
                isChecked = true;
                break;
            }
        }
        return isChecked;
    }

    //控制供方单位的显示
    function displayOfSupply() {
        var applyType = getApplyType();
        if (applyType != "工程项目外委") {
            $(".trSupply").hide();
        }
        else {
            $(".trSupply").show();
        }
    }

    //控制不足三家说明的提示
    function displayOfDescription() {
        var applyType = getApplyType();
        if (applyType == "工程项目外委") {
            $("#<%=lbDescription.ClientID %>").html("工程项目外委非库中推荐单位不足三家，需填写不足三家原因说明");
        }
        else {
            $("#<%=lbDescription.ClientID %>").html(applyType + "推荐单位不足三家，需填写不足三家原因说明");
        }
    }

    //获取采购范围信息
    function getPurchaseRange() {
        return $("#<%=rblPurchaseRange.ClientID %> input[type='radio']:checked").val();
    }

    //获取申请大类信息
    function getApplyType() {
        return $("#<%=rblApplyBigType.ClientID %> input[type='radio']:checked").val();
    }
    //获取申请小类
    function getLittleType() {
        return $("#<%=rblApplyLittleType.ClientID %> input[type='radio']:checked").val();
    }

    //选择合格供方筛选条件
    function qualifiedSupplierFilter() {
        var applyType = $("#<%=rblApplyBigType.ClientID %> input[type='radio']:checked").val();
        var isShowAddBtn;
        if (applyType == "工程项目外委") {
            isShowAddBtn = "false";
        }
        else {
            isShowAddBtn = "true";
        }

        return "{SupplierType:'0',IsShowAddBtn:'" + isShowAddBtn + "'}";
    }

    //选择供方筛选条件
    function unitFilter() {
        var applyType = $("#<%=rblApplyBigType.ClientID %> input[type='radio']:checked").val();
        var isShowAddBtn;
        if (applyType == "工程项目外委") {
            isShowAddBtn = "false";
        }
        else {
            isShowAddBtn = "true";
        }

        return "{SupplierType:'1',IsShowAddBtn:'" + isShowAddBtn + "'}";
    }
</script>
