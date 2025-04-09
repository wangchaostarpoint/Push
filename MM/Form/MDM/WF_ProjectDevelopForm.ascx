<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectDevelopForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MDM.WF_ProjectDevelopForm" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" field="ProjectName"
                tablename="MM_MarketInfo" activestatus="(2.填写相关信息)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true"
                Text="选择跟踪项目信息" ResultForControls="{'hiMarketInfoID':'id','hiDMarketInfoID':'id','tbBelongProjectPackage':'BelongProjectPackage',
                'rblBusinessPlate':'ParamBusinessPlateID','hiBusinessPlate':'BusinessPlate',
                'ddlProjectType':'ParamProjectTypeID','hiProjectType':'ProjectType',
                'rblBuildType':'BuildType','tbProjectScale':'ProjectScale','rbIsChurchyard':'IsChurchyard',
                'rblImportantLevel':'ImportantLevel','txtCustomerName':'CustomerName','hiCustomerID':'CustomerID',
                'txtCustomerName_hivalue':'CustomerName','txtEntrustUnitName':'EntrustUnitName','hiEntrustUnitID':'EntrustUnitID',
                'txtEntrustUnitName_hivalue':'EntrustUnitName','txtContacter':'ContacterName','hiContacterID':'ContacterID',
                'txtContacter_hivalue':'ContacterName','txtContacterPhone':'ContacterPhone',
                'cbIsNoContract':'IsNoContract','hiProjectPhaseIDs':'ProjectPhaseIDs','hiEstimateContractVal':'EstimateContractVal',
                'hiProjectInvestment':'ProjectInvestment','tbFundingSource':'FundingSource',
                'tbInvestor':'Investor','tbRiskAndOpportunity':'RiskAndOpportunity',
                'hiProvince':'Province','hiArea':'Area'}"
                PageUrl="~/MM/Obsolete/MarketInfoSelector.aspx" Filter="{TrackingState:'0',ReviewState:'0'}"
                EnableTheming="false" PageWidth="850" Writeable="false" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiMarketInfoID" field="MarketInfoID" tablename="MM_MarketInfo" />
            <input type="hidden" runat="server" id="hiDMarketInfoID" field="MarketInfoID" tablename="MM_ProjectDevelop" />
        </td>
        <td class="td-l">流水号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSerialNumber"
                class="kpms-textbox" activestatus="(23.填写相关信息)" field="SerialNumber"
                tablename="MM_ProjectDevelop">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">工程包<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbBelongProjectPackage" field="BelongProjectPackage"
                req="1" tablename="MM_MarketInfo" activestatus="(23.填写相关信息)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">业务板块<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblBusinessPlate" field="ParamBusinessPlateID" tablename="MM_MarketInfo"
                RepeatDirection="Horizontal" activestatus="(23.填写相关信息)" req="1">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiBusinessPlate" field="BusinessPlate" tablename="MM_MarketInfo" />

        </td>
    </tr>
    <tr>
        <td class="td-l">工程类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" TableName="MM_MarketInfo"
                Field="ParamProjectTypeID" activestatus="(23.填写相关信息)" req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProjectType" field="ProjectType" tablename="MM_MarketInfo" />
        </td>
        <td class="td-l">建设性质<span class="req-star">*</span>
        </td>
        <td class="td-r" style="white-space: nowrap">
            <asp:RadioButtonList runat="server" ID="rblBuildType" field="BuildType" tablename="MM_MarketInfo"
                req="1" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList>
        </td>
        <td class="td-m" colspan="2">
    </tr>
    <tr>
        <td class="td-l">工程规模<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectScale" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                field="ProjectScale" tablename="MM_MarketInfo" activestatus="(23.填写相关信息)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否境内<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="IsChurchyard" tablename="MM_MarketInfo"
                req="1" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)" AutoPostBack="true"
                OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">省份(洲)/市(国家)<span class="req-star">*</span>
        </td>
        <td class="td-r" style="white-space: nowrap">
            <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" activestatus="(23.填写相关信息)"
                AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"
                req="1" Width="35%">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProvince" field="Province" tablename="MM_MarketInfo" />
            <input type="hidden" runat="server" id="hiArea" field="Area" tablename="MM_MarketInfo" />
            <zhongsoft:LightDropDownList ID="ddlArea" runat="server" activestatus="(23.填写相关信息)" field="Area"
                tablename="MM_MarketInfo" req="1" Width="60%">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">重要程度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblImportantLevel" field="ImportantLevel" tablename="MM_MarketInfo"
                req="1" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">建设单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                EnableTheming="false" Text="选择建设单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketInfo"
                req="1" field="CustomerName" activestatus="(23.填写相关信息)" DoCancel="false" Writeable="false" />
            <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                tablename="MM_MarketInfo" />
        </td>
    </tr>
    <tr>
        <td class="td-l">委托单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtEntrustUnitName" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiEntrustUnitID':'id'}"
                EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketInfo"
                req="1" field="EntrustUnitName" activestatus="(23.填写相关信息)" DoCancel="false" Writeable="false" />
            <input type="hidden" id="hiEntrustUnitID" name="hiEntrustUnitID" runat="server" field="EntrustUnitID"
                tablename="MM_MarketInfo" />
        </td>
    </tr>
    <tr>
        <td class="td-l">联系人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContacter" IsMutiple="false"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.填写相关信息)" SourceMode="SelectorPage"
                ResultForControls="{ 'hiContacterID':'id','txtContacterPhone':'Phone'}" ShowJsonRowColName="true"
                FilterFunction="contacteFilter()" ResultAttr="name" ShowAttrs="name,UserCode"
                PageUrl="../../Obsolete/CustomerContactSelector.aspx" req="1" field="ContacterName"
                DoCancel="false" tablename="MM_MarketInfo"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiContacterID" name="hiContacterID" runat="server" field="ContacterID"
                tablename="MM_MarketInfo" />
        </td>
        <td class="td-l">联系人电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContacterPhone"
                req="1" class="kpms-textbox" activestatus="(23.填写相关信息)" field="ContacterPhone"
                tablename="MM_MarketInfo">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">承办人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtUndertakeUserName" readonly="readonly"
                req="1" class="kpms-textbox" activestatus="(23.填写相关信息)" field="UndertakeUserName"
                tablename="MM_ProjectDevelop">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiUndertakeUserID" runat="server" field="UndertakeUserID"
                tablename="MM_ProjectDevelop" />
        </td>
    </tr>
    <tr>
        <td class="td-l">评审方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblCheckMode" field="CheckMode" tablename="MM_ProjectDevelop"
                req="1" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">负责部门
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtDutyDeptName" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiDutyDeptID':'id'}" EnableTheming="false"
                Text="选择负责部门" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写相关信息)"
                TableName="MM_ProjectDevelop" field="DutyDeptName" />
            <input type="hidden" runat="server" id="hiDutyDeptID" tablename="MM_ProjectDevelop"
                field="DutyDeptID" />
        </td>
        <td class="td-l">无合同</td>
        <td class="td-r">
            <asp:CheckBox runat="server" ID="cbIsNoContract" activestatus="(23.填写相关信息)" field="IsNoContract"
                tablename="MM_MarketInfo" /></td>
    </tr>
    <%--    <tr>
        <td class="td-l">参与部门
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtJoinDeptNames" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiReviewDeptIDs':'id'}" EnableTheming="false"
                Text="选择参与部门" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写相关信息)"
                TableName="MM_ProjectDevelop" field="JoinDeptNames" />
            <input type="hidden" runat="server" id="hiJoinDeptIDs" tablename="MM_ProjectDevelop"
                field="JoinDeptIDs" />
        </td>
    </tr>--%>
    <tr>
        <td class="flexible" colspan="6">
            <span>会签部门</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span1" runat="server" displaystatus="(3.填写相关信息)">
                <asp:LinkButton runat="server" ID="lbtnSelJoinDept" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="选择会签部门" width="16"
                            height="16" />选择会签部门</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvDeptOpinion" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="DeptOpinionID" OnRowCommand="gvDeptOpinion_RowCommand" OnRowDataBound="gvDeptOpinion_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="DeptName" HeaderText="会签部门">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PutUserName" HeaderText="会签人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="是否同意<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rblIsAgree" RepeatDirection="Horizontal" req="1">
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="部门意见">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbOpinion" Text='<%#Eval("Opinion") %>' maxText="100"
                                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="2"></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiDeptID" value='<%#Eval("DeptID") %>' />
                            <input type="hidden" runat="server" id="hiDeptOpinionID" value='<%#Eval("DeptOpinionID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                CommandArgument='<%# Eval("DeptOpinionID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">委托类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblDelegateType" field="DelegateType" tablename="MM_ProjectDevelop"
                req="1" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">工程阶段<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.填写相关信息)"
                RepeatDirection="Horizontal" req="1">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiProjectPhaseIDs" field="ProjectPhaseIDs" tablename="MM_MarketInfo" />
            <input type="hidden" runat="server" id="hiProjectPhaseNames" field="ProjectPhaseNames" tablename="MM_MarketInfo" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工程计划开始时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanStartTime" runat="server" activestatus="(23.填写相关信息)" req="1"
                class="kpms-textbox-date" readonly="readonly" field="PlanStartTime" tablename="MM_MarketInfo">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">工程计划完成时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanFinishTime" runat="server" activestatus="(23.填写相关信息)" req="1"
                class="kpms-textbox-date" readonly="readonly" field="PlanFinishTime" tablename="MM_MarketInfo">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l" flag="cPlanFinishTime" style="display: none">初设计划完成时间<span class="req-star">*</span>
        </td>
        <td class="td-r" flag="cPlanFinishTime" style="display: none">
            <zhongsoft:XHtmlInputText ID="txtCPlanFinishTime" runat="server" activestatus="(23.填写相关信息)"
                class="kpms-textbox-date" readonly="readonly" field="CPlanFinishTime" tablename="MM_MarketInfo">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-m" colspan="2" flag="cNoPlanFinishTime"></td>
    </tr>

    <tr>
        <td class="td-l">预估合同额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbEstimateContractVal" EnableTheming="false" req="1"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.填写相关信息)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiEstimateContractVal" field="EstimateContractVal"
                tablename="MM_MarketInfo" />
        </td>
        <td class="td-l">项目投资（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectInvestment" EnableTheming="false"
                CssClass="kpms-textbox-money" DataType="Decimal2" req="1" activestatus="(23.填写相关信息)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiProjectInvestment" field="ProjectInvestment"
                tablename="MM_MarketInfo" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr flag="international">
        <td class="td-l">资金来源
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbFundingSource" field="FundingSource"
                tablename="MM_MarketInfo" activestatus="(23.填写相关信息)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">投资方
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbInvestor" field="Investor"
                tablename="MM_MarketInfo" activestatus="(23.填写相关信息)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">项目风险与机遇<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRiskAndOpportunity" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                field="RiskAndOpportunity" tablename="MM_MarketInfo" activestatus="(23.填写相关信息)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l">进度要求<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbScheduleRequest" runat="server" TextMode="MultiLine" MaxLength="1024" reqflag="delegate"
                field="ScheduleRequest" tablename="MM_ProjectDevelop" activestatus="(23.填写相关信息)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l">主要工作范围<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMainWorkScope" runat="server" TextMode="MultiLine" MaxLength="1024" reqflag="delegate"
                field="MainWorkScope" tablename="MM_ProjectDevelop" activestatus="(23.填写相关信息)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l" rowspan="4">评审要点
        </td>
        <td class="td-l">项目规模及要求在我院资质范围之内<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rblIsWithinQualify" field="IsWithinQualify" tablename="MM_ProjectDevelop"
                reqflag="delegate" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList></td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l">项目内容符合政策法律法规<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rblIsMeetLawRegulation" field="IsMeetLawRegulation" tablename="MM_ProjectDevelop"
                reqflag="delegate" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList></td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l">项目符合我院的项目发展策略<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rblIsMeetDevelop" field="IsMeetDevelop" tablename="MM_ProjectDevelop"
                reqflag="delegate" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList></td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l">项目是否在我院的能力和资源范围之内<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="4">
            <asp:RadioButtonList runat="server" ID="rblIsWithinAbility" field="IsWithinAbility" tablename="MM_ProjectDevelop"
                reqflag="delegate" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList></td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l">其他
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOtherDescription" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="OtherDescription" tablename="MM_ProjectDevelop" activestatus="(23.填写相关信息)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr delegateflag="delegate">
        <td class="td-l">是否承接项目<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblIsUndertake" field="IsUndertake" tablename="MM_ProjectDevelop"
                reqflag="delegate" RepeatDirection="Horizontal" activestatus="(23.汇总意见)(23.批准)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr delegateflag="tender">
        <td class="td-l">投标类别<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblTenderType" field="TenderType" tablename="MM_ProjectDevelop"
                reqflag="tender" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">投标编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="lbTenderNumber" ToolTip="保存自动生成"
                reqflag="tender" class="kpms-textbox" activestatus="(23.填写相关信息)" field="TenderNumber"
                tablename="MM_ProjectDevelop">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr delegateflag="tender">
        <td class="td-l">投标性质<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblTenderNature" field="TenderNature" tablename="MM_ProjectDevelop"
                reqflag="tender" RepeatDirection="Horizontal" activestatus="(23.填写相关信息)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">开标日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBinOpenDate" runat="server" activestatus="(23.填写相关信息)"
                class="kpms-textbox-date" readonly="readonly" field="BinOpenDate" tablename="MM_ProjectDevelop">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr delegateflag="tender">
        <td class="td-l">投标限价（万元）
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbBidLimitPrice" EnableTheming="false"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.填写相关信息)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiBidLimitPrice" field="BidLimitPrice"
                tablename="MM_ProjectDevelop" />
        </td>
        <td class="td-l">投标保证金（万元）
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbBidBond" EnableTheming="false"
                CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.填写相关信息)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiBidBond" field="BidBond"
                tablename="MM_ProjectDevelop" />
        </td>
        <td class="td-l">是否已归还</td>
        <td class="td-r">
            <asp:CheckBox runat="server" ID="cbIsReturn" activestatus="(23.填写相关信息)" field="IsReturn"
                tablename="MM_ProjectDevelop" /></td>
    </tr>
    <tr>
        <td class="flexible" colspan="6" delegateflag="tender">
            <span>招标机构信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr delegateflag="tender">
        <td colspan="6">
            <span style="float: right;" id="spAdd" runat="server" displaystatus="(3.填写相关信息)">
                <asp:LinkButton runat="server" ID="lbtnSelBidOrgInfo" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="选择招标机构" width="16"
                            height="16" />选择招标机构</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr delegateflag="tender">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvBidOrgInfo" runat="server" UseDefaultDataSource="true"
                DataKeyNames="BidOrgInfoID" OnRowCommand="gvBidOrgInfo_RowCommand">
                <Columns>
                    <zhongsoft:LightBoundField DataField="BidOrgName" HeaderText="招标机构">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="Contacter" HeaderText="联系人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ContactPhone" HeaderText="联系人电话">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("BidOrgInfoID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr delegateflag="tender">
        <td class="td-l">招标内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTenderContent" runat="server" TextMode="MultiLine" MaxLength="1024"
                reqflag="tender" field="TenderContent" tablename="MM_ProjectDevelop" activestatus="(23.填写相关信息)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr delegateflag="tender">
        <td class="td-l">是否投标<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblIsToTender" field="IsToTender" tablename="MM_ProjectDevelop"
                reqflag="tender" RepeatDirection="Horizontal" activestatus="(23.汇总意见)(23.批准)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" MaxLength="1024"
                field="Memo" tablename="MM_ProjectDevelop" activestatus="(23.填写相关信息)" CssClass="kpms-textarea"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input runat="server" type="hidden" id="hiProjectDevelopID" tablename="MM_ProjectDevelop"
    field="ProjectDevelopID" />
<input runat="server" type="hidden" id="hiReviewState" tablename="MM_MarketInfo"
    field="ReviewState" />
<input type="hidden" runat="server" id="hiBidOrgInfo" />
<asp:Button runat="server" ID="btnBidOrgInfo" OnClick="btnBidOrgInfo_Click" Style="display: none" />

<input type="hidden" runat="server" id="hiJoinDept" />
<asp:Button runat="server" ID="btnJoinDept" OnClick="btnJoinDept_Click" Style="display: none" />
<script type="text/javascript">
    function initCustomerPlugin() {
        setDelegateInfo();
        $('#<%=rblDelegateType.ClientID %>').live('change', function () {
            setDelegateInfo();
        });

        setInternational();
        $('#<%=rblBusinessPlate.ClientID %>').live('change', function () {
            setInternational();
        });

        $("#<%=this.tbFundingSource.ClientID %>").autocomplete({
            source: function (request, response) {
                $.getJSON("<%=WebAppPath %>/JsonSelectorHandler.ashx", {
                    term: request.term + ',fundingsource'
                }, response);
            },
            minLength: 1,
            select: function (event, ui) {
                if (ui.item) {
                    $("#<%=tbFundingSource.ClientID %>").attr("value", ui.item.value);
                }
            }
        });

        setCPlanInfo();
        $('#<%=cblProjectPhases.ClientID %>').live('change', function () {
            setCPlanInfo();
        });
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($('#<%=gvDeptOpinion.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                alert('请先选择会签部门！');
                return false;
            }
        }
        return true;
    }

    //联系人选择筛选
    function contacteFilter() {
        var customerID = $("#<%=hiCustomerID.ClientID %>").val();
        return "{CustomerID:'" + customerID + "'}";
    }

    function setInternational() {
        var businessPlate = $("#<%=rblBusinessPlate.ClientID %> input[type='radio']:checked").val();
        if (businessPlate == "3") {
            $('[flag = "international"]').show();
        }
        else {
            $('[flag = "international"]').hide();
        }
    }

    //设置委托类型相关信息
    function setDelegateInfo() {
        var delegateValue = $("#<%=rblDelegateType.ClientID %> input[type='radio']:checked").val();
        if (delegateValue == "<%=DelegateType.委托项目.ToString()%>") {
            $('[delegateflag = "delegate"]').show();
            $('[reqflag = "delegate"]').attr("req", "1");
            $('[delegateflag = "tender"]').hide();
            $('[reqflag = "tender"]').removeAttr("req");
        }
        else if (delegateValue == "<%=DelegateType.投标项目.ToString()%>") {
            $('[delegateflag = "delegate"]').hide();
            $('[reqflag = "delegate"]').removeAttr("req");
            $('[delegateflag = "tender"]').show();
            $('[reqflag = "tender"]').attr("req", "1");
        }
        else {
            $('[delegateflag = "delegate"]').hide();
            $('[reqflag = "delegate"]').removeAttr("req");
            $('[delegateflag = "tender"]').hide();
            $('[reqflag = "tender"]').removeAttr("req");
        }
    }

    $('#<%=lbtnSelBidOrgInfo.ClientID %>').live('click', function () {
        selBidOrgInfo();
    });

    //选择招标机构信息
    function selBidOrgInfo() {
        var param = new InputParamObject("m");
        getDivCustomer('<%=hiBidOrgInfo.ClientID %>', param, null, bindBidOrg);
        return false;
    }

    function bindBidOrg() {
        $("#<%=btnBidOrgInfo.ClientID %>").click();
    }

    $('#<%=lbtnSelJoinDept.ClientID %>').live('click', function () {
        selJoinDept();
    });

    //选择参与部门
    function selJoinDept() {
        var param = new InputParamObject("m");
        getTreeOrgs('<%=hiJoinDept.ClientID %>', param, null, bindJoinDept);
        return false;
    }

    function bindJoinDept() {
        $("#<%=btnJoinDept.ClientID %>").click();
    }

    //勾选初设阶段才展示初设计划时间
    function setCPlanInfo() {
        $('[flag = "cPlanFinishTime"]').hide();
        $('[flag = "cNoPlanFinishTime"]').show();
        $("#<%=txtCPlanFinishTime.ClientID %>").removeAttr("req");
        $('#<%=cblProjectPhases.ClientID %>').find("input[type='checkbox']:checked").each(function () {
            sValue = $(this).parent().attr("phaseID");
            if (sValue.match("C")) {
                $('[flag = "cPlanFinishTime"]').show();
                $('[flag = "cNoPlanFinishTime"]').hide();
                $("#<%=txtCPlanFinishTime.ClientID %>").attr("req", "1")
                return;
            }
        })
    }

</script>
