<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileInfoDetail.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.FileInfoDetail" %>
<%@ Import Namespace="DAL.EPMS" %>
<tr>
    <td class="td-l">项目名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            PageWidth="800px" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','lbsChiefEngineerName':'ManagerUserName','hiChiefEngineerUserID':'ManagerUserId','lbsChiefEngineerName_hivalue':'ManagerUserName'}"
            TableName="EPMS_WBSEntity" Field="ProjectName" activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)"
            req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSEntity"
            field="OrganizationID" />
    </td>
    <td class="td-l">项目编号<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectCode"
            req="1" />
    </td>
</tr>
<tr>
    <td class="td-l">项目阶段
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)"
            readonly="readonly" class="kpms-textbox" />
    </td>
    <td class="td-l">
        <span flag="spe">专业</span> <span class="req-star">*</span>
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="txtSpe" readonly="readonly" TableName="EPMS_WBSEntity"
            Field="ExecSpecialtyName" activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)"
            class="kpms-textbox-short" />
        <asp:ImageButton runat="server" ID="ibtnSelectSpe" ImageUrl="~/Themes/Images/look-up.gif"
            OnClientClick="return selectSpe()" EnableTheming="false" class="btn-look-up"
            displaystatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)" />
        <input type="hidden" runat="server" id="hiExecSpecialtyCode" tablename="EPMS_WBSEntity"
            field="ExecSpecialtyCode" />
        <input type="hidden" runat="server" id="hiExecSpecialtyID" tablename="EPMS_WBSEntity"
            field="ExecSpecialtyID" />
        <input type="hidden" runat="server" id="hiBelongSpecialtyID" tablename="EPMS_WBSEntity"
            field="BelongSpecialtyID" />
        <input type="hidden" runat="server" id="hiBelongSpecialtyCode" tablename="EPMS_WBSEntity"
            field="BelongSpecialtyCode" />
        <input type="hidden" runat="server" id="hiBelongSpecialtyName" tablename="EPMS_WBSEntity"
            field="BelongSpecialtyName" />
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" req="1" activestatus="(2.*)"
            OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-l">
        <asp:Label runat="server" ID="lblExternalSupplyDate" showitem="extendFile">外部提供时间</asp:Label><span class="req-star" showitem="extendFile">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtExternalSupplyDate" activestatus="(23.登记)"
            showitem="extendFile" readonly="readonly" class="kpms-textbox-date" tablename="EPMS_FileItemEntity"
            field="ExternalSupplyDate" req="1" />
    </td>
</tr>
<tr showitem="extendFile">
    <td class="td-l">
        <asp:Label runat="server" ID="lbProvideUnit" showitem="extendFile">提资单位</asp:Label><span
            class="req-star" showitem="extendFile">*</span>
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept" TableName="EPMS_FileItemEntity"
            Style="display: none" Field="ProvideFileUnitID" displayStatus="(23.编写资料交接单)(23.填写专业间互提资料单)(3.校核人校核)"
            activestatus="(2.编写资料交接单)(2.填写专业间互提资料单)">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiProvideFileUnit" tablename="EPMS_FileItemEntity"
            activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)" field="ProvideFileUnit" />
        <zhongsoft:LightTextBox runat="server" ID="tbProvideFileUnit" TableName="EPMS_FileItemEntity"
            Field="ProvideFileUnit" showitem="extendFile" activestatus="(23.登记)(23.资料登记)"
            req="1"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr flag="verify">
    <td class="td-l">任务名称<%--<span class="req-star">*</span>--%>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
            ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','hiExecSpecialtyID':'ExecSpecialtyID','hiExecSpecialtyCode':'ExecSpecialtyCode','txtSpe':'ExecSpecialtyName','ddlSpecialty':'ExecSpecialtyID'}"
            activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)" BeforeSelect="beforeSelectWbs()"
            FilterFunction="wbsFilter()" AfterSelect="afterSelectWbs()"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_WBSEntity" field="ParentID" />
    </td>
    <td class="td-l">任务编号<%--<span class="req-star">*</span>--%>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)"
            readonly="readonly" class="kpms-textbox" />
    </td>
</tr>
<tr>
    <td class="td-l">资料名称<span class="req-star">*</span>
        <br />
        <asp:CheckBox runat="server" ID="cbPlan" Text="计划内" Checked="true" AutoPostBack="true"
            OnCheckedChanged="cbPlan_CheckedChanged" TableName="EPMS_WBSEntity" Field="IsPlan"
            activestatus="(2.编写资料交接单)(2.填写专业间互提资料单)(2.登记)" />
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="txtFileName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/FileItemSelector.aspx"
            ResultForControls="{'hiFileID':'id','hiFileItemID':'id','txtFileCode':'WBSCode','hiWBSTemplateID':'WBSTemplateID','hiExtendedAttribute':'ExtendedAttribute','hiExecSpecialtyID':'ExecSpecialtyID','hiExecSpecialtyCode':'ExecSpecialtyCode','txtSpe':'ExecSpecialtyName','hiSerialCode':'SerialCode'}"
            TableName="EPMS_WBSEntity" Field="WBSName" activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)"
            BeforeSelect="beforeSelectFile()" FilterFunction="fileFilter()" req="1" OnClick="txtFileName_Click"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiWBSTemplateID" />
        <input type="hidden" runat="server" id="hiExtendedAttribute" />
        <!-- 选择资料后，带出模板或者历史资料相关信息，初始化到资料表中-->
    </td>
    <td class="td-l">资料编号<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFileCode" activestatus="(2.编写资料交接单)(23.填写专业间互提资料单)(2.登记)(23.资料登记)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="WBSCode"
            req="1" />
        <input type="hidden" runat="server" id="hiSerialCode" tablename="EPMS_WBSEntity"
            field="SerialCode" />
    </td>
</tr>
<tr flag="upgrade" style="display: none;">
    <td class="td-l">继承方式<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="5">
        <asp:RadioButtonList runat="server" ID="rblInhreit" RepeatDirection="Horizontal"
            activestatus="(2.*)">
        </asp:RadioButtonList>
    </td>
</tr>
<tr>
    <td class="td-l" hideitem="extendFile">
        <asp:Label runat="server" ID="lbFileTypeName">资料类别</asp:Label><span class="req-star">*</span>
    </td>
    <td class="td-r" hideitem="extendFile">
        <zhongsoft:LightDropDownList runat="server" ID="ddlFileImportance" TableName="EPMS_FileItemEntity"
            Field="FileImportance" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)(23.审核)">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-l" hideitem="extendFile">是否涉密
    </td>
    <td class="td-r" hideitem="extendFile">
        <asp:RadioButtonList ID="rdblIsSecret" runat="server" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)" RepeatColumns="2" TableName="EPMS_FileItemEntity" Field="IsSecret">
        </asp:RadioButtonList>
    </td>
    <td class="td-l" hideitem="extendFile">秘密等级
    </td>
    <td class="td-r" hideitem="extendFile">
        <asp:RadioButtonList ID="rdblSecretLevel" runat="server" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)" RepeatColumns="3" TableName="EPMS_FileItemEntity" Field="SecretLevel">
        </asp:RadioButtonList>
    </td>
    <td class="td-l" style="display: none">工期
    </td>
    <td class="td-r" id="tdWorkItem" style="display: none">
        <zhongsoft:LightTextBox runat="server" ID="tbWorkTerm" TableName="EPMS_WBSEntity"
            Field="WorkTerm" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)"
            Style="text-align: right;" regex="^([1-9]\d{0,13}|[0])(\.\d{1,2})?$" errmsg="工期请输入最多包含两位小数的数字"></zhongsoft:LightTextBox>
    </td>
    <td class="td-l" showitem="extendFile">
        <asp:Label runat="server" ID="lbAcceptTime">验证日期</asp:Label>
    </td>
    <td class="td-m" colspan="5" showitem="extendFile">
        <zhongsoft:XHtmlInputText runat="server" ID="txtAcceptTime" activestatus="(23.登记)"
            readonly="readonly" class="kpms-textbox-date" tablename="EPMS_FileItemEntity"
            field="FileConfirmDate" />
    </td>
    <td class="td-l" style="display: none;">延迟（开工起）
    </td>
    <td class="td-r" style="display: none;">
        <zhongsoft:LightTextBox runat="server" ID="tbDelay" TableName="WBSEntity" Field="DelayDays"
            activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)" Style="text-align: right;"
            regex="^\d{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr id="trExtendFile">
    <td class="td-l">资料来源<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlFileType" TableName="EPMS_FileItemEntity"
            reqExtend="true" Field="ParamFileTypeID" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)"
            OnSelectedIndexChanged="ddlFileType_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiFileType" tablename="EPMS_FileItemEntity"
            field="FileType" />
        <input type="hidden" runat="server" id="hiFileTypeName" value="设备资料" />
    </td>
    <td class="td-l">资料形式<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlFileForm" TableName="EPMS_FileItemEntity"
            reqExtend="true" Field="FileForm" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-l">资料状态
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlFileNature" TableName="EPMS_FileItemEntity"
            Field="FileNature" activestatus="(23.资料有效性验证)(23.审批)(3.验证)(3.设总审批)(3.专工验证)(3.总工审批)(23.编写资料交接单)">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-l" style="display: none">资料来源<span class="req-star">*</span>
    </td>
    <td class="td-r" style="display: none">
        <%--<zhongsoft:LightDropDownList runat="server" ID="ddlFileSource" TableName="EPMS_FileItemEntity"
            Field="FileSource" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)"
            req="1">
        </zhongsoft:LightDropDownList>--%>
        <zhongsoft:LightTextBox runat="server" ID="tbFileSource" TableName="EPMS_FileItemEntity"
            Field="FileSource" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr id="trEquipment" style="display: none">
    <td class="td-l">设备名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="lboEquipmentName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/EquipmentOfTechAgreeSelector.aspx"
            ResultForControls="{'hiEquipmentID':'id','txtEquipmentCode':'EquipmentCode'}"
            TableName="EPMS_FileItemEntity" Field="EquipmentCode" activestatus="(23.登记)(23.资料登记)"
            BeforeSelect="beforeSelectEquipment()" FilterFunction="equipmentFilter()"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiEquipmentID" tablename="EPMS_FileItemEntity"
            field="TechEquipmentDetailID" />
    </td>
    <td class="td-l">设备编号<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtEquipmentCode" activestatus="(23.登记)(23.资料登记)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_FileItemEntity" Field="EquipmentName" />
    </td>
</tr>
<tr>
    <td class="td-l">资料主要内容<span class="req-star" id="reqFileCon">*</span>
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbContent" TableName="EPMS_FileItemEntity"
            Field="FileContent" activestatus="(23.编写资料交接单)(23.校核修改)(23.填写专业间互提资料单)(23.登记)(23.资料登记)(23.审批修改)(23.批准修改)"
            TextMode="MultiLine" EnableTheming="false" CssClass="kpms-textarea" maxtext="1024"
            req="1"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr runat="server" id="trUpgrade">
    <td class="td-l">升版原因说明
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbUpgradeReason" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)"
            TextMode="MultiLine" EnableTheming="false" CssClass="kpms-textarea" maxtext="1024"></zhongsoft:LightTextBox>
    </td>
</tr>
<!-- 资料相关校审人员-->
<tr flag="verify">
    <td class="td-l" hideitem="extendFile" flag="verify">计划提交日期
    </td>
    <td class="td-r" hideitem="extendFile" flag="verify">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanCompleteTime" activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)(23.登记)(23.资料登记)(23.校核修改)(23.审批修改)(23.批准修改)(23.返回修改或结束)"
            readonly="readonly" class="kpms-textbox-date" tablename="EPMS_WBSEntity" field="PlanCompleteTime" />
    </td>
    <td class="td-l" flag="verify">实际提交日期
    </td>
    <td class="td-r" flag="verify">
        <zhongsoft:XHtmlInputText runat="server" ID="txtFactCompleteTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date" tablename="EPMS_WBSEntity" field="FactCompleteTime" />
    </td>
    <td class="td-l" flag="verify">提交人<span class="req-star">*</span>
    </td>
    <td class="td-r" flag="verify">
        <zhongsoft:LightObjectSelector runat="server" ID="txtPutUser" IsMutiple="false" SelectPageMode="Dialog"
            activestatus="(23.编写资料交接单)(23.填写专业间互提资料单)" SourceMode="SelectorPage" ShowJsonRowColName="true"
            DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiPutUserId':'id'}"
            PageWidth="850" ShowSelectBtn="false" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiPutUserId" />
    </td>
    <td class="td-m" colspan="2" flag="hidden"></td>
</tr>
<tr>
    <td class="td-l" flag="verify">校核人<span class="req-star">*</span>
    </td>
    <td class="td-r" flag="verify">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsCheckUser" IsMutiple="false"
            SelectPageMode="Dialog" activestatus="(23.校核人校核)(23.指派校审人员)(23.填写专业间互提资料单)(23.编写资料交接单)"
            SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            PageWidth="850" ShowAttrs="name,UserCode" ResultForControls="{'hiCheckUserID':'id'}" ShowSelectBtn="True"
            PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" FilterFunction="selCheckerFilter()"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiCheckUserID" />
        <input type="hidden" runat="server" id="hiCheckRoleID" />
    </td>
    <td class="td-l" flag="verify">审查人<span class="req-star">*</span>
    </td>
    <td class="td-r" flag="verify">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsMainDesignerName" IsMutiple="false"
            SelectPageMode="Dialog" activestatus="(23.校核)(23.指派校审人员)(23.填写专业间互提资料单)(23.主设人验证)(23.编写资料交接单)" SourceMode="SelectorPage"
            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
            PageWidth="850" FilterFunction="checkMainDesignerFilter()" ResultForControls="{'hiMainDesignerUserID':'id'}"
            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiMainDesignerUserID" />
        <input type="hidden" runat="server" id="hiMainDesignerRoleID" />
    </td>
    <td class="td-l" flag="verify">核定人<span class="req-star" id="spHd">*</span>
    </td>
    <td class="td-r" flag="verify">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsPEName" IsMutiple="false"
            SelectPageMode="Dialog" activestatus="(23.审核)(23.指派校审人员)(23.填写专业间互提资料单)(23.专工验证)(23.编写资料交接单)" SourceMode="SelectorPage"
            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
            PageWidth="850" FilterFunction="checkPEFilter()" ResultForControls="{'hiPEUserID':'id'}"
            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiPEUserID" />
        <input type="hidden" runat="server" id="hiPERoleID" />
    </td>
</tr>
<tr>
    <td class="td-l" flag="verify">设总<span class="req-star">*</span>
    </td>
    <td class="td-r" flag="verify">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsChiefEngineerName" IsMutiple="False" SelectPageMode="Dialog"
            activestatus="(23.审核)(23.审定)(23.指派校审人员)(23.填写专业间互提资料单)(23.编写资料交接单)" SourceMode="SelectorPage"
            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
            PageWidth="850" FilterFunction="checkChiefEngineerFilter()" ResultForControls="{'hiChiefEngineerUserID':'id'}"
            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" req="1" />
        <input type="hidden" runat="server" id="hiChiefEngineerUserID" />
        <input type="hidden" runat="server" id="hiChiefEngineerRoleID" />
    </td>
    <td class="td-l" flag="hidden">收资人<span class="req-star">*</span>
    </td>
    <td class="td-r" flag="hidden">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsReceiveUser" IsMutiple="False" SelectPageMode="Dialog"
            activestatus="(23.专工审核)(23.指派校审人员)(23.填写专业间互提资料单)" SourceMode="SelectorPage"
            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
            PageWidth="850" ResultForControls="{'hiReceiveRoleID':'id'}"
            ShowSelectBtn="False" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" req="1" />
        <input type="hidden" runat="server" id="hiReceiveUserID" />
        <input type="hidden" runat="server" id="hiReceiveRoleID" />
    </td>
    <td class="td-l" flag="hidden">总工<span class="req-star">*</span>
    </td>
    <td class="td-r" flag="hidden">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsDirectorGeneral" IsMutiple="False" SelectPageMode="Dialog"
            activestatus="(23.指派校审人员)(23.填写专业间互提资料单)(23.总工审批)" SourceMode="SelectorPage"
            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
            PageWidth="850" FilterFunction="directorGeneralFilter()" ResultForControls="{'hiDirectorGeneralUserID':'id'}"
            ShowSelectBtn="False" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" req="1" />
        <input type="hidden" runat="server" id="hiDirectorGeneralUserID" />
        <input type="hidden" runat="server" id="hiDirectorGeneralRoleID" />
    </td>
    <td class="td-m" colspan="2" flag="hidden"></td>
    <td class="td-m" colspan="4" flag="verify"></td>
</tr>
<!-- 主键-->
<input type="hidden" runat="server" id="hiFileID" tablename="EPMS_WBSEntity" field="WBSID" />
<input type="hidden" runat="server" id="hiFileItemID" tablename="EPMS_FileItemEntity"
    field="FileItemID" />
<!-- 版本号、版本类型-->
<input type="hidden" runat="server" id="hiVersionNumber" tablename="EPMS_WBSEntity"
    field="VersionNumber" />
<input type="hidden" runat="server" id="hiVersionType" tablename="EPMS_WBSEntity"
    field="VersionType" />
<!--原版资料ID-->
<input type="hidden" runat="server" id="hiOriginalID" />
<input type="hidden" runat="server" id="hiIsUpgrade" />
<!-- 状态字段-->
<input type="hidden" runat="server" id="hiWBSState" tablename="EPMS_WBSEntity" field="WBSState"
    value="0" />
<!-- 相关任务字段-->
<input type="hidden" runat="server" id="hiParamWBSTypeID" tablename="EPMS_WBSEntity"
    field="ParamWBSTypeID" />
<input type="hidden" runat="server" id="hiIsLock" tablename="EPMS_WBSEntity" field="IsLock" value="1" />
<input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_WBSEntity" field="WBSType" />
<input type="hidden" runat="server" id="hiBelongDeptID" tablename="EPMS_WBSEntity"
    field="BelongDeptID" />
<input type="hidden" runat="server" id="hiBelongDeptName" tablename="EPMS_WBSEntity"
    field="BelongDeptName" />
<input type="hidden" runat="server" id="hiCurVerifyActName" tablename="EPMS_FileItemEntity"
    field="CurVerifyActName" />
<asp:Button runat="server" ID="btnSelectSpe" OnClick="ibtnSelectSpe_Click" Style="display: none;" />
<script type="text/javascript">

    function initFileInfo() {

        //互提资料、外部资料部分信息显示不一样
        var fileType = '<%=FlowType %>';
        //$("#<%=txtPlanCompleteTime.ClientID %>").attr("req", "1");
        $('[showitem =extendFile]').hide();

        if (fileType == 0) {
            $('[flag="verify"]').show();
            $('[flag="hidden"]').hide();
            $('[flag="spe"]').val('提资专业');

          <%--  if ($actName == "编写资料交接单") {
                $("#<%=txtWBSName.ClientID %>").attr("req", "1");
            }--%>
            $("#<%=lbFileTypeName.ClientID %>").text("资料类别");
            //互提资料不显示 资料类别”、“资料状态”、“资料形式”、“资料来源”
            $("#trExtendFile").hide();
            $("[reqExtend =true]").removeAttr("req");
            $("#<%=ddlFileImportance.ClientID%>").attr("req", "1");

            $("#<%=ddlFileImportance.ClientID%>").bind("change", function () {
                setFileImportanceLoad();
            });
            setFileImportanceLoad();
        }
        //外部资料
        else if (fileType == 1) {
            $('[flag="verify"]').hide();
            $('[flag="hidden"]').hide();
            $('[flag="spe"]').val('专业');
            //隐藏计划提交日期
            //$("#<%=txtPlanCompleteTime.ClientID %>").removeAttr("req");
            $("[hideitem=extendFile]").hide();
            $("#<%=lbFileTypeName.ClientID %>").text("资料性质");
            $("#trExtendFile").show();
            $("[reqExtend =true]").attr("req", "1");
            $('[showitem =extendFile]').show();

            //某些步骤必填
            if ($actName == "验证" || $actName == "设总审批" || $actName == "总工审批" || $actName == "设总确认" || $actName == "专工验证"
                || $actName == "总工审批") {
                $("#<%=ddlFileNature.ClientID %>").attr("req", "1");
            }
            //外部资料，当资料类型是“设备资料”时，设备信息必填

            checkEquipment();
            $("#<%=ddlFileType.ClientID %>").live("change", function () { checkEquipment(); })
        }

        if ($('#<%=hiIsUpgrade.ClientID %>').val() == '1') {
            //$('[flag="upgrade"]').show();
            //$('#<%=rblInhreit.ClientID %>').attr('req', '1');
        }
        else {
            //$('#<%=rblInhreit.ClientID %>').removeAttr('req');
        }
        //如果不是计划内，则“资料主要内容”字段必填
        initConReq();
        $('#<%=cbPlan.ClientID %>').click(function () {
            initConReq();
        })

        //资料主要内容是否可以编辑
//        if ($actName == "返回修改或结束") {
//            if (!parseBool('<%=Enable %>')) {
//                $('#<%=tbContent.ClientID %>').attr("readonly", "readonly");
        //            }
        //        }

    }

    function initConReq() {
        if ($('#<%=cbPlan.ClientID %>').attr("checked") == "checked") {
            //$("#reqFileCon").hide();
            //$('#<%=tbContent.ClientID %>').removeAttr('req');
        }
        else {
            //$("#reqFileCon").show();
            //$('#<%=tbContent.ClientID %>').attr('req', '1');
        }
    }

    //选择执行专业
    function selectSpe() {
        var xml = $("#<%//=hiExeSpeXML.ClientID %>").val();
        var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
        var json = { ActionFlag: 1, SelectFlag: 0, OrganizationID: orgId };
        var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", json);
        showDivDialog(url, xml, 850, 550, setSpeVal);
        return false;
    }

    //根据选择专业后返回值，设置控件值
    function setSpeVal(re) {
        var arr = re.split('|');
        $("#<%//=hiExeSpeXML.ClientID %>").val(arr[0]);
        $("#<%=hiExecSpecialtyID.ClientID %>").val(arr[1]);
        $("#<%=hiExecSpecialtyCode.ClientID %>").val(arr[2]);
        $("#<%=txtSpe.ClientID %>").val(arr[3]);
        var fileType = '<%=FlowType %>';
        if (fileType == 0) {
            //互提资料资料来源默认提资专业
            $('#<%=tbFileSource.ClientID %>').val(arr[3]);
            $('#<%=btnSelectSpe.ClientID %>').click();
        }
    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择卷册！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var extSpeId = $("#<%=hiExecSpecialtyID.ClientID %>").val();
        return { OrganizationID: orgId, WBSType: '<%=(int)WBSMode.任务管理 %>', ExeSpecialtyID: extSpeId };
    }

    //选择卷册之后的操作
    function afterSelectWbs() {
        //清空资料信息
        $('#<%=hiFileID.ClientID %>').val("");
        $('#<%=hiFileItemID.ClientID %>').val("");
        $('#<%=txtFileCode.ClientID %>').val("");
        $('#<%=txtFileName.ClientID %>').val("");
        $('#<%=hiWBSTemplateID.ClientID %>').val("");
        $('#<%=hiExtendedAttribute.ClientID %>').val("");
        $('#<%=hiSerialCode.ClientID %>').val("");

        //不清空，可能选择资料后，再选择关联卷册
    }

    //选择资料之前的逻辑判断
    function beforeSelectFile() {
        //去掉判断，卷册不是必选
       <%-- var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (wbsId == '' || wbsId == undefined) {
            alert('请先选择卷册，再选择资料！');
            return false;
        }--%>
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var extSpeId = $("#<%=hiExecSpecialtyID.ClientID %>").val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择资料！');
            return false;
        }
        if (extSpeId == '' || extSpeId == undefined) {
            alert('请先选择专业，再选择资料！');
            return false;
        }
        return true;
    }

    function beforeSelectEquipment() {
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (wbsId == '' || wbsId == undefined) {
            alert('请先选择卷册，再选择设备信息！');
            return false;
        }
        return true;
    }

    ///设备的筛选条件
    function equipmentFilter() {
        var wbsCode = $('#<%=txtWBSCode.ClientID %>').val();
        return { RollCode: wbsCode };
    }

    //选择资料的筛选条件
    function fileFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        var extSpeId = $("#<%=hiExecSpecialtyID.ClientID %>").val();
        return { OrganizationID: orgId, ParentID: wbsId, TypeID: '<%=WBSType %>', ExeSpecialtyID: extSpeId };
    }
    //判断设备资料是否显示
    //系统上线初期，由于设备资料不完善，暂时将约束去掉   modify by weihc on 2016-09-18
    function checkEquipment() {
        var fileTypeName = $("#<%=ddlFileType.ClientID %> option:selected").text();
        var fileType = $("#<%=hiFileType.ClientID %>").val();
        <%--if ((fileTypeName == "" && fileType == "设备资料") || fileTypeName == "设备资料") {
            $("#trEquipment").show();
            //$("#<%=lboEquipmentName.ClientID %>").attr("req", "1");
            //$("#<%=txtEquipmentCode.ClientID %>").attr("req", "1");
        }
        else {
            $("#trEquipment").hide();
            //$("#<%=lboEquipmentName.ClientID %>").removeAttr("req");
            //$("#<%=txtEquipmentCode.ClientID %>").removeAttr("req");
        }--%>
    }

    //选择计划内，先判断是否已选择卷册
    function checkRoll() {
        //        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        //        if (wbsId == '') {
        //            alert('请先选择卷/册！');
        //            return false;
        //        }
        return true;
    }

    //选择卷册负责人筛选条件
    function checkFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        var roleID = $('#<%=hiCheckRoleID.ClientID %>').val();
        return "{OrganizationID:'" + orgId + "',RoleID:'" + roleID + "',DeptID:'" + deptID + "',IsQualiticByRole:'1',IsShowMore:'1'}";
    }
    //选择主设人
    function checkMainDesignerFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        var roleID = $('#<%=hiMainDesignerRoleID.ClientID %>').val();//+ "',RoleID:'" + roleID 
        return "{OrganizationID:'" + orgId + "',DeptID:'" + deptID + "',IsQualiticByRole:'1',IsShowMore:'1'}";
    }
    //选择专工
    function checkPEFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        var roleID = $('#<%=hiPERoleID.ClientID %>').val();//+ "',RoleID:'" + roleID 
        return "{OrganizationID:'" + orgId + "',DeptID:'" + deptID + "',IsQualiticByRole:'1',IsShowMore:'1'}";
    }
    //设总筛选
    function checkChiefEngineerFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        var roleID = $('#<%=hiChiefEngineerRoleID.ClientID %>').val();//"',RoleID:'" + roleID +
        return "{OrganizationID:'" + orgId + "',DeptID:'" + deptID + "',IsQualiticByRole:'1',IsShowMore:'1'}";
    }

    //总工筛选
    function directorGeneralFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        var roleID = $('#<%=hiDirectorGeneralRoleID.ClientID %>').val();
        return "{OrganizationID:'" + orgId + "',RoleID:'" + roleID + "',DeptID:'" + deptID + "',IsQualiticByRole:'1',IsShowMore:'1'}";
    }

    //校核人筛选
    function selCheckerFilter() {
        return { 'OrganizationId': '<%=KPMSUser.OrganizationId %>' };
    }

    function setFileImportanceLoad() {
        if ($("#<%=ddlFileImportance.ClientID%> option:selected").text() == "重要") {
            $("#spHd").show();
            $("#<%=lbsPEName.ClientID%>").attr("req", "1");
        } else {
            $("#spHd").hide();
            $("#<%=lbsPEName.ClientID%>").removeAttr("req");
        }
    }

</script>
