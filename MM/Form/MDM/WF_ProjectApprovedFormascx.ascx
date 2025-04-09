<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectApprovedFormascx.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MDM.WF_ProjectApprovedFormascx" %>
<%@ Register TagPrefix="uc1" TagName="MarketProjectInfo" Src="../../UI/Controls/MarketProjectInfo.ascx" %>
<table class="tz-table">
    <tr id="trChange">
        <td class="td-l">
            调整类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cbChangeType" activestatus="(23.填写工程信息)(23.修改工程信息)"
                RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiChangeType" field="CHANGETYPE" tablename="MDM_PROJECTINFOFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            委托书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProXYNumber" field="PROXYNUMBER"
                class="kpms-textbox" readonly="readonly" tablename="MDM_PROJECTINFOFORM" activestatus="(23.填写工程信息)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            接收委托书日期
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProXYDate" field="FROXYDATE" class="kpms-textbox-date"
                readonly="readonly" activestatus="(23.填写工程信息)(3.修改工程信息)" tablename="MDM_PROJECTINFOFORM">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            签订状态
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rbSignState" field="SIGNSTATUS" tablename="MDM_PROJECTINFOFORM"
                activestatus="(23.填写工程信息)(3.修改工程信息)" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            拟稿人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtFillUserName" readonly="readonly"
                class="kpms-textbox" activestatus="(23.填写工程信息)(3.修改工程信息)" field="FILLUSERNAME"
                tablename="MDM_PROJECTINFOFORM">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiFillUserId" field="FILLUSERID" tablename="MDM_PROJECTINFOFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <table class="choose-table" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <zhongsoft:XHtmlInputText runat="server" ID="txtTaskName" field="TASKNAME" tablename="MDM_PROJECTINFOFORM"
                            class="kpms-textbox" req="1" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)" MaxLength="64"
                            style="width: 100%">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td valign="middle" style="width: 20px">
                        <asp:LinkButton runat="server" ID="lbtnSelTask" DisplayStatus="(2.填写工程信息)" CssClass="btn-look-up"
                            EnableTheming="false" OnClientClick="return selProjectTask();" OnClick="lbtnSelTask_Click">
                          <img title="选择任务" src="../../Themes/Images/look-up.gif">
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            是否境内工程<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="ISCHURCHYARD" tablename="MDM_PROJECTINFOFORM"
                RepeatDirection="Horizontal" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)" AutoPostBack="true"
                OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            经营经理<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtManagerName" field="MANAGERNAME"
                tablename="MDM_PROJECTINFOFORM" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" activestatus="(3.配置经营经理)" Width="100px" ResultAttr="name" EnableTheming="false"
                Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiManagerID':'id','hiManagerName':'name'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input id="hiManagerID" runat="server" type="hidden" tablename="MDM_PROJECTINFOFORM"
                field="MANAGERID" />
            <input id="hiManagerName" runat="server" type="hidden" tablename="MDM_PROJECTINFOFORM"
                field="MANAGERNAME" />
        </td>
        <td class="td-l">
            工程类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" tablename="MDM_PROJECTINFOFORM"
                field="PROJECTTYPEID" req="1" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)" AutoPostBack="true"
                OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiOldProjectType" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            省份(洲)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" tablename="MDM_PROJECTINFOFORM"
                field="PROVINCE" req="1" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)" AutoPostBack="True"
                OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProvince" field="PROVINCE" tablename="MDM_PROJECTINFOFORM" />
        </td>
        <td class="td-l">
            服务类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightDropDownList ID="ddlService" runat="server" tablename="MDM_PROJECTINFOFORM"
                AutoPostBack="true" OnSelectedIndexChanged="ddlService_SelectedIndexChanged"
                field="SERVICETYPE" req="1" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiServiceType" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            地区(国家)
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlArea" runat="server" tablename="MDM_PROJECTINFOFORM"
                field="AREA" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiArea" field="AREA" tablename="MDM_PROJECTINFOFORM" />
        </td>
        <td class="td-l">
            任务来源<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlTaskResource" runat="server" tablename="MDM_PROJECTINFOFORM"
                maxlength="32" field="TASKRESOURCE" req="1" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            投标编号<span class="req-star" spanbid="true">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbBidNumber" field="BIDNUMBER" tablename="MDM_PROJECTINFOFORM"
                activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)" MaxLength="16"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            组织部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtBelongDeptName" field="BELONGDEPTNAME"
                tablename="MDM_PROJECTINFOFORM" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiBelongDeptID':'id'}"
                Filter="{OrganizationLevel:'2'}" req="1" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input id="hiBelongDeptID" type="hidden" field="BELONGDEPTID" runat="server" tablename="MDM_PROJECTINFOFORM" />
        </td>
        <td class="td-l">
            所属板块<span class="req-star">*</span>
        </td>
        <td id="trResource">
            <zhongsoft:LightDropDownList ID="ddlBelongPlate" runat="server" field="BELONGPLATEID"
                req="1" tablename="MDM_PROJECTINFOFORM" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l" showtype="other">
            其他任务来源<span class="req-star">*</span>
        </td>
        <td showtype="other" class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbOtherTaskSource" field="OTHERTASKSOURCE"
                tablename="MDM_PROJECTINFOFORM" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)"
                MaxLength="512"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            建设单位<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" field="CUSTOMERNAME"
                tablename="MDM_PROJECTINFOFORM" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                Writeable="false" ShowAttrs="name" ResultForControls="{'hiCustomerID':'id'}"
                PageUrl="~/MM/Obsolete/CustomerSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input id="hiCustomerID" type="hidden" field="CUSTOMERID" runat="server" tablename="MDM_PROJECTINFOFORM" />
        </td>
        <td class="td-l">
            联系人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContactName" field="CONTACTNAME"
                tablename="MDM_PROJECTINFOFORM" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                OnClientClick="return selContact()" Writeable="false" ShowAttrs="name" ResultForControls="{'hiContactID':'id'}"
                PageUrl="~/MM/Obsolete/CustomerContactSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input id="hiContactID" type="hidden" field="CONTACTID" runat="server" tablename="MDM_PROJECTINFOFORM" />
        </td>
        <td class="td-l">
            联系电话 <span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContactPhone" field="CONTACTTELEPHONE"
                req="1" class="kpms-textbox" tablename="MDM_PROJECTINFOFORM" readonly="readonly"
                activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务来源说明<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbResourceExplain" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="256" tablename="MDM_PROJECTINFOFORM"
                req="1" field="RESOURCEEXPLAIN" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务情况描述
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbConditionDescription" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_PROJECTINFOFORM"
                field="CONDITIONDESCRIPTION" activestatus="(23.填写工程信息)(3.修改工程信息)(3.接收处理)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目补充信息
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbAdditionInfo" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_PROJECTINFOFORM"
                field="ADDITIONINFO" activestatus="(23.填写工程信息)(3.修改工程信息)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr displaystatus="(3.填写工程信息)(3.修改工程信息)" runat="server" id="trShowNew">
        <td colspan="6" align="right">
            <asp:Button runat="server" ID="btnAddProject" OnClick="btnAddProject_Click" Text="添加工程"
                OnClientClick="return addDetail()" />
            <asp:Button runat="server" ID="btnSelProject" OnClick="btnSelProject_Click" Text="选择工程"
                OnClientClick="return selMarketProject()" />
        </td>
    </tr>
    <tr>
        <td colspan="6" style="">
            <asp:Label runat="server" ID="lbTip" ForeColor="Red">为保证信息的准确性，如果您在添加工程后改变工程类别，请将工程删除后重新添加工程！</asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <uc1:MarketProjectInfo ID="ucProjectList" runat="server"></uc1:MarketProjectInfo>
        </td>
    </tr>
</table>
<!---记录选择的工程信息-->
<input type="hidden" runat="server" id="hiSelProject" />
<!---工程立项审批主键ID-->
<input type="hidden" runat="server" id="hiProjectInfoID" field="PROJECTINFOID" tablename="MDM_PROJECTINFOFORM" />
<!---原工程立项审批主键ID-->
<input type="hidden" runat="server" id="hiOldProjectInfoID" field="OLDPROJECTINFOID"
    tablename="MDM_PROJECTINFOFORM" />
<!---下达任务类别-->
<input type="hidden" runat="server" id="hiIsNew" field="ISNEW" tablename="MDM_PROJECTINFOFORM" />
<input type="hidden" runat="server" id="hiGeneralName" value="总包" />
<input type="hidden" runat="server" id="hiDeptHeaderValue" value="部门负责人" />
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        checkOtherTask();
        $("#<%=ddlTaskResource.ClientID %> ").live("change", function () { checkOtherTask(); });
        if ("<%=IsAdjust %>".toLowerCase() == "true") {
            $("#<%=trShowNew.ClientID %>").hide();
            if ($("#<%=hiOldProjectInfoID.ClientID %>").val() == "") {
                $("#<%=txtTaskName.ClientID %>").attr("readonly", "readonly");
                $("#<%=txtTaskName.ClientID %>").css("background-color", "#EEF8FC");
            }
            $("#trChange").show();
            //添加必填控制
            $("#<%=cbChangeType.ClientID %>").attr("req", "1");
        }
        else {
            $("#<%=lbtnSelTask.ClientID %>").hide();
            $("#<%=cbChangeType.ClientID %>").removeAttr("req");
            $("#trChange").hide();
        }
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "填写工程信息" || $actName == "修改工程信息" || $actName == "接收处理") {
                //设计阶段必填
                var alertMsg = checkSelPhases();
                if (alertMsg != "") {
                    var last = alertMsg.lastIndexOf(',');
                    alertMsg = alertMsg.slice(0, last);
                    alert("请填写第" + alertMsg + "行的设计阶段");
                    return false;
                }
                if (getProjectCount() < 1) {
                    alert("请添加要审批的工程信息");
                    return false;
                }
                //接收处理步骤，必须编写工程编号
                if ($actName == "接收处理") {
                    alertMsg = "";
                    alertMsg = checkFillProjectCode();
                    if (alertMsg != "") {
                        var last = alertMsg.lastIndexOf(',');
                        alertMsg = alertMsg.slice(0, last);
                        alert("请编写第" + alertMsg + "行的工程编号");
                        return false;
                    }
                }
            }
            //预估合同额必填
            if ($actName == "填写预估合同额") {
                var alertMsg = checkFillValue();
                if (alertMsg != "") {
                    var last = alertMsg.lastIndexOf(',');
                    alertMsg = alertMsg.slice(0, last);
                    alert("请填写第" + alertMsg + "行工程的预估合同额信息");
                    return false;
                }
            }
        }

        return true;
    }

    //验证任务来源为其他时，其他任务来源信息必填
    function checkOtherTask() {
        var taskSource = $("#<%=ddlTaskResource.ClientID %> :selected").val();
        if (taskSource == "3") {
            $("#trResource").removeAttr("colspan");
            $("[showType=other]").show();
            $("#<%=tbOtherTaskSource.ClientID %>").attr("req", "1");
        }
        else {
            $("#trResource").attr("colspan", "3");
            $("[showType=other]").hide();
            $("#<%=tbOtherTaskSource.ClientID %>").removeAttr("req");
        }
        if (taskSource == "1") {
            $("#<%=tbBidNumber.ClientID %>").attr("req", "1");
            $("[spanbid]").show();
        }
        else {
            $("[spanbid]").hide();
            $("#<%=tbBidNumber.ClientID %>").removeAttr("req");
        }
    }

    function editDetail(midMarketProjectID, isNewProject) {
        return showDetail(midMarketProjectID, 3, isNewProject);
    }

    function addDetail() {
        return showDetail("", 2, "1");
    }

    function showDetail(midMarketProjectID, actionType, isNewProject) {
        var isGeneralProject = $("#<%=hiServiceType.ClientID %>").val() == $("#<%=hiGeneralName.ClientID %>").val();
        var json = { projectInfoFormID: $bizCtx.bizId, isMidInfo: true, currActName: escape($actName), projectTypeID: $("#<%=ddlProjectType.ClientID %>").val(), isAdjust: "<%=IsAdjust %>", isNewProject: isNewProject, isGeneralProject: isGeneralProject };
        var url = buildBizUrl(actionType, midMarketProjectID, "MM/List/MDM/MarketProjectEditor.aspx", json);
        return checkReturn(showModal(url, null, 750, 1150));
    }

    function viewDetail(midMarketProjectID, isNewProject) {
        return showDetail(midMarketProjectID, 1, isNewProject);
    }

    //选择客户联系人信息
    function selContact() {
        var customerID = $("#<%=hiCustomerID.ClientID %>").val();
        if (customerID == "") {
            alert("请选择建设单位");
        }
        else {
            var param = new InputParamObject("s");
            var json = "{CUSTOMERID: '" + customerID + "' }";
            var reObj = getCustomerContact('re', param, json);
            if (reObj != null) {
                $("#<%=txtContactName.ClientID %>").val(reObj.getName());
                $("#<%=txtContactName.ClientID %>").next().val(reObj.getName());
                $("#<%=hiContactID.ClientID %>").val(reObj.getId());
                $("#<%=txtContactPhone.ClientID %>").val(reObj.buildAttrJson("o", "PHONE"));
                if ($("#<%=txtContactPhone.ClientID %>").val() == "") {
                    $("#<%=txtContactPhone.ClientID %>").val(reObj.buildAttrJson("o", "MOBILEPHONE"));
                }
            }
        }
        return false;
    }

    //选择市场项目
    function selMarketProject() {
        var param = new InputParamObject("m");
        var json = "{ projectTypeID: '" + getProjectTypeID() + "' }";
        var reObj = getMarketProjects('<%=hiSelProject.ClientID %>', param, json);

        if (reObj != null) {
            if ($('#<%=hiSelProject.ClientID %>').val() != '') {
                return true;
            }
        }
        return false;
    }

    //选择工程立项审批单
    function selProjectTask() {
        var param = new InputParamObject("s");
        var reObj = getProjectTask('re', param, "");

        if (reObj != null) {
            $("#<%=hiOldProjectInfoID.ClientID %>").val(reObj.getId());
            $("#<%=txtTaskName.ClientID %>").val(reObj.getName());
            $("#<%=txtProXYDate.ClientID %>").val(reObj.buildAttrJson("o", "FROXYDATE"));
            $("#<%=txtManagerName.ClientID %>").val(reObj.buildAttrJson("o", "MANAGERNAME"));
            $("#<%=txtManagerName.ClientID %>").next().val(reObj.buildAttrJson("o", "MANAGERNAME"));
            $("#<%=hiManagerName.ClientID %>").val(reObj.buildAttrJson("o", "MANAGERNAME"));
            $("#<%=hiManagerID.ClientID %>").val(reObj.buildAttrJson("o", "MANAGERID"));
            $("#<%=ddlProjectType.ClientID %>").val(reObj.buildAttrJson("o", "PROJECTTYPEID"));
            $("#<%=hiOldProjectType.ClientID %>").val(reObj.buildAttrJson("o", "PROJECTTYPEID"));
            $("#<%=ddlProvince.ClientID %>").val(reObj.buildAttrJson("o", "PROVINCE"));
            $("#<%=hiProvince.ClientID %>").val(reObj.buildAttrJson("o", "PROVINCE"));
            $("#<%=ddlArea.ClientID %>").val(reObj.buildAttrJson("o", "AREA"));
            $("#<%=hiArea.ClientID %>").val(reObj.buildAttrJson("o", "AREA"));
            $("#<%=ddlTaskResource.ClientID %>").val(reObj.buildAttrJson("o", "TASKRESOURCE"));
            $("#<%=tbOtherTaskSource.ClientID %>").val(reObj.buildAttrJson("o", "OTHERTASKSOURCE"));
            $("#<%=tbAdditionInfo.ClientID %>").val(reObj.buildAttrJson("o", "ADDITIONINFO"));
            $("#<%=txtCustomerName.ClientID %>").val(reObj.buildAttrJson("o", "CUSTOMERNAME"));
            $("#<%=txtCustomerName.ClientID %>").next().val(reObj.buildAttrJson("o", "CUSTOMERNAME"));
            $("#<%=hiCustomerID.ClientID %>").val(reObj.buildAttrJson("o", "CUSTOMERID"));
            $("#<%=txtContactName.ClientID %>").val(reObj.buildAttrJson("o", "CONTACTNAME"));
            $("#<%=txtContactName.ClientID %>").next().val(reObj.buildAttrJson("o", "CONTACTNAME"));
            //联系人电话 
            $("#<%=txtContactPhone.ClientID %>").val(reObj.buildAttrJson("o", "CONTACTTELEPHONE"));
            $("#<%=hiContactID.ClientID %>").val(reObj.buildAttrJson("o", "CONTACTID"));
            $("#<%=ddlService.ClientID %>").val(reObj.buildAttrJson("o", "SERVICETYPE"));
            $("#<%=hiServiceType.ClientID %>").val(reObj.buildAttrJson("o", "SERVICETYPE"));
            //组织部门
            $("#<%=txtBelongDeptName.ClientID %>").val(reObj.buildAttrJson("o", "BELONGDEPTNAME"));
            $("#<%=txtBelongDeptName.ClientID %>").next().val(reObj.buildAttrJson("o", "BELONGDEPTNAME"));
            $("#<%=hiBelongDeptID.ClientID %>").val(reObj.buildAttrJson("o", "BELONGDEPTID"));
            //所属板块
            $("#<%=ddlBelongPlate.ClientID %>").val(reObj.buildAttrJson("o", "BELONGPLATEID"));
            //选择完成后，任务名称置为可改变的
            $("#<%=txtTaskName.ClientID %>").removeAttr("readonly");
            $("#<%=txtTaskName.ClientID %>").removeAttr("style"); ;
            return true;
        }
        return false;
    }

    function getProjectTypeID() {
        return $("#<%=ddlProjectType.ClientID %>").val();
    }
  
</script>
