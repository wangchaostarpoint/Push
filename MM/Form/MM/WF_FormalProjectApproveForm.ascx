<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_FormalProjectApproveForm.ascx.cs" Inherits="Zhongsoft.Portal.MM.Form.MM.WF_FormalProjectApproveForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>

<table class="tz-table">
    <tr>
        <td class="td-l">所属工程包<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbProjectPackage" runat="server" MaxText="128" TableName="MM_MarketProjectEntity" Field="ProjectPackage" ActiveStatus="(23.提交正式工程立项申请)" req="1" />
        </td>
        <td class="td-l">财务流水号</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ToolTip="财务流水号自动生成" ID="tbFinancialSerialNum" ReadOnly="True" ActiveStatus="(23.提交正式工程立项申请)" />
            <input type="hidden" runat="server" id="hiFinancialSerialNum" tablename="MM_MarketProjectEntity" field="FinancialSerialNum" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsMarketProjectName" Writeable="true" SelectPageMode="Dialog" PageWidth="850px" PageHeight="600px"
                PageUrl="/MM/Obsolete/MarketProjectSelector.aspx" TableName="MM_MarketProjectEntity" Field="MarketProjectName" ActiveStatus="(23.提交正式工程立项申请)" req="1"
                EnableTheming="false" FilterFunction="selectFilter()" ResultAttr="name" OnClick="lbsMarketProjectName_OnClick" ShowSelectBtn="false"
                ResultForControls="{'tbProjectPackage':'ProjectPackage','tbMarketProjectCode':'MarketProjectCode','tbBuildPlace':'BuildPlace','tbProjectScale':'ProjectScale','tbContractValue':'ContractValue','tbEstimateContractVal':'EstimateContractVal','tbProjectInvestment':'ProjectInvestment','hiProjectType':'ProjectType','ddlParamProjectTypeID':'ParamProjectTypeID','tbVoltageGrade':'VoltageGrade','ddlServiceType':'ServiceType','rblBuildType':'BuildType','hiProjectPhaseNames':'ProjectPhaseNames','hiProjectPhaseIDs':'ProjectPhaseIDs','tbEntrustUnitName':'EntrustUnitName','hiEntrustUnitID':'EntrustUnitID','tbPlanFinishTime':'PlanFinishTime','tbContractSignState':'ContractSignState','txtProductionDate':'ProductionDate','hiMarketProjectID':'id','hiMarketInfoID':'MarketInfoID','ddlProjectState':'ProjectState'}" />
        </td>
        <td flag="isCreateHide" class="td-l">工程编号</td>
        <td flag="isCreateHide" class="td-r">
            <zhongsoft:LightTextBox runat="server" ToolTip="工程编号自动生成" ID="tbMarketProjectCode" ReadOnly="True" ActiveStatus="(23.?)" />
            <input type="hidden" runat="server" id="hiMarketProjectCode" tablename="MM_MarketProjectEntity" field="MarketProjectCode" />
        </td>
    </tr>
    <%--<tr>
                <td class="td-l">委托单位</td>
                <td class="td-m" colspan="5">
                    <zhongsoft:LightTextBox ID="tbEntrustUnitName" runat="server" MaxText="128" TableName="MM_MarketProjectEntity" Field="EntrustUnitName" ActiveStatus="(23.提交正式工程立项申请)" />
                    <input type="hidden" id="hiEntrustUnitID" name="hiEntrustUnitID" runat="server" tablename="MM_MarketProjectEntity" field="EntrustUnitID" />
                </td>
            </tr>--%>
    <tr>
        <td class="td-l">委托单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtEntrustUnitName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiEntrustUnitID':'id'}"
                EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketProjectEntity"
                req="1" field="EntrustUnitName" activestatus="(23.提交正式工程立项申请)" DoCancel="false" Writeable="false" />
            <input type="hidden" id="hiEntrustUnitID" name="hiEntrustUnitID" runat="server" field="EntrustUnitID"
                tablename="MM_MarketProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">建设地点<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbBuildPlace" runat="server" MaxText="128" TableName="MM_MarketProjectEntity" Field="BuildPlace" ActiveStatus="(23.提交正式工程立项申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">业务板块<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblBusinessPlate" field="ParamBusinessPlateID" tablename="MM_MarketProjectEntity"
                RepeatDirection="Horizontal" activestatus="(23.提交正式工程立项申请)" req="1">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">工程类别<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlParamProjectTypeID" tablename="MM_MarketProjectEntity" field="ParamProjectTypeID" ActiveStatus="(23.提交正式工程立项申请)" req="1" />
            <input type="hidden" runat="server" id="hiProjectType" tablename="MM_MarketProjectEntity" field="ProjectType" />
        </td>
        <td class="td-l">服务性质<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlServiceType" TableName="MM_MarketProjectEntity"
                Field="ServiceType" activestatus="(23.提交正式工程立项申请)" req="1" />
        </td>
        <td class="td-l">建设性质<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblBuildType" field="BuildType" tablename="MM_MarketProjectEntity"
                req="1" RepeatDirection="Horizontal" activestatus="(23.提交正式工程立项申请)" RepeatLayout="Flow">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">工程类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectLevel" TableName="MM_MarketProjectEntity"
                Field="ProjectLevel" activestatus="(23.提交正式工程立项申请)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l" flag="JS">任务(委托)形式
        </td>
        <td class="td-r" flag="JS">
            <zhongsoft:LightDropDownList runat="server" ID="ddlDelegateType" field="DelegateType" tablename="MM_MarketProjectEntity" activestatus="(23.提交正式工程立项申请)" />
        </td>
        <td colspan="2" class="td-m"></td>
    </tr>
    <tr>
        <td class="td-l">电压等级（kV）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbVoltageGrade" DataType="Integer" EnableTheming="False" CssClass="kpms-textbox-money" runat="server" TableName="MM_MarketProjectEntity" Field="VoltageGrade" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
        <td class="td-l">装机容量（MW）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbInstalledCapacity" DataType="Integer" EnableTheming="False" CssClass="kpms-textbox-money" TableName="MM_MarketProjectEntity" Field="InstalledCapacity" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
        <td class="td-l">规模数字化<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbScaleDigital" runat="server" DataType="Integer" EnableTheming="False" CssClass="kpms-textbox-money" TableName="MM_MarketProjectEntity" Field="ScaleDigital" ActiveStatus="(23.提交正式工程立项申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工程规模</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectScale" runat="server" MaxText="512" TableName="MM_MarketProjectEntity" Field="ProjectScale" ActiveStatus="(23.提交正式工程立项申请)" EnableTheming="False" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">估算产值（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbEstimateContractVal" EnableTheming="False" DataType="Decimal6" CssClass="kpms-textbox-money" runat="server" TableName="MM_MarketProjectEntity" Field="EstimateContractVal" ActiveStatus="(23.提交正式工程立项申请)" req="1" />
        </td>
        <td class="td-l">合同产值（万元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbContractValue" EnableTheming="False" DataType="Decimal6" CssClass="kpms-textbox-money" runat="server" TableName="MM_MarketProjectEntity" Field="ContractValue" ActiveStatus="(23.提交正式工程立项申请)" ReadOnly="True" />
        </td>
        <td class="td-l">差值（万元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbDiffValue" EnableTheming="False" ReadOnly="True" DataType="Decimal6" CssClass="kpms-textbox-money" ActiveStatus="(?.提交正式工程立项申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计产值（万元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDesignValue" runat="server" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal6" TableName="MM_MarketProjectEntity" Field="DesignValue" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
        <td class="td-l">勘测产值（万元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSurveyValue" runat="server" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal6" TableName="MM_MarketProjectEntity" Field="SurveyValue" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
        <td class="td-l">总投资额（万元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbProjectInvestment" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal6" runat="server" TableName="MM_MarketProjectEntity" Field="ProjectInvestment" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
    </tr>
    <tr flag="formalProject">
        <td class="td-l">设总<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectManagerName" Writeable="False" TableName="MM_MarketProjectEntity"
                Field="ProjectManagerName" ActiveStatus="(23.提交正式工程立项申请)" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" SelectPageMode="Dialog" FilterFunction="userFilter()"
                EnableTheming="False" ResultAttr="name" ResultForControls="{'hiProjectManagerID':'id','hiProjectManagerDept':'OrgUnitName'}" />
            <input type="hidden" id="hiProjectManagerID" name="hiProjectManagerID" runat="server" tablename="MM_MarketProjectEntity" field="ProjectManagerID" />
            <input type="hidden" runat="server" id="hiProjectManagerDept" tablename="MM_MarketProjectEntity" field="ProjectManagerDept" />
        </td>
        <td class="td-l">主专业主设人</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtMajorMainSetName" Writeable="False"
                TableName="MM_MarketProjectEntity" Field="MajorMainSetName" ActiveStatus="(23.提交正式工程立项申请)" FilterFunction="userFilter()"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" SelectPageMode="Dialog" EnableTheming="False"
                ResultAttr="name" ResultForControls="{'hiMajorMainSetID':'id'}" />
            <input type="hidden" id="hiMajorMainSetID" name="hiMajorMainSetID" runat="server" tablename="MM_MarketProjectEntity" field="MajorMainSetID" />
        </td>
        <%--  <td class="td-l">商务经理</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbBusinessManagerName" ActiveStatus="(23.提交正式工程立项申请)" TableName="MM_MarketProjectEntity" Field="BusinessManagerName" />
                    <input type="hidden" id="hiBusinessManagerID" runat="server" tablename="MM_MarketProjectEntity" field="BusinessManagerID" />
                </td>--%>
        <td class="td-l">商务经理<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtBusinessManagerName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.提交正式工程立项申请)" SourceMode="SelectorPage"
                ResultForControls="{ 'hiBusinessManagerID':'id'}" ShowJsonRowColName="true"
                ResultAttr="name" ShowAttrs="name,UserCode" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="BusinessManagerName" FilterFunction="userFilter()"
                DoCancel="false" tablename="MM_MarketProjectEntity"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiBusinessManagerID" runat="server" tablename="MM_MarketProjectEntity" field="BusinessManagerID" />
        </td>
    </tr>
    <tr flag="formalProject">
        <td class="td-l">工程阶段<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.提交正式工程立项申请)"
                RepeatDirection="Horizontal" RepeatColumns="10" />
            <input type="hidden" runat="server" id="hiProjectPhaseIDs" tablename="MM_MarketProjectEntity" field="ProjectPhaseIDs" />
            <input type="hidden" runat="server" id="hiProjectPhaseNames" field="ProjectPhaseNames" tablename="MM_MarketProjectEntity" />
        </td>
    </tr>
    <tr flag="formalProject">
        <td class="td-l">接受日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtReceiveDate" runat="server" readonly="readonly" TableName="MM_MarketProjectEntity" Field="ReceiveDate" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
        <td class="td-l">计划完成日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanFinishTime" runat="server" readonly="readonly" TableName="MM_MarketProjectEntity" Field="PlanFinishTime" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
        <td class="td-l" flag="kPlanFinishTime" style="display: none">可研计划完成时间
        </td>
        <td class="td-r" flag="kPlanFinishTime" style="display: none">
            <zhongsoft:XHtmlInputText ID="txtKPlanFinishTime" runat="server" activestatus="(23.提交正式工程立项申请)" class="kpms-textbox-date" readonly="readonly" TableName="MM_MarketProjectEntity" Field="KPlanFinishTime" />
        </td>
        <td class="td-m" colspan="2" flag="kNoPlanFinishTime"></td>
    </tr>
    <tr flag="formalProject">

        <td class="td-l">启动日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartDate" runat="server" readonly="readonly" TableName="MM_MarketProjectEntity" Field="StartDate" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
        <td class="td-l">工程投产日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProductionDate" readonly="readonly" class="kpms-textbox" style="width: 43%" TableName="MM_MarketProjectEntity" Field="ProductionDate" ActiveStatus="(23.?)" />
        </td>
        <td class="td-l" flag="cPlanFinishTime" style="display: none">初设计划完成时间<span class="req-star">*</span>
        </td>
        <td class="td-r" flag="cPlanFinishTime" style="display: none">
            <zhongsoft:XHtmlInputText ID="txtCPlanFinishTime" runat="server" activestatus="(23.提交正式工程立项申请)" class="kpms-textbox-date" readonly="readonly" TableName="MM_MarketProjectEntity" Field="CPlanFinishTime" />
        </td>
        <td class="td-m" colspan="2" flag="cNoPlanFinishTime"></td>
    </tr>
    <tr flag="formalProject">
        <td class="td-l">工程状态<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectState" TableName="MM_MarketProjectEntity" Field="ProjectState" ActiveStatus="(23.提交正式工程立项申请)" req="1" />
        </td>
        <td class="td-l">合同签约状态<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlContractSignState" TableName="MM_MarketProjectEntity" Field="ContractSignState" ActiveStatus="(2.?)" req="1" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr flag="formalProject">
        <td class="td-l">附件组</td>
        <td class="td-m" colspan="5">
            <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.提交正式工程立项申请)" EnableTheming="False" OnClientClick="return uploadFile('Module','Normal');">
                        <img src="../../Themes/Images/btn_upload.gif">
                        <span>上传附件</span>
            </asp:LinkButton>
            <span class="req-star" style="float: right;"
                runat="server" displaystatus="(2.提交正式工程立项申请)">请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadFile" runat="server" />
        </td>
    </tr>
    <tr flag="formalProject">
        <td class="td-l">开工单</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUploadOrder" EnableTheming="false"
                DisplayStatus="(3.提交正式工程立项申请)" OnClick="lbtnUploadOrder_OnClick"><img src="../../Themes/Images/btn_upload.gif" />
                <span>上传附件</span></zhongsoft:LightFileUploader>
            <span class="req-star" style="float: right;"
                runat="server" displaystatus="(2.提交正式工程立项申请)">请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadOrder" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">跟踪项目附件信息</td>
        <td class="td-m" colspan="5">
            <uc3:UpLoadFile ID="marketInfoFile" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" EnableTheming="False" CssClass="kpms-textarea" Rows="3" runat="server" MaxText="512" TableName="MM_MarketProjectEntity" TextMode="MultiLine" Field="Memo" ActiveStatus="(23.提交正式工程立项申请)" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiMarketProjectID" name="hiMarketProjectID" runat="server" tablename="MM_MarketProjectEntity" field="MarketProjectID" />
<input type="hidden" id="hiMarketInfoID" name="hiMarketInfoID" runat="server" tablename="MM_MarketProjectEntity" field="MarketInfoID" />
<input type="hidden" id="hiCustomerName" runat="server" tablename="MM_MarketProjectEntity" field="CustomerName" />
<input type="hidden" runat="server" id="hiBusinessPlate" tablename="MM_MarketProjectEntity" field="BusinessPlate" />

<%--  <input type="hidden" runat="server" id="hiCreateUserId" tablename="MM_MarketProjectEntity" field="CreateUserId" />
    <input type="hidden" runat="server" id="hiCreateUserName" tablename="MM_MarketProjectEntity" field="CreateUserName" />--%>
<input type="hidden" runat="server" id="hiCreateDate" tablename="MM_MarketProjectEntity" field="CreateDate" />

<%--<input type="hidden" runat="server" id="hiLastModifyUserId" tablename="MM_MarketProjectEntity" field="LastModifyUserId" />
    <input type="hidden" runat="server" id="hiLastModifyUserName" tablename="MM_MarketProjectEntity" field="LastModifyUserName" />
    <input type="hidden" runat="server" id="hiLastModifyDate" tablename="MM_MarketProjectEntity" field="LastModifyDate" />--%>
<input type="hidden" runat="server" id="hiIsFormalProject" tablename="MM_MarketProjectEntity" field="IsFormalProject" />
<asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />
<input type="hidden" runat="server" id="hiPerformanceStatus" tablename="MM_MarketProjectEntity" field="PerformanceStatus" />
<input type="hidden" runat="server" id="hiFlag" tablename="MM_MarketProjectEntity" field="Flag" value="1" />
<input type="hidden" runat="server" id="hiRecordNoNew" tablename="MM_MarketProjectEntity" field="RecordNoNew" />

<input type="hidden" id="hiStartUpOrder" runat="server" tablename="MM_MarketProjectEntity" field="StartUpOrder" />

<script type="text/javascript">

    function initCustomerPlugin() {
        initFormalProjectInfo();
        setCPlanInfo();
        $('#<%=cblProjectPhases.ClientID %>').live('change', function () {
            setCPlanInfo();
        });
    }

    //招标单位联系人筛选条件
    function selectFilter() {
        return { IsFormalProject: "0" }
    }

    function checkProjectName() {
        name = $("#<%=lbsMarketProjectName.ClientID%>").val();
        if (name == "") {
            alert("请先选择项目信息!");
            return false;
        }
        return true;
    }

    //上传附件
    function uploadFile(flag, fileType) {
        var fileSrcId = $("#<%=hiMarketProjectID.ClientID%>").val();
        showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
        return false;
    }
    //新建、编辑申请设备弹出层callback方法
    function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
    }
    //控制初设计划完成时间显隐
    function setCPlanInfo() {
        $('[flag = "cPlanFinishTime"]').hide();
        $('[flag = "cNoPlanFinishTime"]').show();
        $("#<%=txtCPlanFinishTime.ClientID %>").removeAttr("req");

        $('[flag = "kPlanFinishTime"]').hide();
        $('[flag = "kNoPlanFinishTime"]').show();
        $('#<%=cblProjectPhases.ClientID %>').find("input[type='checkbox']:checked").each(function () {
            sText = this.nextSibling.innerText;
            if (sText.match("初设")) {
                $('[flag = "cPlanFinishTime"]').show();
                $('[flag = "cNoPlanFinishTime"]').hide();
                $("#<%=txtCPlanFinishTime.ClientID %>").attr("req", "1");
                return;
            }
            else if (sText == "可研") {
                $('[flag = "kPlanFinishTime"]').show();
                $('[flag = "kNoPlanFinishTime"]').hide();
                return;
            }
        });
    }

    //商务经理
    function userFilter() {
        var organizationID = "<%=KPMSUser.DeptId%>";
        return { organizationID: organizationID };
    }

    //设总等正式工程才可见
    function initFormalProjectInfo() {
        //if (parseBool("<%=IsFormalProject%>")) {
        $('[flag = "formalProject"]').show();
        $("#<%=lbsProjectManagerName.ClientID %>").attr("req", "1");
        $("#<%=txtBusinessManagerName.ClientID %>").attr("req", "1");
        $("#<%=cblProjectPhases.ClientID %>").attr("req", "1");
        $("#<%=txtPlanFinishTime.ClientID %>").attr("req", "1");
        $("#<%=ddlProjectState.ClientID %>").attr("req", "1");
        //}
       <%-- else {
            $('[flag = "formalProject"]').hide();
            $("#<%=lbsProjectManagerName.ClientID %>").removeAttr("req");
            $("#<%=txtBusinessManagerName.ClientID %>").removeAttr("req");
            $("#<%=cblProjectPhases.ClientID %>").removeAttr("req");
            $("#<%=txtPlanFinishTime.ClientID %>").removeAttr("req");
            $("#<%=ddlProjectState.ClientID %>").removeAttr("req");
        }--%>
    }

    function checkForm() {
        if ($formAction == 0) {
            var orderFile = $("table[id^='" + "<%=uploadOrder.ClientID %>" + "']").find("a");
            if (orderFile.length == 0) {
                alert("请上传开工单！");
                return false;
            }
        }
        return true;
    }
</script>
