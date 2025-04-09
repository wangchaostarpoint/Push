<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyTaskExamForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Survey.WF_SurveyTaskExamForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhaseName':'PhaseName','tbProjectPlace':'ProjectPlace','hiProjectFlag':'ProjectFlag'}"
                TableName="EPMS_WBSBook" Field="ProjectName" activestatus="(23.主设人编制勘测任务书)" req="1"
                OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server"
                tablename="EPMS_WBSBook" field="OrganizationID" />
            <input type="hidden" id="hiProjectFlag" name="hiProjectFlag" runat="server" tablename="EPMS_WBSBook"
                field="ProjectFlag" />
        </td>
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" field="ProjectCode"
                readonly="readonly" tablename="EPMS_WBSBook" activestatus="(23.主设人编制勘测任务书)" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">建设地点<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbProjectPlace" runat="server" MaxText="64" TableName="EPMS_WBSBook"
                Field="ProjectPlace" ActiveStatus="(23.主设人编制勘测任务书)" req="1" />
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPhaseName" runat="server" readonly="readonly" activestatus="(23.主设人编制勘测任务书)"
                class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">提出人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPutUserName" runat="server" readonly="readonly"
                activestatus="(23.主设人编制勘测任务书)" class="kpms-textbox" TableName="EPMS_WBSBook"
                Field="PutUserName" />
            <input type="hidden" id="hiPutUserID" name="hiPutUserID" runat="server" tablename="EPMS_WBSBook"
                field="PutUserID" />
            <input type="hidden" id="hiPutDeptID" name="hiPutDeptID" runat="server" tablename="EPMS_WBSBook"
                field="PutDeptID" />
            <input type="hidden" id="hiPutDeptName" name="hiPutDeptName" runat="server" tablename="EPMS_WBSBook"
                field="PutDeptName" />
        </td>
        <td class="td-l">提出专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPutSpecialtyID" req="1" ActiveStatus="(23.主设人编制勘测任务书)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiPutSpecialtyID" name="hiPutSpecialtyID" runat="server"
                tablename="EPMS_WBSBook" field="PutSpecialtyID" />
            <input type="hidden" id="hiPutSpecialtyCode" name="hiPutSpecialtyCode" runat="server"
                tablename="EPMS_WBSBook" field="PutSpecialtyCode" />
            <input type="hidden" id="hiPutSpecialtyName" name="hiPutSpecialtyName" runat="server"
                tablename="EPMS_WBSBook" field="PutSpecialtyName" />
        </td>
        <td class="td-l">提出时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPutDate" runat="server"
                readonly="readonly" TableName="EPMS_WBSBook" Field="PutDate" ActiveStatus="(23.主设人编制勘测任务书)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">勘测任务书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWBSBookCode" runat="server" field="WBSBookCode"
                readonly="readonly" tablename="EPMS_WBSBook" activestatus="(23.主设人编制勘测任务书)" class="kpms-textbox" />
        </td>
        <td class="td-l">校核人
        </td>
        <td class="td-r">
            <input type="hidden" id="hiCheckUserID" name="hiCheckUserID" runat="server" tablename="EPMS_WBSBook"
                field="CheckUserID" />
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtCheckUser" runat="server" readonly="readonly"
                TableName="EPMS_WBSBook" Field="CheckUserName" ActiveStatus="(23.主任工校核)" />
        </td>
        <td class="td-l">项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectMager" runat="server" readonly="readonly"
                activestatus="(23.项目设总审批)" class="kpms-textbox" TableName="EPMS_WBSBook" Field="ProjectMagerName" />
            <input type="hidden" id="hiProjectMagerID" name="hiProjectMagerID" runat="server" tablename="EPMS_WBSBook"
                field="ProjectMagerID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">要求完成时间<span class="req-star" runat="server" displaystatus="(3.项目设总审批)">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanCompleteTime" runat="server"
                readonly="readonly" TableName="EPMS_WBSBook" Field="PlanCompleteTime" ActiveStatus="(23.主设人编制勘测任务书)(3.项目设总审批)(3.主任工校核)" />
        </td>
        <td class="td-l">下达时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtWBSSendTime" runat="server"
                readonly="readonly" TableName="EPMS_WBSBook" Field="WBSSendTime" ActiveStatus="(3.任务确认)" />
        </td>
        <td class="td-l">卷册区域
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlRollRegion" ActiveStatus="(23.主设人编制勘测任务书)"
                TableName="EPMS_WBSBook" Field="RollRegion">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">任务内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbContentOrRange" runat="server" MaxLength="4000" TableName="EPMS_WBSBook"
                Field="ContentOrRange" ActiveStatus="(23.主设人编制勘测任务书)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">接收专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlReceiveSpecialtyID" req="1" ActiveStatus="(2.主设人编制勘测任务书)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiReceiveSpecialtyID" name="hiReceiveSpecialtyID" runat="server"
                tablename="EPMS_WBSBook" field="ReceiveSpecialtyID" />
            <input type="hidden" id="hiReceiveSpecialtyCode" name="hiReceiveSpecialtyCode" runat="server"
                tablename="EPMS_WBSBook" field="ReceiveSpecialtyCode" />
            <input type="hidden" id="hiReceiveSpecialtyName" name="hiReceiveSpecialtyName" runat="server"
                tablename="EPMS_WBSBook" field="ReceiveSpecialtyName" />
        </td>
        <td class="td-l">接收人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwnerName" field="WBSOwnerName"
                tablename="EPMS_WBSBook" activestatus="(3.室主任任务安排)" SourceMode="SelectorPage"
                ResultAttr="name" EnableTheming="false" ResultForControls="{'hiWBSOwnerID':'id','hiReceiveDeptID':'DEPTID','hiReceiveDeptName':'DEPTNAME'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" FilterFunction="userFilter()"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiWBSOwnerID" name="hiWBSOwnerID" runat="server" tablename="EPMS_WBSBook"
                field="WBSOwnerID" />
            <input type="hidden" id="hiReceiveDeptName" name="hiReceiveDeptName" runat="server"
                tablename="EPMS_WBSBook" field="ReceiveDeptName" />
            <input type="hidden" id="hiReceiveDeptID" name="hiReceiveDeptID" runat="server" tablename="EPMS_WBSBook"
                field="ReceiveDeptID" />
        </td>
        <td class="td-l">任务接收时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtTaskReceiveDate" runat="server"
                readonly="readonly" ActiveStatus="(23.?)" TableName="EPMS_WBSBook" Field="TaskReceiveDate" />
        </td>
    </tr>
    <tr runat="server" displaystatus="(3.室主任任务安排)(3.相关勘测专业工程师评审)(3.勘测主设人接收任务)(3.项目设总确认作废)(3.提出人确认作废)(1.*)">
        <td class="td-l">是否作废<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList ID="rblIsCancel" runat="server" TableName="EPMS_WBSBook" Field="IsCancel"
                ActiveStatus="(3.室主任任务安排)(3.相关勘测专业工程师评审)" req="1" RepeatColumns="2" RepeatDirection="Horizontal">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="trCancel" runat="server" displaystatus="(3.室主任任务安排)(3.相关勘测专业工程师评审)(3.勘测主设人接收任务)(3.项目设总确认作废)(3.提出人确认作废)(1.*)"
        style="display: none">
        <td class="td-l">作废理由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbCancelReason" runat="server" MaxText="1024" TableName="EPMS_WBSBook"
                Field="CancelReason" ActiveStatus="(3.室主任任务安排)(3.相关勘测专业工程师评审)" EnableTheming="false"
                CssClass="kpms-textarea" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td colspan="6" style="text-align: center; font-weight: bold">使用资料的专业(会签专业）<span style="float: right">
            <asp:LinkButton runat="server" ID="btnSelSpecialty" OnClientClick="return addSpe()"
                OnClick="btnSelSpecialty_Click" displaystatus="(3.主设人编制勘测任务书)(3.项目设总审批)(3.分项设总审批)(3.主任工校核)"><span>选择专业</span></asp:LinkButton>
        </span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvSpecialty" runat="server" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="SpecialtyID"
                OnRowCommand="gvSpecialty_RowCommand" OnRowDataBound="gvSpecialty_RowDataBound"
                ShowExport="true" BindGridViewMethod="BindSpecialty">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="专业名称<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <%#Eval("SpecialtyName")%>（<%#Eval("SpecialtyCode")%>）
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="专业主设人<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="lbsPerson" SourceMode="SelectorPage"
                                req="1" IsMutiple="true" ResultAttr="name" EnableTheming="false" SelectPageMode="Dialog"
                                OnClick="lbsPerson_Click" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" Enabled="false"
                                Value='<%#Eval("Persons")%>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                        DeleteText="删除后将无法恢复，确认删除{0}专业及人员吗？" DeleteTipField="SpecialtyName" Visible="false" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">技术组织措施(技术指导书）
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTechMeasure" runat="server" MaxText="2048" TableName="EPMS_WBSBook"
                Field="TechMeasure" ActiveStatus="(3.相关勘测专业工程师评审)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">勘测卷册名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode'}" activestatus="(3.相关勘测专业工程师评审)"
                FilterFunction="wbsFilter()" tablename="EPMS_WBSBook" field="WBSName" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiWBSID" name="hiWBSID" runat="server" tablename="EPMS_WBSBook"
                field="WBSID" />
        </td>
        <td class="td-l">勘测卷册编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWBSCode" runat="server" field="WBSCode" readonly="readonly"
                tablename="EPMS_WBSBook" activestatus="(3.相关勘测专业工程师评审)" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">卷册任务状态
        </td>
        <td class="td-m" colspan="5">
            <asp:Label ID="lbRollState" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">审核(评审）意见
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRecheckOpinion" runat="server" MaxText="1024" TableName="EPMS_WBSBook"
                Field="RecheckOpinion" ActiveStatus="(3.相关勘测专业工程师评审)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">审核(评审）人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtRecheckUserName" runat="server" field="RecheckUserName"
                readonly="readonly" tablename="EPMS_WBSBook" activestatus="(3.相关勘测专业工程师评审)" class="kpms-textbox" />
            <input type="hidden" id="hiRecheckUserID" name="hiRecheckUserID" runat="server" tablename="EPMS_WBSBook"
                field="RecheckUserID" />
        </td>
        <td class="td-l">审核(评审）日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtRecheckDate" runat="server"
                readonly="readonly" TableName="EPMS_WBSBook" Field="RecheckDate" ActiveStatus="(3.相关勘测专业工程师评审)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="flexible" colspan="6" onclick="openDetail('trMandatoryList')">强制性条文<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trMandatoryList">
        <td colspan="6">
            <%-- 根据卷册编号对应--%>
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMandatoryList" AllowPaging="True"
                PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                DataKeyNames="MandatoryTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindMandatoryList">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="MandatoryName" HeaderText="规范名称" DataParamFields="MandatoryTemplateID"
                        DialogMode="Dialog" EditItemClick="viewMandatoryDetail">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="条款号" ShowToolTip="true"
                        Width="100">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MandatoryContent" HeaderText="强制性条文内容" ShowToolTip="true"
                        Width="300">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!-- 任务书主键ID-->
<input type="hidden" runat="server" id="hiWBSBookID" tablename="EPMS_WBSBook" field="WBSBookID" />
<!-- 任务书类型-->
<input type="hidden" runat="server" id="hiWBSBookType" tablename="EPMS_WBSBook" field="WBSBookType"
    value="勘测任务书" />
<!-- 任务书性质-->
<input type="hidden" runat="server" id="hiWBSBookNature" tablename="EPMS_WBSBook"
    field="WBSBookNature" value="首次下达" />
<input type="hidden" runat="server" id="hiSpeXML" />
<input type="hidden" runat="server" id="hiReceiveUser" />
<%--自动发起项目组成员变更流程--%>
<asp:Button ID="btnStartUserChange" runat="server" OnClick="btnStartUserChange_Click"
    Visible="false" />
<input type="hidden" runat="server" id="hiIsHaveUserChange" />
<script type="text/javascript">
    function initCustomerPlugin() {
        if ($actName == "项目设总审批" && $action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>") {
            $("#<%=txtPlanCompleteTime.ClientID %>").attr('req', '1');
        }
        checkRegex();
        checkMaxLength();
        initIsCancel();
    }

    function getRadlValue(radl) {
        var selectVal = "";
        $("#" + radl + " input").each(function () {
            if ($(this)[0].checked) {
                selectVal = $(this).val();
                return false;
            }
        });
        return selectVal;
    }

    $("#<%=rblIsCancel.ClientID%>").live("change", function () {
        initIsCancel();
    })

    function initIsCancel() {
        var checkType = getRadlValue("<%=rblIsCancel.ClientID %>");
        if (checkType == "0") {
            $('#<%=tbCancelReason.ClientID %>').removeAttr("req");
            $('#<%=tbCancelReason.ClientID %>').val("");
            $('#<%=trCancel.ClientID %>').hide();
        }
        else {
            $('#<%=tbCancelReason.ClientID %>').attr('req', '1');
            $('#<%=trCancel.ClientID %>').show();
        }
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>" && ($actName == "分项设总审批" || $actName == "项目设总审批")) {
                var grid = $('#<%=gvSpecialty.ClientID %>')[0];
                if (grid.rows.length < 3) {
                    return confirm("您确定使用资料的专业为空？");
                }
                else if (grid.rows.length == 3) {
                    return confirm("您确定使用资料的专业只有" + grid.children[1].innerText + "？");
                }
            }
            else if ($action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>" && $actName == "室主任任务安排") {
                if ($("#<%=hiReceiveUser.ClientID%>").val().indexOf($("#<%=hiWBSOwnerID.ClientID%>").val()) == -1) {
                    //alert("接收专业主设人与所选接收人不是同一个人，请走项目组成员变更流程更换接收专业主设人！")
                    if ($("#<%=hiIsHaveUserChange.ClientID %>").val() == "true") {
                        return true;
                    } else {
                        if (confirm("接收专业主设人与所选接收人不是同一人，点击确定会自动发起项目组成员变更流程!")) {
                            //点击确定发起项目组成员变更流程
                            <%=Page.ClientScript.GetPostBackEventReference(this.btnStartUserChange,"")%>;

                        }
                    }

                    return true;
                }
            } else if ($actName == "主设人编制勘测任务书") {
                //如果所选项目的工程类型为“S”或者“X”，提出专业为“线路电气”或者“线路结构”，流程第一步发送时给出提醒：是否需要上传路径图，如果需要请上传后再发送
                var projectCode = $("#<%=txtProjectCode.ClientID %>").val();
                if (projectCode.length > 0) {
                    var projectType = projectCode.substring(0, 1);
                    if (projectType == "S" || projectType == "X") {
                        var tcSpecName = $("#<%=hiPutSpecialtyName.ClientID %>").val();
                        if (tcSpecName == "线路电气" || tcSpecName == "线路结构") {
                            return !confirm("是否需要上传路径图，如果需要请上传后再发送");
                        }
                    }
                }
            }
        }
        return true;
    }

    //选择任务的筛选条件
    function userFilter() {
        //var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        //var specialtyId = $("#<%=ddlReceiveSpecialtyID.ClientID %>").val();

        //return { ProjectPhaseID: orgId, SpecialtyID: specialtyId };
        //默认带出当前人所在科室的人员，可以修改部门查询条件选择其他科室人员。且不默认本项目下人员
        var orgID = "<%=KPMSUser.OrganizationId %>"
        return { OrganizationId: orgID };
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var specialtyId = $("#<%=ddlReceiveSpecialtyID.ClientID %>").val();
        return { OrganizationID: orgId, WBSType: '<%= DAL.EPMS.WBSMode.任务管理.GetHashCode() %>', ExeSpecialtyID: specialtyId, IsShowMore: 1, WBSStates: '0,1' };
    }

    //批量添加专业
    function addSpe() {
        var param = new InputParamObject("m");
        var filter = { OrganizationID: $("#<%=hiOrganizationID.ClientID %>").val() };
        getProjSpe('<%=hiSpeXML.ClientID %>', param, filter, bindSpe);
    }

    //执行后台添加专业数据
    function bindSpe() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnSelSpecialty,"")%>;
    }

    function openWorkFlow(bizid) {
        $("#<%=hiIsHaveUserChange.ClientID %>").val('true')
        var url = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizid });
        window.open(url);
    }


    function viewMandatoryDetail(bizId) {
        var json = { actionType: 1, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/Sys/MandatoryTemplateEditor.aspx', json);
        showDivDialog(url, null, 850, 450, null);
    }

</script>
