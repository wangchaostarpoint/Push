<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdjustActivityOfFile.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.AdjustActivityOfFile" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<%@ Register Src="~/EPMS/UI/Plan/AdjustDetailOfRoll.ascx" TagName="AdjustDetailOfRoll"
    TagPrefix="uc2" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">
            调整类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rbAdjustType" field="AdjustType" tablename="EPMS_PlanActivityOfProject"
                RepeatDirection="Horizontal" req="1" activestatus="(23.开始)(23.*)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <uc1:ProjectCommon ID="ucProjectCommon" runat="server" />
    <tr>
        <td class="td-l">
            <span flag="name">拟调整资料名称</span> <span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectFile" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiWBSInfoID':'id','txtWBSCode':'WBSCode','txtBelongSpecialtyName':'ExecSpecialtyName','hiBelongSpecialtyID':'ExecSpecialtyID','hiBelongSpecialtyCode':'ExecSpecialtyCode','txtBelongDeptName':'BelongDeptName','hiBelongDeptID':'BelongDeptID','hiParamWBSTypeID':'ParamWBSTypeID','hiParentID':'ParentID'}"
                BeforeSelect="beforeSelectWbs()" EnableTheming="false" Text="选择卷册" PageUrl="~/EPMS/Obsolete/FileItemSelector.aspx"
                PageHeight="550" PageWidth="850" field="WBSName" tablename="EPMS_PlanWBS" ShowJsonRowColName="true"
                FilterFunction="fileFilter()" AfterSelect="afterFileSelect()" ResultAttr="name"
                activestatus="(2.开始)(2.*)" />
            <input type="hidden" runat="server" id="hiWBSInfoID" field="WBSINFOID" tablename="EPMS_PlanWBS" />
            <input type="hidden" runat="server" id="hiParentID" field="ParentID" tablename="EPMS_PlanWBS" />
            <input type="hidden" runat="server" id="hiParamWBSTypeID" field="ParamWBSTypeID"
                tablename="EPMS_PlanWBS" />
        </td>
        <td class="td-l">
            <span flag="name">资料编号</span><span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.开始)(2.*)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_PlanWBS" Field="WBSCode"
                req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            专业
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBelongSpecialtyName" activestatus="(2.开始)"
                readonly="readonly" class="kpms-textbox" tablename="EPMS_PlanWBS" field="BelongSpecialtyName" />
            <!--专业ID--->
            <input type="hidden" runat="server" id="hiBelongSpecialtyID" field="BelongSpecialtyID"
                tablename="EPMS_PlanWBS" />
            <!--专业Code--->
            <input type="hidden" runat="server" id="hiBelongSpecialtyCode" field="BelongSpecialtyCode"
                tablename="EPMS_PlanWBS" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <!--资料所属部门名称--->
            <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(2.开始)(2.*)"
                readonly="readonly" class="kpms-textbox" field="BelongDeptName" tablename="EPMS_PlanWBS" />
            <!--资料所属部门ID--->
            <input type="hidden" runat="server" id="hiBelongDeptID" field="BelongDeptID" tablename="EPMS_PlanWBS" />
        </td>
        <td class="td-l">
            提出日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteTime" runat="server" activestatus="(23.开始)(2.*)"
                field="PlanStartTime" tablename="EPMS_PlanActivityOfProject" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            <span flag="name">资料内容</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbFileContent" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="1024" activestatus="(23.?)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            调整原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbThisImportance" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_PlanActivityOfProject"
                req="1" field="ThisImportance" activestatus="(23.*)(23.开始)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            调整前<br />
            计划提交出时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtOriginalPlanCompTime" runat="server" activestatus="(23.?)"
                class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            调整后<br />
            计划提交时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime" runat="server" activestatus="(23.开始)(23.*)"
                req="1" field="PlanCompleteTime" tablename="EPMS_PlanWBS" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            提出人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteUserName" runat="server" activestatus="(2.开始)(2.*)"
                field="PlanUserName" tablename="EPMS_PlanActivityOfProject" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <!--- 填写（编制\编写）人ID-->
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" tablename="EPMS_ProjectPlanBook"
                field="PlanUserName" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            是否采取例外转序<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsException" field="IsException" tablename="EPMS_PlanActivityOfProject"
                RepeatDirection="Horizontal" activestatus="(23.开始)(23.*)" req="1" OnSelectedIndexChanged="rbIsException_SelectedIndexChanged"
                AutoPostBack="true">
                <asp:ListItem Text="采取" Value="1"></asp:ListItem>
                <asp:ListItem Text="不采取" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="1024" tablename="EPMS_PlanActivityOfProject"
                req="1" field="Memo" activestatus="(23.*)(23.开始)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('ProjSpeInfo')">
            相关专业的影响及意见&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="ProjSpeInfo">
        <td colspan="6">
            <table class="tz-table">
                <tr runat="server" id="trToolBar">
                    <td align="right" colspan="6">
                        <div id="divCustomBar" style="float: left;" class="subtoolbarbg" runat="server">
                            <input type="hidden" runat="server" id="hiRoleIds" />
                            <asp:LinkButton runat="server" ID="lbtnSelProjSpe" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return selProjSpe();" ToolTip="选择计划任务" OnClick="lbtnSelProjSpe_Click">
                                <span>
                                    <img runat="server" id="img1" src="~/Themes/Images/look-up.gif" alt="选择计划任务" width="16"
                                        height="16" />选择影响的专业</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnDelProjSpe" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return checkBatchDelPlanSpe();" ToolTip="批量取消影响的专业" OnClick="lbtnBatchDel_Click">
                                <span>
                                    <img runat="server" id="img5" src="~/Themes/Images/btn_delete.gif" alt="批量取消影响的专业"
                                        width="16" height="16" />批量取消影响的专业</span>
                            </asp:LinkButton>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView runat="server" ID="gridView" PageSize="100" Width="100%"
                            UseDefaultDataSource="true" AutoGenerateColumns="false" AllowSorting="true" OnRowDataBound="gridView_RowDataBound"
                            DataKeyNames="PlanReleSpecialtyID" BindGridViewMethod="BindProjSpeInfo">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="专业名称">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbSpecialtyName" Text='<%#Eval("SpecialtyName") %>'></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="意见">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbOpioion" TextMode="MultiLine" CssClass="kpms-textarea"
                                            Text='<%#Eval("Opinion") %>' EnableTheming="false" MaxLength="256"></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="备注">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                                            Text='<%#Eval("Memo") %>' EnableTheming="false" MaxLength="256"></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="评估人" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <zhongsoft:LightObjectSelector runat="server" ID="tbAssessmentPerson" IsMutiple="true"
                                            SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                                            ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiAssessmentPersonId':'id'}"
                                            PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" PageWidth="850"></zhongsoft:LightObjectSelector>
                                        <input type="hidden" runat="server" id="hiAssessmentPersonId" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
            </table>
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
<table class="tz-table" style="width: 100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('rollInfo')">
            影响的相关卷册计划&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="rollInfo">
        <td colspan="6">
            <uc2:AdjustDetailOfRoll ID="ucAdjustDetailOfRoll" runat="server" />
        </td>
    </tr>
</table>
<!--项目计划活动表主键 -->
<input type="hidden" id="hiPlanActivityOfProjectID" name="PlanActivityOfProjectID"
    runat="server" field="PlanActivityOfProjectID" tablename="EPMS_PlanActivityOfProject" />
<!--项目计划活动表主键 -->
<input type="hidden" id="hiPlanWBSID" name="hiPlanWBSID" runat="server" field="PlanWBSID"
    tablename="EPMS_PlanWBS" />
<!---项目ID-->
<input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server"
    field="OrganizationID" tablename="EPMS_PlanActivityOfProject" />
<!---项目编号-->
<input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目名称-->
<input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目ID-->
<input type="hidden" id="hiWBSOrganizationID" name="hiWBSOrganizationID" runat="server"
    field="OrganizationID" tablename="EPMS_PlanWBS" />
<input type="hidden" runat="server" id="hiPlanState" field="PlanState" tablename="EPMS_PlanActivityOfProject"
    value="1" />
<!---项目类型名称--->
<input type="hidden" runat="server" id="hiProjectType" field="ProjectType" tablename="EPMS_PlanActivityOfProject" />
<!---项目类型Code--->
<input type="hidden" runat="server" id="hiProjectTypeCode" field="ProjectTypeCode"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目类型ID--->
<input type="hidden" runat="server" id="hiParamProjectTypeID" field="ParamProjectTypeID"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目编号-->
<input type="hidden" id="hiWBSProjectCode" name="hiProjectCode" runat="server" field="ProjectCode"
    tablename="EPMS_PlanWBS" />
<!---项目名称-->
<input type="hidden" id="hiWBSProjectName" name="hiProjectName" runat="server" field="ProjectName"
    tablename="EPMS_PlanWBS" />
<!---添加人ID-->
<input type="hidden" id="hiWBSAddUserID" name="hiWBSAddUserID" runat="server" field="AddUserID"
    tablename="EPMS_PlanWBS" />
<!---项目编号-->
<input type="hidden" id="hiWBSAddUserName" name="hiWBSAddUserName" runat="server"
    field="AddUserName" tablename="EPMS_PlanWBS" />
<!---添加人ID-->
<input type="hidden" id="hiAddUserID" name="hiAddUserID" runat="server" field="AddUserID"
    tablename="EPMS_PlanActivityOfProject" />
<!---项目编号-->
<input type="hidden" id="hiAddUserName" name="AddUserName" runat="server" field="AddUserName"
    tablename="EPMS_PlanActivityOfProject" />
<!---设计总工程师ID--->
<input type="hidden" runat="server" id="hiManagerUserID" field="ManagerUserID" tablename="EPMS_PlanActivityOfProject" />
<!---设计总工程师--->
<input type="hidden" runat="server" id="hiManagerUserName" field="ManagerUserName"
    tablename="EPMS_PlanActivityOfProject" />
<!---是否重要计划-->
<input type="hidden" id="hiIsImportant" name="hiIsImportant" runat="server" field="IsImportant"
    tablename="EPMS_PlanWBS" />
<!---表单类型-->
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" field="FormType"
    tablename="EPMS_PlanActivityOfProject" />
<!---年-->
<input type="hidden" id="hiWBSPlanYear" name="hiWBSPlanYear" runat="server" field="PlanYear"
    tablename="EPMS_PlanWBS" />
<!---月-->
<input type="hidden" id="hiWBSPlanMonth" name="hiWBSPlanMonth" runat="server" field="PlanMonth"
    tablename="EPMS_PlanWBS" />
<!---年-->
<input type="hidden" id="hiPlanYear" name="hiPlanYear" runat="server" field="PlanYear"
    tablename="EPMS_PlanActivityOfProject" />
<!---月-->
<input type="hidden" id="hiPlanMonth" name="hiPlanMonth" runat="server" field="PlanMonth"
    tablename="EPMS_PlanActivityOfProject" />
<asp:LinkButton runat="server" ID="lbtnAfterSelectWBS" OnClick="lbtnAfterSelectWBS_Click"
    Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiProjSpeXml" />
<input type="hidden" runat="server" id="hiExeSpecialtyID" />
<script>
  $gridCheckedClientIDSpe = "<%=this.gridView.CheckedClientID %>";

    function adjustActivityOfFile_init() {
        $("[wbsID]").live("blur", function () {
            $(this).val($(this).val());
        });

        var wBSType='<%=IntWBSMode %>';
        if(wBSType=='<% =WBSMode.设备管理.GetHashCode()%>') {
            $('[flag="name"]').each(function(){
                $(this).text($(this).text().replace('资料','设备'));
            });
        }
    }

    //选择主卷/册 筛选条件
    function fileFilter() {
        var orgID = $("#<%=hiOrganizationID.ClientID %>").val();
          //当前登录人在所选项目中担任主设人的专业ID
        var specialtyID = $('#<%=hiExeSpecialtyID.ClientID %>').val();
        var wBSType='<%=IntWBSMode %>';
        if(wBSType==""){
            wBSType='<%=(int)WBSMode.设计接口资料 %>'
        }
        return "{OrganizationID:'" + orgID + "',WBSType:'"+wBSType+"', ExeSpecialtyID: '" + specialtyID + "'}";
    }

    function afterFileSelect() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnAfterSelectWBS, "")%>;
    }
    function afterPlanSpeSelect(re){
      $("#<%=hiProjSpeXml.ClientID %>").val(re);       
       <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnSelProjSpe, "")%>;
    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            var wBSType='<%=IntWBSMode %>';
            if(wBSType=='<% =WBSMode.设备管理.GetHashCode()%>'){
                alert('请先选择项目，再选择设备信息！');
            }
            else{
                alert('请先选择项目，再选择资料信息！');
            }
            return false;
        }
        return true;
    }

    //选择项目专业
    function selProjSpe(){
        var xml = $("#<%=hiProjSpeXml.ClientID %>").val();
        var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
        var json = { ActionFlag: 1, SelectFlag: 1, OrganizationID: orgId };
        var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", json);
        showDivDialog(url, xml, 850, 550, afterPlanSpeSelect);
        return false;
    }

     //批量删除
    function checkBatchDelPlanSpe() {
        if (checkUpdateSpeNumInfo()) {
            if (confirm("您确认要取消吗？")) {
                 <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnDelProjSpe, "")%>;
            }
        }
        return false;
    }

    //判断是否已经勾选了要批量更新时间的任务信息
    function checkUpdateSpeNumInfo() {
        var checkedValue=$("#" + $gridCheckedClientIDSpe).val().length;
          if (checkedValue.length < 36) {
            alert("请勾选取消的专业信息");
            return false;
        }
      
        return true;
    }
       
</script>
