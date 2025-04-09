<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhaseProjectCommon.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Project.PhaseProjectCommon" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile" TagPrefix="uc3" %>
<%@ Register Src="../OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc2" %>
<%@ Register Src="../OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l" flag="hide">项目模板
        </td>
        <td class="td-r" flag="hide" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectTemplate" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectTemplateID':'id'}" EnableTheming="false"
                Text="选择模板" PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" FilterFunction="projTempFilter()" activestatus="(3.填写任务书)(3.汇总意见)"
                OnClick="lbsSelectTemplate_Click" field="ProjectTemplateName" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiProjectTemplateID" name="hiProjectTemplateID" field="ProjectTemplateID" tablename="EPMS_ProjectEntity" />
            <span style="color: red" displaystatus="(3.填写任务书)(3.汇总意见)" runat="server">如果找不到合适的模板请选择“空模板”</span>
            <span style="color: red" displaystatus="(2.填写任务书)(2.汇总意见)" runat="server">保存后选择模板</span>
            <input type="hidden" runat="server" id="hiOrginalTemplateID" />
        </td>
        
        <td class="td-l">通知单号
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbNoticeNo" EnableTheming="false" field="NoticeNo" tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.填写任务书)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr style="display:none;">
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsMarketProjectName" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                ResultForControls="{'hiMarketProjectID':'id','tbProjectName':'name','txtMarketProjectCode':'MarketProjectCode','ddlProjectLevel':'ProjectLevel',
                'hiParamBusinessPlateID':'ParamBusinessPlateID','hiParamProjectTypeID':'ParamProjectTypeID',
                'txtProjectType':'ProjectType','tbProjectPlace':'BuildPlace','tbProjectScale':'ProjectScale',
                'hiBusinessPlate':'BusinessPlate','hiProjectPackage':'ProjectPackage','hiIsAbroad':'IsChurchyard'}"
                OnClick="lbsMarketProjectName_Click" PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx" Filter="{IsFormalProject:'1'}" req="1"
                EnableTheming="false" PageWidth="850" Writeable="false"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiMarketProjectID" field="MarketProjectID" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiProjectPackage" field="ProjectPackage" tablename="EPMS_ProjectEntity" />

        </td>
        <td class="td-l" flag="hide">工程编号
        </td>
        <td class="td-m" flag="hide">
            <zhongsoft:XHtmlInputText ID="txtMarketProjectCode" runat="server" readonly="readonly" class="kpms-textbox"
                activestatus="(23.*)(23.填写任务书)(23.汇总意见)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectName" EnableTheming="false" req="1" field="ProjectName"
                tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.填写任务书)(23.汇总意见)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" EnableTheming="false" req="1" field="ProjectCode"
                tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.填写任务书)(23.汇总意见)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目阶段<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:Label ID="lblProjectPhases" runat="server" Text="Label"></asp:Label>
            <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.*)(23.填写任务书)(23.汇总意见)"
                RepeatDirection="Horizontal" RepeatColumns="8" req="1" Visible="false" />
            <input type="hidden" runat="server" id="hiParamPhaseID" field="ParamPhaseID" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiPhaseName" field="PhaseName" tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l" flag="hide">项目分类<span class="req-star">*</span>
        </td>
        <td class="td-r" flag="hide">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectLevel" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" req="1">
            </zhongsoft:LightDropDownList>
            <input id="hiProjectLevel" runat="server" type="hidden" tablename="EPMS_ProjectEntity" field="ProjectLevel" />
        </td>
        <td class="td-l">是否重大项目<span class="req-star">*</span>
        </td>
        <td class="td-r"">
            <asp:RadioButtonList runat="server" ID="rblIsImportant" req="1" tablename="EPMS_ProjectEntity" field="IsImportant" RepeatDirection="Horizontal" activestatus="(23.填写任务书)">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
        </td>
        <td class="td-l">项目类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectType" runat="server" readonly="readonly" class="kpms-textbox"
                activestatus="(23.*)(23.填写任务书)(23.汇总意见)" field="ProjectType" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiParamProjectTypeID" field="ParamProjectTypeID" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiProjectTypeCode" field="ProjectTypeCode" tablename="EPMS_ProjectEntity" />
        </td>
         <td class="td-l">项目来源<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectResource" runat="server" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" Field="ProjectResourceID" TableName="EPMS_ProjectEntity" Width="220px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiProjectResource" name="hiProjectResource" runat="server" field="ProjectResource" tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目牵头分院<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlHostDeptName" req="1" runat="server" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" Field="HostDeptID" TableName="EPMS_ProjectEntity" Width="220px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiHostDeptName" name="hiHostDeptName" runat="server" field="HostDeptName" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l">项目配合分院<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsDeputyDeptName" IsMutiple="true" ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiDeputyDeptID':'id'}" EnableTheming="false" PageWidth="850" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_ProjectEntity" field="DeputyDeptName" activestatus="(23.填写任务书)" DoCancel="false" Writeable="false" req="1"  />
            <input type="hidden" id="hiDeputyDeptID" name="hiDeputyDeptID" runat="server" field="DeputyDeptID" tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
       
        <td class="td-l">项目经费（万元）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectFunds" runat="server" class="kpms-textbox-money" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" />
            <input type="hidden" runat="server" id="hiProjectFunds" field="ProjectFunds" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l" flag="hide">项目预估产值(万元)
        </td>
        <td class="td-r" flag="hide">
            <zhongsoft:XHtmlInputText ID="txtEstimateContractVal" runat="server" class="kpms-textbox-money"
                activestatus="(23.*)(23.填写任务书)(23.汇总意见)" />
            <input type="hidden" runat="server" id="hiEstimateContractVal" field="EstimateContractVal" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-r" flag="show" colspan="2"></td>
        <td class="td-r" flag="show" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">业主单位
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                EnableTheming="false" PageWidth="850" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_ProjectEntity"
                field="CustomerName" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" DoCancel="false" Writeable="false" />
            <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">业主单位联系人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbCustomerContact" EnableTheming="false" field="CustomerContact"  req="1" tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.填写任务书)(23.汇总意见)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">联系方式
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContactInformation" EnableTheming="false" field="ContactInformation" tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.填写任务书)(23.汇总意见)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">下达日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtAssignDate" runat="server" activestatus="(23.*)(23.填写任务书)(23.汇总意见)"
                class="kpms-textbox-date" readonly="readonly" field="AssignDate" tablename="EPMS_ProjectEntity">
            </zhongsoft:XHtmlInputText>
            
        </td>
        <td class="td-l">工程投产日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanStartDate" runat="server" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" req="1"
                class="kpms-textbox-comparedate" compare="1" readonly="readonly" field="PlanStartDate" tablename="EPMS_ProjectEntity">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">计划完成日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanCompleteDate" runat="server" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" Onchange="CompareDate(this);"
                class="kpms-textbox-comparedate" compare="1" readonly="readonly" field="PlanCompleteDate" tablename="EPMS_ProjectEntity" req="1">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiPlanCompleteDate" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工作内容及范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectScale" runat="server" TextMode="MultiLine" MaxLength="1024" req="1" 
                field="ProjectScale" tablename="EPMS_ProjectEntity" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">资料来源<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbFileResource" runat="server" TextMode="MultiLine" MaxLength="1024" req="1" 
                field="FileResource" tablename="EPMS_ProjectEntity" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">时间任务要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbTimeTaskRequire" EnableTheming="false" req="1" field="TimeTaskRequire"
                tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.填写任务书)(23.汇总意见)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">专业工作内容及时间要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDesignRange" runat="server" TextMode="MultiLine" MaxLength="1024" req="1" 
                field="DesignRange" tablename="EPMS_ProjectEntity" activestatus="(23.*)(23.填写任务书)(23.汇总意见)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <uc2:ProjectMgrUser ID="ProjectMgrUser1" runat="server" Visible="false" />
    <uc1:ProjectSpeUser ID="ProjectSpeUser1" runat="server" Visible="false" />
    <tr style="display: none">
        <td colspan="6">
            <span style="float: right;" id="Span3" runat="server" displaystatus="(3.*)(3.填写任务书)">
                <asp:LinkButton runat="server" ID="lbtnSelDept" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="选择部门" width="16"
                            height="16" />选择部门</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr style="display: none">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                DataKeyNames="ValueDeptID" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="比例（%）<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbRate" flag="deptValue"
                                Text='<%# Eval("Rate") %>' req="1" DataType="Decimal2"
                                CssClass="kpms-textbox-money" EnableTheming="false" Enabled="false"></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiValueDeptID" value='<%#Eval("ValueDeptID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ValueDeptID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">相关附件</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" displaystatus="(23.填写任务书)(23.汇总意见)" ActiveStatus="(23.填写任务书)(23.汇总意见)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
            <uc3:UpLoadFile ID="Attachment" runat="server" />
        </td>
    </tr>
</table>
<!-- 主键-->
<input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProjectEntity" field="OrganizationID" />
<input type="hidden" runat="server" id="hiParamBusinessPlateID" tablename="EPMS_ProjectEntity" field="ParamBusinessPlateID" />
<input type="hidden" runat="server" id="hiBusinessPlate" tablename="EPMS_ProjectEntity" field="BusinessPlate" />
<input type="hidden" runat="server" id="hiIsAbroad" tablename="EPMS_ProjectEntity" field="IsAbroad" />
<input id="hiFlag" type="hidden" tablename="EPMS_ProjectEntity" field="Flag" runat="server" />
<input id="hiFormDate" type="hidden" tablename="EPMS_ProjectEntity" field="FormDate" runat="server" />
<%--综合能源公司,用于估算产值权限判断--%>
<input type="hidden" runat="server" id="hiZHNYGSName" value="综合能源公司" />
<input type="hidden" runat="server" id="hiDeptXML" />
<%--创建时是立项状态--%>
<input id="hiProjectState" runat="server" type="hidden" tablename="EPMS_ProjectEntity" field="ProjectState" value="1" />
<script type="text/javascript">
    function initCustomerPlugin() {
        isMyProj();
        setHide();
    }
    //选择项目模板筛选（业务类型、业务板块筛选）
    function projTempFilter() {
        return { 'OrganizationID': $('#<%=hiOrganizationID.ClientID%>').val() };
    }
    //选择项目模板前
    function beforeSelectTemplate() {
        var orgID = $("#<%=hiOrganizationID.ClientID %>").val();
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        $("#<%=hiOrginalTemplateID.ClientID %>").val($("#<%=hiProjectTemplateID.ClientID %>").val());
        return true;
    }
    //选择设总前验证选择了工程类型
    function beforeSelChief() {
        var projectLevel = $('#<%=ddlProjectLevel.ClientID%>').val();
        if (projectLevel == "" || projectLevel == undefined) {
            alert("请先选择工程类型");
            return false;
        }
        return true;
    }
    function CompareDate(planDate) {
        var thisDate = planDate.value;
        var MPDate = $("#<%=hiPlanCompleteDate.ClientID%>").val();
        if (thisDate != "" && MPDate != "") {


            if (new Date(thisDate.replaceAll('-', '/')) > new Date(MPDate.replaceAll('-', '/'))) {
                alert("阶段计划完成日期不能超过项目计划完成日期" + MPDate);
                planDate.value = "";
            }
        }
    }
    //检查估算额是否填写
    function checkGS() {
        var flag = 0;
        $('#<%=cblProjectPhases.ClientID %>').find("input[type='checkbox']:checked").each(function () {
            var sValue = $(this).next().text();
            if (sValue != "") {
                flag = 1;
            }
        })
        if (flag == 0) {
            var gsValus = $("#<%=txtEstimateContractVal.ClientID%>").val();
            if (gsValus == "") {
                alert("阶段估算产值不可为空，请在【正式项目】台帐维护。");
                return false;
            }
        }
        return true;
    }
    function isMyProj() {
        var isMyproject = '<%=IsMyProJect%>';
        if (isMyproject == "1") {
            $("#[flag$='tdNoMyProj']").hide();
            $("#[flag$='tdIsMyProj']").show();
        } else {
            $("#[flag$='tdNoMyProj']").show();
            $("#[flag$='tdIsMyProj']").hide();
        }
    }
    function checkType() {
        var typeID = $("#<%=hiParamProjectTypeID.ClientID%>").val();
        if (typeID == undefined || typeID == "") {
            alert("历史工程—请到正式项目台账中进行修改工程类别信息！");
            return false;
        }
        return true;
    }

    // 设置隐藏
    function setHide() {
        $('[flag="hide"]').hide();
        $('[flag="show"]').show();
    }
</script>
