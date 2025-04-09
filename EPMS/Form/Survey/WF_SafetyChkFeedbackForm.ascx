<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SafetyChkFeedbackForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Survey.WF_SafetyChkFeedback" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            标题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtOutlineTheme" runat="server" MaxText="256" field="SupervisionTheme"
                tablename="EPMS_SafetyChkFeedbackForm" readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiProjectID':'id','txtProjectCode':'ProjectCode','tbProjectType':'ProjectType','tbPhaseName':'PhaseName','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                activestatus="(2.编制安全管理反馈)" req="1" field="ProjectName" tablename="EPMS_SafetyChkFeedbackForm"
                AfterSelect="afterSelect()"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiProjectID" runat="server" field="OrganizationID" tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                class="kpms-textbox" field="ProjectCode" tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
    </tr>
    <tr runat="server" id="trExtendInfo">
        <td class="td-l">
            设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtManagerUserName" runat="server" readonly="readonly"
                maxlength="32" class="kpms-textbox" field="ManagerUserName" tablename="EPMS_SafetyChkFeedbackForm" />
            <input type="hidden" id="hiManagerUserID" name="hiManagerUserID" runat="server" field="ManagerUserID"
                tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
        <td class="td-l">
            项目类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbProjectType" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox" field="ProjectType" tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox" field="PhaseName" tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否院级
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsConfirm" RepeatDirection="Horizontal"
                req="1" field="SupervisionType" tablename="EPMS_SafetyChkFeedbackForm" ActiveStatus="(23.部门审核)">
                <asp:ListItem Text="是" Value="院级"></asp:ListItem>
                <asp:ListItem Text="否" Value="部门级"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-r" colspan="4" style="color: Red; font-weight: bold">
            由部门审核时判断，院级需要经过安全监察部批准。
        </td>
    </tr>
    <tr>
        <td class="td-l">
            编写人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtWriteUserName" runat="server"
                readonly="readonly" field="WriteUserName" tablename="EPMS_SafetyChkFeedbackForm" />
            <!--- 填写（编制\编写）人ID-->
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" field="WriteUserID"
                tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtPhone" runat="server" readonly="readonly"
                field="WriteUserPhone" tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
        <td class="td-l">
            编制部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteRoomName" runat="server" MaxText="32" class="kpms-textbox"
                readonly="readonly" field="WriteRoomName" tablename="EPMS_SafetyChkFeedbackForm" />
            <!--编制（编写）部门ID--->
            <input type="hidden" id="hiWriteRoomID" name="hiWriteRoomID" runat="server" field="WriteRoomID"
                tablename="EPMS_SafetyChkFeedbackForm" />
            <!--编制（编写）部门ID--->
            <input type="hidden" id="hiWriteDeptID" name="hiWriteDeptID" runat="server" field="WriteDeptID"
                tablename="EPMS_SafetyChkFeedbackForm" />
            <input type="hidden" id="hiWriteDeptName" name="hiWriteDeptName" runat="server" field="WriteDeptName"
                tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            安全监查编号
        </td>
        <td class="td-r">
            <asp:DropDownList ID="ddlSupervisionCode" runat="server" field="SupervisionID" tablename="EPMS_SafetyChkFeedbackForm"
                ActiveStatus="(2.编制安全管理反馈)" req="1">
            </asp:DropDownList>
            <input type="hidden" id="hiSupervisionCode" runat="server" field="SupervisionCode"
                tablename="EPMS_SafetyChkFeedbackForm" />
            <input type="hidden" id="hiSupervisionID" runat="server" field="SupervisionID" tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
        <td class="td-l">
            安全管理反馈编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtInvestigationCode" runat="server"
                readonly="readonly" field="InvestigationCode" tablename="EPMS_SafetyChkFeedbackForm"
                req="1" />
        </td>
        <td class="td-l">
            编制时间
        </td>
        <td class="td-m">
            <!-- class="kpms-textbox-date" -->
            <zhongsoft:XHtmlInputText ID="txtWriteTime" runat="server" class="kpms-textbox" readonly="readonly"
                field="WriteDate" tablename="EPMS_SafetyChkFeedbackForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbFormContent" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="2048" tablename="EPMS_SafetyChkFeedbackForm"
                field="FormContent" ActiveStatus="(23.编制安全管理反馈)(23.编制修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td align="center" style="font-weight: bold; font-size: 14px" colspan="6">
            事故隐患排查整改情况<asp:LinkButton runat="server" ID="lbtnUpdateCode" CssClass="subtoolbarlink"
                EnableTheming="false" ActiveStatus="(3.步骤)" OnClick="btnUpdateCode_Click" Visible="false">
                <span>更新安全监查编码</span></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span id="Span4" style="float: right">
                <asp:LinkButton runat="server" ID="lbtnLoadCheckItems" CssClass="subtoolbarlink"
                    EnableTheming="false" ActiveStatus="(23.编制安全管理反馈)(23.编制修改)" OnClientClick="return batchLoadCheckItems()"
                    OnClick="btnLoadCheckItems_Click" DisplayStatus="(23.编制安全管理反馈)(23.编制修改)">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_shengban.png" alt="导入安全监查流程中的要求"
                            width="16" height="16" />导入安全监查流程数据</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnAddSaftyFeedback" CssClass="subtoolbarlink"
                    EnableTheming="false" ActiveStatus="(23.编制安全管理反馈)(23.编制修改)" OnClick="btnAddSaftyFeedback_Click"
                    OnClientClick="return addLoadCheckItems()" DisplayStatus="(23.编制安全管理反馈)(23.编制修改)">
                    <span>
                        <img runat="server" id="img4" src="~/Themes/Images/btn_add.gif" alt="新增事故隐患排查整改情况"
                            width="16" height="16" />新增</span></asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvSaftyFeedback" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="InFeedbackID"
                UseDefaultDataSource="true" OnRowCommand="gvSaftyFeedback_RowCommand" OnRowDataBound="gvSaftyFeedback_RowDataBound"
                BindGridViewMethod="UserControl.BindSaftyFeedback" PermissionStatus="true">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="InvestigationContent" HeaderText="隐患排查情况描述"
                        ShowToolTip="true" Width="150">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="InvestigationType" HeaderText="类别">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="RiskLevel" HeaderText="风险等级">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PlanExcDate" HeaderText="要求整改完成时间">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="实际整改完成时间<span class='req-star'>*</span>"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtSupervisionDate" runat="server" type="text" class="kpms-textbox-date"
                                activestatus="(23.编制安全管理反馈)(23.编制修改)" Value='<%#Eval("ReformDate") %>' checkReq="1" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="整改责任人" HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <input runat="server" id="hiOperatorID" type="hidden" value='<%#Eval("ReformUserID") %>' />
                            <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" Value='<%#Eval("ReformUserName") %>'
                                IsMutiple="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                Style="width: 100px !important" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                ResultForControls="{'hiOperatorID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                activestatus="(23.编制安全管理反馈)(23.编制修改)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="整改措施<span class='req-star'>*</span>" HeaderStyle-Width="250px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbOperatorResult" runat="server" MaxLength="2000" Text='<%#Eval("ReformMeasure") %>'
                                activestatus="(23.编制安全管理反馈)(23.编制修改)" CssClass="kpms-textarea" TextMode="MultiLine" Rows="2" EnableTheming="false" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editSaftyFeedback" DataParamFields="InFeedbackID"
                        CommandName="EditData" />
                    <zhongsoft:LightTemplateField HeaderText="保存">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="SaveData" CommandArgument='<%#Eval("InFeedbackID") %>'
                                EnableTheming="false">
						<img alt="保存" title="保存" src="<%=WebAppPath%>/themes/images/btn_save.gif" >
                        </img>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewSaftyFeedback" DataParamFields="InFeedbackID"
                        CommandName="ViewData" />
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DataParamFields="InFeedbackID">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---勘测项目外业安全管理反馈流程ID-->
<input type="hidden" runat="server" id="hiDisableDel" value="1"  />
<input type="hidden" runat="server" id="hiSafetyChkFeedbackID" 
    field="SafetyChkFeedbackID" tablename="EPMS_SafetyChkFeedbackForm" />
<script type="text/javascript" src="<%=WebAppPath %>/EM/UI/Script/EMGeneralScript.js"></script>
<script type="text/javascript">

//导入安全管理流程数据
    function batchLoadCheckItems() {
        if (!(confirm('导入之后，将无法再删除该记录.您确定导入安全监查流程中的隐患排查要求么？')))
                return false;
    }

    function afterSelect() {
        var ProjName = $("#<%=txtProjectName.ClientID %>").val();
        var ProjCode = $("#<%=txtProjectCode.ClientID %>").val();
        $("#<%=txtOutlineTheme.ClientID %>").val(ProjName + "【" + ProjCode + "】" + "外业安全管理反馈");
        BindSupervisionCode();
    }
    
    function BindSupervisionCode() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnUpdateCode,"")%>;
    }

   
   function addLoadCheckItems() {
        handleLoadCheckItems(2, '');
        return false;
    }

    function editSaftyFeedback(bizId) {
        handleLoadCheckItems(3, bizId);
        return false;
    }

    function viewSaftyFeedback(bizId) {
        handleLoadCheckItems(1, bizId);
        return false;
    }

    function handleLoadCheckItems(actionType, bizId) {
        var FormID = $('#<%=hiSafetyChkFeedbackID.ClientID %>').val();
        var json = { actionType: actionType, bizId: bizId, SafetyChkFeedbackID: FormID };
        var url = buildQueryUrl('/EPMS/Form/Survey/SafetyChkFeedbackEditor.aspx', json);
        var callBack = BindTable;
        showDivDialog(encodeURI(url), "", 800, 600, callBack);
    }

    
    //刷新
    function BindTable() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddSaftyFeedback,"")%>;
    }

</script>
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        // 绑定keyup和change事件
        $("#<%=ddlSupervisionCode.ClientID %>").bind("keyup change", function () {
            if ($(this).val() != "") {
                // 这里需要注意，$(this).text()获取的是整个集合的text属性内容，所以需要再过滤下，把选中的项取出来

                var SupervisionCode = $(this).find(":selected").text();
                var InvestigationCode = SupervisionCode.replace("AQC", "AQF");

                $("#<%=hiSupervisionID.ClientID %>").val($(this).val());
                $("#<%=hiSupervisionCode.ClientID %>").val(SupervisionCode);
                $("#<%=txtInvestigationCode.ClientID %>").val(InvestigationCode);
            }
            else {
                $("#<%=hiSupervisionCode.ClientID %>").val("");
                $("#<%=txtInvestigationCode.ClientID %>").val("");
            }
        });
    });
</script>
