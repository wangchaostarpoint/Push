<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCMarketAwardCheck.ascx.cs" Inherits="Zhongsoft.Portal.MM.UI.Controls.UCMarketAwardCheck" %>

<table class="tz-table">
    <tr>
        <td class="td-l">工程名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtMarketProjectName" runat="server" readonly="readonly" class="kpms-textbox"
                activestatus="(23.*)(23.经营管理岗提交)" field="MarketProjectName" tablename="MM_MarketAwardCheck" />
        </td>
        <td class="td-m" colspan="2"><a class="aStyle" id="aMarketInfo" runat="server" onclick="viewMarketInfo()">点击查看工程详细</a></td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectName" EnableTheming="false" req="1" field="ProjectName"
                tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.下达项目立项通知)">
            </zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiProjectCode" field="ProjectCode" tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">建设地点<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectPlace" EnableTheming="false" req="1" field="ProjectPlace"
                tablename="EPMS_ProjectEntity" CssClass="kpms-textbox" activestatus="(23.*)(23.下达项目立项通知)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">客户信息
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                EnableTheming="false" PageWidth="850" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_ProjectEntity"
                field="CustomerName" activestatus="(23.*)(23.下达项目立项通知)" DoCancel="false" Writeable="false" />
            <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工程类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <%-- <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" TableName="EPMS_ProjectEntity"
                Field="ParamProjectTypeID" activestatus="(23.*)(23.下达项目立项通知)" req="1">
            </zhongsoft:LightDropDownList>--%>
            <zhongsoft:XHtmlInputText ID="txtProjectType" runat="server" readonly="readonly" class="kpms-textbox"
                activestatus="(23.*)(23.下达项目立项通知)" field="ProjectType" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiParamProjectTypeID" field="ParamProjectTypeID" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiProjectTypeCode" field="ProjectTypeCode" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l">设计阶段<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiParamPhaseID" field="ParamPhaseID" tablename="EPMS_ProjectEntity" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlParamPhaseID" TableName="EPMS_ProjectEntity"
                AutoPostBack="true" OnSelectedIndexChanged="ddlParamPhaseID_SelectedIndexChanged"
                req="1" Field="ParamPhaseID" activestatus="(23.*)(23.下达项目立项通知)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiPhaseCode" field="PhaseCode" tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiPhaseName" field="PhaseName" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">电压等级
        </td>
        <td class="td-r" style="white-space: nowrap">
            <zhongsoft:XHtmlInputText ID="txtVoltageGrade" runat="server" readonly="readonly" class="kpms-textbox-money"
                activestatus="(23.*)(23.下达项目立项通知)" field="VoltageGrade" tablename="EPMS_ProjectEntity" />
            kV
        </td>
        <td class="td-l">装机容量
        </td>
        <td class="td-r" style="white-space: nowrap">
            <zhongsoft:XHtmlInputText ID="txtInstalledCapacity" runat="server" readonly="readonly" class="kpms-textbox-money"
                activestatus="(23.*)(23.下达项目立项通知)" field="InstalledCapacity" tablename="EPMS_ProjectEntity" />
            MW
        </td>
        <td colspan="2" class="td-m"></td>
    </tr>
    <tr>
        <td class="td-l">财务流水号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFinancialSerialNum" runat="server" readonly="readonly" class="kpms-textbox-money"
                activestatus="(23.*)(23.下达项目立项通知)" field="FinancialSerialNum" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l">阶段估算产值(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEstimateContractVal" runat="server" readonly="readonly" class="kpms-textbox-money"
                activestatus="(23.*)(23.下达项目立项通知)" />
            <input type="hidden" runat="server" id="hiEstimateContractVal" field="EstimateContractVal" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l">阶段合同产值(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractValue" runat="server" readonly="readonly" class="kpms-textbox-money"
                activestatus="(23.*)(23.下达项目立项通知)" />
            <input type="hidden" runat="server" id="hiContractValue" field="ContractValue" tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">规模
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectScale" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="ProjectScale" tablename="EPMS_ProjectEntity" activestatus="(23.*)(23.下达项目立项通知)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">工程类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectLevel" TableName="EPMS_ProjectEntity"
                Field="ProjectLevel" activestatus="(23.*)(23.下达项目立项通知)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">是否紧急<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblIsUrgentProject" RepeatDirection="Horizontal" TableName="EPMS_ProjectEntity"
                Field="IsUrgentProject" activestatus="(23.*)(23.下达项目立项通知)" req="1">
            </asp:RadioButtonList>
            <%-- <zhongsoft:LightDropDownList runat="server" ID="ddlIsUrgentProject" TableName="EPMS_ProjectEntity"
                Field="IsUrgentProject" activestatus="(23.*)(23.下达项目立项通知)" req="1">
            </zhongsoft:LightDropDownList>--%>
        </td>
        <td class="td-l">是否创优工程<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblIsExcellentProj" RepeatDirection="Horizontal" TableName="EPMS_ProjectEntity"
                Field="IsExcellentProj" activestatus="(23.*)(23.下达项目立项通知)" req="1">
            </asp:RadioButtonList>
            <%--            <asp:CheckBox ID="cbIsExcellentProj" activestatus="(23.*)(23.下达项目立项通知)" runat="server" field="IsExcellentProj" tablename="EPMS_ProjectEntity"></asp:CheckBox>--%>
        </td>
    </tr>
    <tr>
        <td class="td-l">设总<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtManagerUserName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.*)(23.下达项目立项通知)" SourceMode="SelectorPage"
                ResultForControls="{ 'hiManagerUserID':'id','hiManagerUserCode':'LoginId','hiManagerDeptName':'DEPTNAME'}" ShowJsonRowColName="true"
                ResultAttr="name" ShowAttrs="name" BeforeSelect="beforeSelChief()" FilterFunction="checkChiefEngineerFilter()"
                PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" req="1" field="ManagerUserName" PageHeight="600" PageWidth="850"
                DoCancel="false" tablename="EPMS_ProjectEntity"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiManagerUserID" name="hiManagerUserID" runat="server" field="ManagerUserID"
                tablename="EPMS_ProjectEntity" />
            <input type="hidden" id="hiManagerUserCode" name="hiManagerUserCode" runat="server" field="ManagerUserCode"
                tablename="EPMS_ProjectEntity" />
            <input type="hidden" id="hiManagerDeptName" name="hiManagerDeptName" runat="server" field="ManagerDeptName"
                tablename="EPMS_ProjectEntity" />
            <input type="hidden" runat="server" id="hiChiefEngineerRoleID" />
        </td>
        <td class="td-l">工程涉及专业
        </td>
        <td class="td-m" colspan="3" style="white-space: nowrap">
            <asp:CheckBoxList runat="server" ID="cblRelateMajors" activestatus="(23.*)(23.下达项目立项通知)"
                RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiRelateMajors" tablename="EPMS_ProjectEntity" field="RelateMajors" />
        </td>
    </tr>
    <tr>
        <td class="td-l">计划开始时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanStartDate" runat="server" activestatus="(23.*)(23.下达项目立项通知)" req="1"
                class="kpms-textbox-comparedate" compare="1" readonly="readonly" field="PlanStartDate" tablename="EPMS_ProjectEntity">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">计划完成时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanCompleteDate" runat="server" activestatus="(23.*)(23.下达项目立项通知)"
                class="kpms-textbox-comparedate" compare="1" readonly="readonly" field="PlanCompleteDate" tablename="EPMS_ProjectEntity">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">实际开始时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFactStartDate" runat="server" activestatus="(23.?)"
                class="kpms-textbox-comparedate" compare="2" readonly="readonly" field="FactStartDate" tablename="EPMS_ProjectEntity">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">实际完成时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFactCompleteDate" runat="server" activestatus="(23.?)"
                class="kpms-textbox-comparedate" compare="2" readonly="readonly" field="FactCompleteDate" tablename="EPMS_ProjectEntity">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">设计范围
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDesignRange" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="DesignRange" tablename="EPMS_ProjectEntity" activestatus="(23.*)(23.下达项目立项通知)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">轮廓进度
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOutlineProgress" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="OutlineProgress" tablename="EPMS_ProjectEntity" activestatus="(23.*)(23.下达项目立项通知)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">估工总工日
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbEstimateWorkday" EnableTheming="false" field="EstimateWorkday"
                tablename="EPMS_ProjectEntity" CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.*)(23.下达项目立项通知)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">项目状态<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectState" TableName="EPMS_ProjectEntity"
                Field="ProjectState" activestatus="(23.*)(23.下达项目立项通知)" req="1">
            </zhongsoft:LightDropDownList></td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>产值计列部门</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span3" runat="server" displaystatus="(3.*)(3.下达项目立项通知)">
                <asp:LinkButton runat="server" ID="lbtnSelDept" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="选择部门" width="16"
                            height="16" />选择部门</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
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
</table>
<!-- 主键-->
<input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProjectEntity" field="OrganizationID" />
<input type="hidden" runat="server" id="hiParamBusinessPlateID" tablename="EPMS_ProjectEntity" field="ParamBusinessPlateID" />
<input type="hidden" runat="server" id="hiBusinessPlate" tablename="EPMS_ProjectEntity" field="BusinessPlate" />
<input type="hidden" runat="server" id="hiIsAbroad" tablename="EPMS_ProjectEntity" field="IsAbroad" />
<input type="hidden" runat="server" id="hiDeptXML" />
<asp:Button runat="server" ID="btnBindDept" OnClick="btnBindDept_Click" Style="display: none" />
<script type="text/javascript">
    $('#<%=lbtnSelDept.ClientID %>').live('click', function () {
        selDept();
    });

    //选择部门
    function selDept() {
        var param = new InputParamObject("m");
        getTreeOrgs('<%=hiDeptXML.ClientID %>', param, null, bindDept);
        return false;
    }

    function bindDept() {
        $("#<%=btnBindDept.ClientID %>").click();
    }

    //部门比例之和要求100
    function checkRate() {
        if ($('#<%=gvList.ClientID %>')[0].rows[1].cells[0].innerText != "没有要查找的数据") {
            var total = 0;
            $('[flag="deptValue"]').each(function () {
                var value = $(this).val();
                if (value != '' && value != undefined) {
                    value = parseFloat(value);
                    total += value;
                }
            });
            if (total != 100) {
                alert("计列部门比例之和要求为100%");
                return false;
            }
        }
        else {
            alert("请先选择产值计列部门");
            return false;
        }
        return true;
    }
    //设总筛选
    function checkChiefEngineerFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var roleID = $('#<%=hiChiefEngineerRoleID.ClientID %>').val();
        var level = $('#<%=ddlProjectLevel.ClientID%>').val();
        var projectLevel = "";
        if (level == "Ⅰ类工程") {
            projectLevel = "Ⅰ类工程";
        }
        else {
            projectLevel = "Ⅱ、Ⅲ类工程";
        }
        return "{OrganizationID:'" + orgId + "',RoleID:'" + roleID + "',IsQualiticByRole:'1',IsShowMore:'1',QualificationName:'" + projectLevel + "设总'}";
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

    $('#<%=ddlProjectLevel.ClientID%>').live("change", function () {
        $('#<%=txtManagerUserName.ClientID%>').val("");
        $('#<%=hiManagerUserCode.ClientID%>').val("");
        $('#<%=hiManagerDeptName.ClientID%>').val("");
        $('#<%=hiManagerUserID.ClientID%>').val("");
    })
</script>
