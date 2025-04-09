<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_CrossBranchProfessionalAuditEntrustmentForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_CrossBranchProfessionalAuditEntrustmentForm" %>

<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" style="width: 50%;">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiParamPhaseID':'ParamPhaseID','hiPhaseCode':'PhaseCode','txtPhaseName':'PhaseName','txtManagerUserName':'ManagerUserName','hiManagerUserID':'ManagerUserID'}"
                TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="ProjectName" activestatus="(23.填写申请)"
                req="1" OnClick="lbsProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm"
                field="OrganizationID" />
        </td>

        <td class="td-l">项目阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="PhaseName"
                req="1" />
            <input type="hidden" runat="server" id="hiPhaseCode" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm" field="PhaseCode" />
            <input type="hidden" runat="server" id="hiParamPhaseID" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm" field="ParamPhaseID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目编号<span class="req-star"></span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="ProjectCode"
                req="1" />
        </td>
        <td class="td-l">项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="ManagerUserName"
                req="1" />
            <input type="hidden" runat="server" id="hiManagerUserID" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm" field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人<span class="req-star"></span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="ApplyUserName" />
            <input type="hidden" runat="server" id="hiApplyUserID" name="hiConsignUserID"
                tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm" field="ApplyUserID" />
        </td>
        <td class="td-l">申请日期<span class="req-star"></span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyTime" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox-date" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="ApplyTime" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table>
                <tr>
                    <td colspan="7">申请内容：</td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;为了强化专业技术管理，提升设计产品质量水平，依据我院QES管理体系要求，特委托</td>
                    <td style="width: 100px; text-align: center;">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsAuditUserName" IsMutiple="false"
                              PageWidth="900" 
                            req="1" activestatus="(23.填写申请)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiAuditUserID':'id','txtAuditUserName':'name'}" SelectPageMode="Dialog"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" OnClick="lbsAuditUserName_Click"></zhongsoft:LightObjectSelector>
                    </td>
                    <td>同志承担</td>
                    <td style="width: 100px; text-align: center;">
                        <asp:Label ID="lblProjectName" runat="server" Text="Label" req="1"></asp:Label>
                    </td>
                    <td>项目</td>
                    <td style="width: 70px; text-align: center;">
                        <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" activestatus="(23.填写申请)" OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged" AutoPostBack="true" req="1"
                             >
                        </zhongsoft:LightDropDownList>
                         <input type="hidden" runat="server" id="hiApplySpecialtyID" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm"
                            field="ApplySpecialtyID" />
                        <input type="hidden" runat="server" id="hiApplySpecialtyCode" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm"
                            field="ApplySpecialtyCode" />
                        <input type="hidden" runat="server" id="hiApplySpecialtyName" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm"
                            field="ApplySpecialtyName" /></td>
                    <td>专业审核工作，请批准。</td>

                </tr>

            </table>
            <table class="tz-table" width="100%">
                <tr>
                    <td colspan="6">审核人基本信息</td>
                </tr>
                <tr>
                    <td class="td-l">姓名<span class="req-star"></span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtAuditUserName" activestatus="(23.填写申请)"
                            readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="AuditUserName" />
                        <input type="hidden" runat="server" id="hiAuditUserID" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm" field="AuditUserID" />
                    </td>
                    <td class="td-l">身份证号<span class="req-star"></span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtAuditUserIdentityCardNO" activestatus="(23.填写申请)"
                            readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="AuditUserIdentityCardNO" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">职称<span class="req-star"></span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtAuditUserSkillTitle" activestatus="(23.填写申请)"
                            readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="AuditUserSkillTitle" />
                    </td>
                    <td class="td-l">职称证编号<span class="req-star"></span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtAuditUserSkillCode" activestatus="(23.填写申请)"
                            readonly="readonly" class="kpms-textbox" TableName="EPMS_CrossBranchProfessionalAuditEntrustmentForm" Field="AuditUserSkillCode" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <p>注：1.被委托人应具有我院分院副总工程师以上技术职务。</p>
            <p style="text-indent:24px">2.项目完成或阶段工作完成，授权自行解除。</p>
        </td>
    </tr>
</table>
<!--主键-->
<input type="hidden" id="hiCrossBranchProfessionalAuditEntrustmentFormID" runat="server" tablename="EPMS_CrossBranchProfessionalAuditEntrustmentForm" field="CrossBranchProfessionalAuditEntrustmentFormID" />

<%--JS部分--%>
<script type="text/javascript">

    //页面加载执行
    function initCustomerPlugin() {

    }

    //保存、发送调用（进行相关逻辑验证）
    function checkForm() {

        return true;
    }

    //打印前控制，必须流程结束才可以打印
    function beforePrint() {
        var processStatus = '0';
        <%
    if (ProcessManager != null)
    {

    %>
        processStatus = '<%=ProcessManager.WorkflowProcessStatus.GetHashCode()%>';
         <%
    }
    %>
        if (processStatus != '7') {
            alert('专业工作授权书必须在流程结束后才可以打印。');
            return false;
        }

        return true;
    }
</script>
