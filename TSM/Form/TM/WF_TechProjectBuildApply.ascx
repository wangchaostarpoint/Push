<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TechProjectBuildApply.ascx.cs"
    Inherits="Zhongsoft.Portal.TSM.Form.TM.WF_TechProjectBuildApply" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="tz-table" width="80%">
    <tr>
        <td class="td-l">申请年度<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:LightDropDownList ID="ddlYear" runat="server" CssClass="kpms-ddl" Field="Year"
                TableName="TSM_SciTechProjectBuildForm" req="1" ActiveStatus="(2.提出项目申请书)" Width="90px">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">申报部门<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="2">
            <zhongsoft:XHtmlInputText ID="tbReportDeptName" runat="server" class="kpms-textbox"
                Field="ReportDeptName" Tablename="TSM_SciTechProjectBuildForm" readonly="readonly"
                style="width: 80%" req="1" ActiveStatus="(2.提出项目申请书)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiReportDeptID" field="ReportDeptID" tablename="TSM_SciTechProjectBuildForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人
        </td>
        <td class="td-r" colspan="2">
            <zhongsoft:XHtmlInputText ID="tbScienceManagerName" runat="server" class="kpms-textbox"
                Field="ScienceManagerName" Tablename="TSM_SciTechProjectBuildForm" readonly="readonly"
                style="width: 80%" req="1" ActiveStatus="(2.提出项目申请书)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiScienceManagerID" field="ScienceManagerID"
                tablename="TSM_SciTechProjectBuildForm" />
            <input type="hidden" runat="server" id="hiSRPMProjectType" field="SRPMProjectType"
                tablename="TSM_SciTechProjectBuildForm" value="A" />
        </td>
        <td class="td-l">申报时间<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="2">
            <zhongsoft:XHtmlInputText ID="tbApplyDate" runat="server" Field="ReportDate" Tablename="TSM_SciTechProjectBuildForm"
                readonly="readonly" class="kpms-textbox-date" req="1" ActiveStatus="(2.提出项目申请书)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr class="flexible" onclick="openDetail('trRelProject')" id="trOpen">
        <td class="kpms-rollist-hand" style="font-weight: bold; text-align: left">项目基本信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trRelProject" style="display: none">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td class="td-l">申请编号<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbApplyCode" runat="server" readonly="readonly" class="kpms-textbox"
                            Field="ApplyCode" TableName="SRPM_ProjectListOfWF" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">申请日期<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbApplyDateWF" runat="server" readonly="readonly" class="kpms-textbox-date"
                            Field="ApplyDate" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目名称<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" Field="ProjectName" TableName="SRPM_ProjectListOfWF"
                            Width="80%" CssClass="kpms-textbox" maxtext="128" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">计划起止日期<span class="req-star">*</span>
                    </td>
                    <td class="td-m" nowrap="nowrap">
                        <zhongsoft:XHtmlInputText ID="tbPlanStartDate" runat="server" readonly="readonly"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" class="kpms-textbox-comparedate"
                            compare="2" Field="PlanStartDate" TableName="SRPM_ProjectListOfWF">
                        </zhongsoft:XHtmlInputText>
                        至
                        <zhongsoft:XHtmlInputText ID="tbPlanEndDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" compare="2" Field="PlanEndDate" TableName="SRPM_ProjectListOfWF">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">立项年度<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightDropDownList ID="ddlProjectYear" runat="server" CssClass="kpms-ddl"
                            Width="70px" Field="ProjectYear" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">承担部门 <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsHostDept" PageUrl="~/Sys/OrgUsers/OrgTreeSelector.aspx"
                            ResultForControls="{'hiProjectDeptID':'id'}" ResultAttr="att2" ActiveStatus="(23.提出项目申请书)(3.立项修改)"
                            PageHeight="560" PageWidth="500" field="ProjectDeptName" tablename="SRPM_ProjectListOfWF"
                            req="1" SelectPageMode="Dialog" FilterFunction="filterHostDeptFuc()" CssClass="kpms-textbox"
                            EnableTheming="false" />
                        <input type="hidden" runat="server" id="hiProjectDeptID" field="ProjectDeptID" tablename="SRPM_ProjectListOfWF" />
                    </td>
                    <td class="td-l">参与部门
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightObjectSelector runat="server" ID="ltbSignDept" activestatus="(23.提出项目申请书)(3.立项修改)"
                            SourceMode="SelectorPage" SelectPageMode="Dialog" ShowJsonRowColName="true" EnableTheming="false"
                            field="CooperateDepts" tablename="SRPM_ProjectListOfWF" TextBoxMode="SingleLine"
                            Writeable="false" ShowAttrs="name" Height="20" IsMutiple="true" PageUrl="~/Sys/OrgUsers/OrgTreeSelector.aspx"
                            PageHeight="600" PageWidth="550" ResultAttr="att2" reqmsg="请填写参与部门" ResultForControls="{'hiCooperateDeptids':'id'}"></zhongsoft:LightObjectSelector>
                        <input type="hidden" id="hiCooperateDeptids" runat="server" field="CooperateDeptIDs"
                            tablename="SRPM_ProjectListOfWF" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">所属技术领域<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList ID="ddlTechnologyArea" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="TechnologyArea" TableName="SRPM_ProjectListOfWF" req="1"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td class="td-l">技术来源 <span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightDropDownList ID="ddlTechnologySource" runat="server" CssClass="kpms-ddl"
                            Width="90px" Field="TechnologySource" TableName="SRPM_ProjectListOfWF" req="1"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目活动类型 <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList ID="ddllProjectBigClass" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="ProjectBigClassName" TableName="SRPM_ProjectListOfWF" req="1"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td class="td-l">创新类型<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightDropDownList ID="ddlInnovateClass" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="InnovateClass" TableName="SRPM_ProjectListOfWF" req="1"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">立项级别 <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList ID="ddlProjectLevel" runat="server" CssClass="kpms-ddl"
                            Field="ProjectLevel" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)"
                            AutoPostBack="false" OnSelectedIndexChanged="ddlProjectLevel_SelectedIndexChanged"
                            Width="120px">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td class="td-l" id="trLevelName" runat="server">外部立项来源<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="3" id="trLevelSource" runat="server">
                        <zhongsoft:LightTextBox ID="tbProjectLevelSource" runat="server" Field="ProjectLevelSource"
                            TableName="SRPM_ProjectListOfWF" Width="95.5%" CssClass="kpms-textbox" maxtext="55"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="trLeveTrack" runat="server">
                    <td class="td-l">跟踪人 <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsUserName" PageUrl="~/Sys/OrgUsers/UserSelector.aspx"
                            ResultForControls="{'hiTrackPeopleID':'id'}" ResultAttr="name" ActiveStatus="(23f.提出项目申请书)(3.立项修改)"
                            PageHeight="600" PageWidth="600" field="TrackPeopleName" tablename="SRPM_ProjectListOfWF"
                            req="1" SelectPageMode="Dialog" CssClass="kpms-textbox" EnableTheming="false" />
                        <input type="hidden" runat="server" id="hiTrackPeopleID" tablename="SRPM_ProjectListOfWF"
                            field="TrackPeopleID" />
                    </td>
                    <td class="td-l">跟踪时间<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbTrackPeopleDate" runat="server" readonly="readonly"
                            class="kpms-textbox-date" Field="TrackPeopleDate" TableName="SRPM_ProjectListOfWF"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">审查结果<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightDropDownList ID="ddlExaminationType" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="ExaminationType" TableName="SRPM_ProjectListOfWF" req="1"
                            ActiveStatus="(3.符合性审查)(3.审查)">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: left">预期技术水平
                    </td>
                </tr>
                <tr>
                    <td class="td-l">创新性 <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList ID="ddlInnovate" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="Innovate" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td class="td-l">先进性<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightDropDownList ID="ddlAdvanced" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="Advanced" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">预期技术标准制定 <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList ID="ddlExpectedTechStandards" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="ExpectedTechStandards" TableName="SRPM_ProjectListOfWF"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td class="td-l">是否产学研项目<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightDropDownList ID="ddlISScientific" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="ISScientific" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                            <asp:ListItem Value="">请选择</asp:ListItem>
                            <asp:ListItem Value="是">是</asp:ListItem>
                            <asp:ListItem Value="否">否</asp:ListItem>
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目现处阶段 <span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList ID="ddlTechPhase" runat="server" CssClass="kpms-ddl"
                            Width="100px" Field="TechPhase" TableName="SRPM_ProjectListOfWF" req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td class="td-l"></td>
                    <td class="td-r" colspan="3"></td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: left">预期知识产权
                    </td>
                </tr>
                <tr>
                    <td class="td-l">获得国外发明专利
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbForeignPatents" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="ForeignPatents" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">国内发明专利
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="tbDomesticPatents" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="DomesticPatents" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">其它
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbOtherNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="OtherNum" TableName="SRPM_ProjectListOfWF" regex="^\d+$"
                            errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l"></td>
                    <td class="td-r" colspan="3"></td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: left">项目已有知识产权情况
                    </td>
                </tr>
                <tr>
                    <td class="td-l">已获发明专利数
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbGetPatentNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="GetPatentNum" TableName="SRPM_ProjectListOfWF" regex="^\d+$"
                            errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">正在申请发明专利
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="tbApplyPatentNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="ApplyPatentNum" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">已获实用新型专利数
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbGetPracticalNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="GetPracticalNum" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">正在申请实用新型专利数
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="tbAppGetPracticalNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="AppGetPracticalNum" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="trProjectTeam1" runat="server">
                    <td class="td-l">项目组人数
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbProjectTeamNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="ProjectTeamNum" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l"></td>
                    <td class="td-r" colspan="3"></td>
                </tr>
                <tr id="trProjectTeam2" runat="server">
                    <td class="td-l">高级
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbSeniorNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="SeniorNum" TableName="SRPM_ProjectListOfWF" regex="^\d+$"
                            errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">中级
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="tbMediumNum" runat="server" CssClass="kpms-textbox-money"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)" EnableTheming="false" Field="MediumNum" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="trProjectTeam3" runat="server">
                    <td class="td-l">初级
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbPrimaryNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="PrimaryNum" TableName="SRPM_ProjectListOfWF" regex="^\d+$"
                            errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">其它
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="tbGraduateStuNum" runat="server" CssClass="kpms-textbox-money"
                            EnableTheming="false" Field="GraduateStuNum" TableName="SRPM_ProjectListOfWF"
                            regex="^\d+$" errmsg="-请输入整数" maxtext="5" ActiveStatus="(23.提出项目申请书)(3.立项修改)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-m" colspan="2" height="25" style="font-weight: bold; text-align: left">预期成果
                    </td>
                    <td colspan="4">
                        <asp:CheckBoxList ID="cblExpectedResults" runat="server" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: left">项目简介(主要研究内容,主要技术经济等指标)限600字:
                    </td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6">
                        <input type="hidden" runat="server" id="hiProjectProfile" field="ProjectProfile" tablename="SRPM_ProjectListOfWF" />
                        <zhongsoft:LightTextBox runat="server" ID="tbProjectProfileNode" field="ProjectProfileNode" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="600" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="150px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="trCooperativeUnit" runat="server">
                    <td class="td-m" colspan="6" style="border-right: none;">
                        <b>合作单位</b>
                    </td>
                </tr>
                <tr>
                    <td class="td-r" style="border-left: none; text-align: right;" colspan="6">
                        <asp:Button runat="server" ID="btnSure" Text="添加" OnClick="btnAddCooperativeUnit_Click"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" />
                        <zhongsoft:LightTextBox runat="server" ID="tbRowNum" Width="30px" Style="text-align: right"
                            regex="\d{1,3}" errmsg="请输入正确的行号！">
                        </zhongsoft:LightTextBox>行
                    </td>
                </tr>
                <tr id="trCooperativeUnitList" runat="server">
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView ID="gvCooperativeUnit" runat="server" AutoGenerateColumns="false"
                            DataKeyNames="CooperativeUnitInfoID" AllowPaging="true" OnRowCommand="gvCooperativeUnit_RowCommand"
                            EmptyDataText="未添加合作单位" BindGridViewMethod="UserControl.BindCooperativeUnitListGrid"
                            OnRowDataBound="gvCooperativeUnit_RowDataBound" HideFieldOnExport="编辑,删除" ShowExport="true">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="单位名称" ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCooperativeUnitName" MaxLength="64"
                                            Width="170px" Text='<%#Eval("CooperativeUnitName") %>'>
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="联系人" ItemStyle-Width="7%">
                                    <ItemTemplate>
                                        <asp:TextBox ID="tbExternalFunds" CssClass="kpms-textbox-money" runat="server" MaxLength="13"
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ExternalFunds") %>' Width="75" Visible="false"></asp:TextBox>
                                        <zhongsoft:LightTextBox runat="server" ID="tbPersonChargeName" MaxLength="20" Width="70px"
                                            Text='<%#Eval("PersonChargeName") %>'>
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="开户行" ItemStyle-Width="9%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbBankName" MaxLength="40" Width="100px"
                                            Text='<%#Eval("BankName") %>'>
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="银行帐号" ItemStyle-Width="9%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbBankAccount" MaxLength="20" Width="100px"
                                            Text='<%#Eval("BankAccount") %>'>
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="地址" ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbAdress" MaxLength="128" Width="200px"
                                            Height="50px" TextMode="MultiLine" Text='<%#Eval("Adress") %>'>
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="办公电话" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbPhone" MaxLength="16" Width="70px" Text='<%#Eval("Phone") %>'>
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="移动电话" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbMobilePhone" MaxLength="11" Width="70px"
                                            Text='<%#Eval("MobilePhone") %>'>
                                        </zhongsoft:LightTextBox>
                                        <input id="hiCooperativeUnitInfoID" runat="server" type="hidden" value='<%# Eval("CooperativeUnitInfoID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDel" EnableTheming="false" runat="server" CommandName="DeleteData"
                                            CommandArgument='<%#Eval("CooperativeUnitInfoID") %>'>
                                <img alt="删除合作单位" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" 
                                 onclick="return confirm('-确定删除该合作单位吗？');" title="点击删除合作单位" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: left"
            class="flexible" onclick="openDetail('trManager')">项目负责人信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trManager" style="display: none">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td class="td-l">姓名
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightObjectSelector ID="selectManager" runat="server" OnClientClick="selectManager()"
                            field="ProjectManagerName" tablename="SRPM_ProjectListOfWF"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" />
                        <input type="hidden" runat="server" id="hiManagerId" field="ProjectManagerID" tablename="SRPM_ProjectListOfWF" />
                    </td>
                    <td class="td-l">性别
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbSex" runat="server" readonly="readonly" class="kpms-textbox"
                            style="width: 120px" Field="Sex" TableName="SRPM_ProjectListOfWF" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">民族
                    </td>
                    <td class="td-m">
                        <zhongsoft:XHtmlInputText ID="tbNation" runat="server" readonly="readonly" class="kpms-textbox"
                            style="width: 120px" Field="Nation" TableName="SRPM_ProjectListOfWF" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">身份证号
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbIdentityCardNO" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="IdentityCardNO" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">职称
                    </td>
                    <td class="td-m">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText10" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="Sex" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">从事专业
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText3" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="Sex" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">年龄
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbAge" runat="server" readonly="readonly" class="kpms-textbox"
                            style="width: 120px" Field="Age" TableName="SRPM_ProjectListOfWF" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">职务
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText6" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="Age" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目分工
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText2" runat="server" readonly="readonly"
                            class="kpms-textbox" style="width: 120px" Field="Age" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">用于本项目的工作时间(%)
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText4" runat="server" readonly="readonly"
                            class="kpms-textbox" style="width: 120px" Field="Age" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">所在单位
                    </td>
                    <td class="td-m">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText9" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="Sex" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">最高学历
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText5" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="Sex" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">传真
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText7" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="MobilePhone" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">手机号
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbMobilePhone" runat="server" readonly="readonly" class="kpms-textbox"
                            style="width: 120px" Field="MobilePhone" TableName="SRPM_ProjectListOfWF" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">联系电话
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="XHtmlInputText8" runat="server" readonly="readonly"
                            style="width: 120px" class="kpms-textbox" Field="MobilePhone" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">EMAIL
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbEmail" runat="server" readonly="readonly" class="kpms-textbox"
                            style="width: 120px" Field="EMail" TableName="SRPM_ProjectListOfWF" ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: left">项目组主要研究人员
                    </td>
                </tr>
                <tr>
                    <td class="td-r" style="border-left: none; text-align: right;" colspan="6">
                        <asp:Button ID="btnAddMember" runat="server" Text="添加成员" OnClick="btnAddMember_Click"
                            OnClientClick="return detailOfProjectMember('2','');" ActiveStatus="(23.提出项目申请书)(3.立项修改)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView ID="gvMemberList" runat="server" AutoGenerateColumns="false"
                            DataKeyNames="MemberID" AllowPaging="true" OnRowCommand="gvMemberList_RowCommand"
                            EmptyDataText="未添加项目成员" BindGridViewMethod="UserControl.BindMemberListGrid" HideFieldOnExport="编辑,删除"
                            ShowExport="true">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserName" HeaderText="姓名" ItemStyle-Width="60px" />
                                <asp:BoundField DataField="IdentityCardNO" HeaderText="身份证号" ItemStyle-Width="60px" />
                                <asp:BoundField DataField="Sex" HeaderText="性别" ItemStyle-Width="10px" />
                                <asp:BoundField DataField="Age" HeaderText="年龄" />
                                <asp:BoundField DataField="JobRank" HeaderText="职称" />
                                <asp:BoundField DataField="Role" HeaderText="学历" />
                                <asp:BoundField DataField="Role" HeaderText="角色" />
                                <asp:BoundField DataField="SPECIALTY" HeaderText="从事专业" />
                                <asp:BoundField DataField="DeptName" HeaderText="所在单位" />
                                <asp:BoundField DataField="ProjectDivision" HeaderText="项目任务分工" />
                                <asp:BoundField DataField="Duty" HeaderText="职务" />
                                <asp:BoundField DataField="HisResearchProjectResult" HeaderText="每年用于本项目的月数" />
                                <asp:TemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnEdit" runat="server" EnableTheming="false" CommandName="EditData">
                                <img alt="编辑成员信息" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" 
                                 onclick="return detailOfProjectMember('3','<%#Eval("MemberID") %>')" title="点击编辑该成员信息" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDel" EnableTheming="false" runat="server" CommandName="DeleteData"
                                            CommandArgument='<%#Eval("MemberID") %>'>
                                <img alt="删除项目成员" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif"
                                 onclick="return confirm('-确定删除该项目成员吗？');" title="点击删除该项目成员" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="flexible" onclick="openDetail('trContentNode')">
        <td class="kpms-rollist-hand" style="font-weight: bold; text-align: left" colspan="6">项目大纲&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trContentNode" style="display: none">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td class="td-l">项目概述（限300以内） <span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <input type="hidden" runat="server" id="hiContent" field="ProjectContent" tablename="SRPM_ProjectListOfWF" />
                        <zhongsoft:LightTextBox runat="server" ID="tbProjectContentNode" field="ProjectContentNode" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="300" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="100px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目的目标与任务（限1000以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbProjectMeaning" field="ProjectMeaning" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="1000" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="200px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">现有工作基础与优势（限1000以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbExpectedResults" field="ExpectedResults" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="1000" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="200px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">任务分解与考核指标（限3000以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbBackgroundMeaning" field="BackgroundMeaning" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="3000" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="300px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">经费预算与说明（限1000以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <input type="hidden" runat="server" id="hiProjectBasis" field="ProjectBasis" tablename="SRPM_ProjectListOfWF" />
                        <zhongsoft:LightTextBox runat="server" ID="tbResearchDevelopmentTrend" field="ResearchDevelopmentTrend" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="1000" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="300px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目的年度计划与年度目标（限1000以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbImplementResearchContent" field="ImplementResearchContent" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="1000" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="300px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">实施机制（限1000以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbKeyTechnologyInnovation" field="KeyTechnologyInnovation" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="1000" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="300px">
                        </zhongsoft:LightTextBox>

                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目风险分析与对策（限1200以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbExpectedTechnicalEconomicIndex" field="ExpectedTechnicalEconomicIndex" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="1200" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="300px">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">其他需要说明的事项（限600以内）<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbExpectedResultsForm" field="ExpectedResultsForm" activestatus="(23.提出项目申请书)"
                            tablename="SRPM_ProjectListOfWF" MaxLength="600" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Height="150px">
                        </zhongsoft:LightTextBox>
                        <input type="hidden" runat="server" id="hiResearchTarget" field="ResearchTarget" tablename="SRPM_ProjectListOfWF" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="flexible" onclick="openDetail('trTotalBudget')">
        <td colspan="6" class="kpms-rollist-hand" style="font-weight: bold; text-align: left">项目投资预算（单位：万元）&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trTotalBudget" style="display: none">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td class="td-l">计划投资总额（万元）
                    </td>
                    <td class="td-r" colspan="5">
                        <zhongsoft:XHtmlInputText ID="tbProjectTotalBudget" runat="server" class="kpms-textbox-money"
                            readonly="readonly" Field="ProjectTotalBudget" TableName="SRPM_ProjectListOfWF"
                            ActiveStatus="(23.提出项目申请书)(3.立项修改)">
                        </zhongsoft:XHtmlInputText>
                        <zhongsoft:LightTextBox ID="tbInstituteFunds" runat="server" CssClass="kpms-textbox-money"
                            MaxLength="14" EnableTheming="false" Regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                            ErrMsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" field="InstituteFunds" onblur="sumTotalMoney()"
                            tablename="SRPM_ProjectListOfWF" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">已完成投资（万元）<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="LightTextBox8" onblur="sumTotalMoney()" runat="server"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" CssClass="kpms-textbox-money" MaxLength="14"
                            EnableTheming="false" Regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" ErrMsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位"
                            field="ExternalFunds" tablename="SRPM_ProjectListOfWF" />
                    </td>
                    <td class="td-l">其中：自筹（万元）<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="tbExternalFunds" onblur="sumTotalMoney()" runat="server"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" CssClass="kpms-textbox-money" MaxLength="14"
                            EnableTheming="false" Regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" ErrMsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位"
                            field="ExternalFunds" tablename="SRPM_ProjectListOfWF" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">计划新增投资（万元）<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="LightTextBox9" runat="server" CssClass="kpms-textbox-money"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" MaxLength="14" EnableTheming="false"
                            Regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" onblur="sumTotalMoney()"
                            ErrMsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" field="DeptSelfFunds" tablename="SRPM_ProjectListOfWF" />
                    </td>
                    <td class="td-l">其中：自筹（万元）<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="tbDeptSelfFunds" runat="server" CssClass="kpms-textbox-money"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" MaxLength="14" EnableTheming="false"
                            Regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" onblur="sumTotalMoney()"
                            ErrMsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" field="DeptSelfFunds" tablename="SRPM_ProjectListOfWF" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">申请科技经费（万元）<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="LightTextBox10" runat="server" CssClass="kpms-textbox-money"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" MaxLength="14" EnableTheming="false"
                            Regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" onblur="sumTotalMoney()"
                            ErrMsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" field="DeptSelfFunds" tablename="SRPM_ProjectListOfWF" />
                    </td>
                    <td class="td-l">其他拨款（万元）<span class="req-star">*</span>
                    </td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="LightTextBox11" runat="server" CssClass="kpms-textbox-money"
                            req="1" ActiveStatus="(23.提出项目申请书)(3.立项修改)" MaxLength="14" EnableTheming="false"
                            Regex="(^[0-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" onblur="sumTotalMoney()"
                            ErrMsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" field="DeptSelfFunds" tablename="SRPM_ProjectListOfWF" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="flexible" onclick="openDetail('trBudgetDetail')">
        <td colspan="6" class="kpms-rollist-hand" style="font-weight: bold; text-align: left">项目经费预算&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trBudgetDetail" style="display: none">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td colspan="6" align="right" style="border-left: none">
                        <asp:Button ID="btnEditBudgetDetail" runat="server" OnClientClick="return detailOfBudgetDetail('2')"
                            OnClick="btnEditBudgetDetail_Click" Text="编辑经费预算" ActiveStatus="(23.提出项目申请书)(3.立项修改)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:TreeGridView ID="tgvBudgetDetailList" runat="server" AutoGenerateColumns="false"
                            SelfIdColumn="BudgetStatisticsID" ParentIdColumn="ParentID" PageSize="12" BindGridViewMethod="UserControl.BindBudgetDetailListGrid"
                            UseDefaultDataSource="true" AllowPaging="true" IndentSize="10" OnRowCommand="tgvBudgetDetailList_RowCommand"
                            EmptyDataText="未添加年度科目预算" ShowExport="true" ShowFooter="true" OnRowDataBound="tgvBudgetDetailList_RowDataBound">
                            <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <%# tgvBudgetDetailList.CreateHeader(Container.DataItem) %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Year" HeaderText="年度" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="60px" />
                                <asp:BoundField DataField="SmallCostName" HeaderText="预算科目" ItemStyle-Width="300px" />
                                <asp:BoundField DataField="BudgetMoney" HeaderText="总预算（元）" ItemStyle-Width="130px"
                                    ItemStyle-HorizontalAlign="Right" />
                                <%-- <asp:BoundField DataField="CalculateReason" HeaderText="计算根据和理由" />--%>
                                <asp:BoundField DataField="BudgetTechnology" HeaderText="科技经费" ItemStyle-Width="130px"
                                    ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField DataField="BudgetYear" HeaderText="自筹" ItemStyle-Width="130px" ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField DataField="NextYearBudget" HeaderText="其它" ItemStyle-Width="130px"
                                    ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField DataField="Reason" HeaderText="原因" ItemStyle-Width="550px" />
                            </Columns>
                        </zhongsoft:TreeGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="flexible" onclick="openDetail('trUploadFile')">
        <td colspan="6" class="kpms-rollist-hand" style="font-weight: bold; text-align: left">后附文件&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trUploadFile" style="display: none">
        <td colspan="6">
            <table class="tz-table">
                <tr runat="server" id="upFile">
                    <td align="right" colspan="6">
                        <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" CssClass="subtoolbarlink" Multiselect="true" FileSourceFlag="Form" EnableTheming="false" activeStatus="(23.提出项目申请书)(3.立项修改)" OnClick="btnUploadFile_Click"> 
                            <img alt="上传附件" src="../../Themes/Images/btn_upload.gif" title="上传附件"/>上传附件
                        </zhongsoft:LightFileUploader>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView ID="gvFileList" runat="server" AutoGenerateColumns="false"
                            AllowPaging="true" BindGridViewMethod="BindFileListGrid" OnRowCommand="gvFileList_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="文件名">
                                    <ItemTemplate>
                                        <a href="<%=WebAppPath %>/Sys/FileDocument/FileDownload.aspx?fileId=<%#Eval("FileId") %>"
                                            title="【点击下载】<%# Eval("FileName") %>" target="_blank" style="color: Blue; text-decoration: underline;">
                                            <%# Eval("FileName") %>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  <asp:BoundField DataField="AttachmentType" HeaderText="附件类型" ItemStyle-Width="80px" />--%>
                                <asp:BoundField DataField="UploadDate" HeaderText="上传时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                    ItemStyle-Width="120px" />
                                <asp:TemplateField HeaderText="删除" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" EnableTheming="false" runat="server" CommandArgument='<%#Eval("FileId") %>'
                                            CommandName="DeleteData">
                                        <img alt="删除" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" title="点击删除该文件"
                                         onclick="return confirm('-确定删除该文件吗？');"/>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiTechProjectBuildID" field="ProjectBuildFormID"
    tablename="TSM_SciTechProjectBuildForm" />
<input type="hidden" runat="server" id="hiProjectListId" field="ProjectListID" tablename="SRPM_ProjectListOfWF" />
<input type="hidden" runat="server" id="hiBUSINESSID" field="BUSINESSID" tablename="SRPM_ProjectListOfWF" />
<input type="hidden" runat="server" id="hiKJDeptID" value="11EAACF2-2C5E-4232-B781-C721C67D5388" />
<script type="text/javascript">
    var t = new KPMSXml();
    var curAct = "<%=CurrentActivityName %>";
    var actType = "<%=ActionType %>";
    //加载相关方法
    function InitCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    //单位意见上传附件
    function UpFile(ObjectId) {
        var fileSrcFlag = "Module";
        var buildSelf = "False";
        var fileSrcId = '<%=BusinessObjectId %>';

        var url = "/Portal/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + ObjectId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
        var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
        window.showModalDialog(url, null, stringFeatures);
        return true;
    }
    //选择项目负责人
    function selectManager() {
        var param = new InputParamObject("s");
        var reObj = getUsers("", param, "");
        if (reObj != null) {
            var uid = reObj.buildAttrJson("o", "id");
            var uname = reObj.buildAttrJson("o", "name");
            var deptid = reObj.buildAttrJson("o", "OrgUnitId");
            var deptname = reObj.buildAttrJson("o", "OrgUnitName");

            var umobilephone = reObj.buildAttrJson("o", "MobilePhone");
            var usex = reObj.buildAttrJson("o", "Sex");

            var uemail = reObj.buildAttrJson("o", "Email");
            var uFax = reObj.buildAttrJson("o", "FAX");
            var uage = reObj.buildAttrJson("o", "AGE");

            $("#<%=hiManagerId.ClientID %>").val(uid);
            $("#<%=selectManager.HiddenClientID %>").val(uname);
            $("#<%=hiProjectDeptID.ClientID %>").val(deptid);
            $("#<%=lbsHostDept.ClientID %>").val(deptname);
            $("#<%=tbMobilePhone.ClientID %>").val(umobilephone);
            $("#<%=tbSex.ClientID %>").val(usex);
            $("#<%=tbAge.ClientID %>").val(uage);
            $("#<%=tbEmail.ClientID %>").val(uemail);



        }
        return false;
    }
    //计算金额
    function sumTotalMoney() {

        var sumMoney = 0.00;
        var sumMoney2 = 0.00;
        var instituteFunds = $("#<%=this.tbInstituteFunds.ClientID %>").val();
        var deptSelfFunds = $("#<%=this.tbDeptSelfFunds.ClientID %>").val();
        var externalFunds = $("#<%=this.tbExternalFunds.ClientID %>").val();

        //        if (instituteFunds == "") {
        instituteFunds = 0.00;
        //        }
        if (deptSelfFunds == "") {
            deptSelfFunds = 0.00;
        }
        if (externalFunds == "") {
            externalFunds = 0.00;
        }

        sumMoney = accAdd(instituteFunds, deptSelfFunds);
        sumMoney2 = accAdd(sumMoney, externalFunds);

        $("#<%=tbProjectTotalBudget.ClientID %>").val(sumMoney2);
        return true;
    }

    //加法
    function accAdd(arg1, arg2) {
        var r1, r2, m;
        try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
        try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
        m = Math.pow(10, Math.max(r1, r2))
        return ((arg1 * m + arg2 * m) / m).toFixed(2);
    }

    //计划进度安排维护
    function detailOfSchedule(actType, bizId) {
        var projectListID = $("#<%=this.hiProjectListId.ClientID %>").val();
        var url = "<%=WebAppPath %>/TSM/List/TSM/SRPMProjectWorkArrangeEditor.aspx?actionType=" + actType + "&workFlowID=" + "<%=BusinessObjectId %>";
        if (bizId != "") {
            url += "&bizId=" + bizId;
        }
        else {
            url += "&projectListId=" + projectListID;
        }
        showModal(url, null, 700, 450);
        return true;
    }


    $("[id*=tbWorkDay]").live("change", function () {
        SumRowMoney(this, null);
        SumMoney();
    })
    $("[id*=tbDailyValue]").live("change", function () {
        SumRowMoney(null, this);
        SumMoney();
    })

    //计算行金额合计
    function SumRowMoney(countCtrl, priceCtrl) {
        var count = 0.0;
        var price = 0.00;
        if (countCtrl != null) {
            count = $(countCtrl).val();
            price = $(countCtrl).parent("td").parent("tr").find("[id*=tbDailyValue]").val();
            if (count != "" && price != "") {
                $(countCtrl).parent("td").parent("tr").find("[id*=txtBudgetValue]").val(accMul(Number(count), Number(price)));
            }
            else {
                $(countCtrl).parent("td").parent("tr").find("[id*=txtBudgetValue]").val("");
            }
        }
        if (priceCtrl != null) {
            price = $(priceCtrl).val();
            count = $(priceCtrl).parent("td").parent("tr").find("[id*=tbWorkDay]").val();
            if (count != "" && price != "") {
                $(priceCtrl).parent("td").parent("tr").find("[id*=txtBudgetValue]").val(accMul(Number(count), Number(price)));
            }
            else {
                $(priceCtrl).parent("td").parent("tr").find("[id*=txtBudgetValue]").val("");
            }
        }
    }

    //计算总金额合计
    function SumMoney() {
        var workDay = 0.00;
        var sumworkDay;

        var dailyValue = 0.00;
        var sumdailyValue;

        var sumMoney = 0.00;
        var singleMoney;

    }

    //乘法
    function accMul(arg1, arg2) {
        var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
        try { m += s1.split(".")[1].length } catch (e) { }
        try { m += s2.split(".")[1].length } catch (e) { }
        return (Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m)).toFixed(2);
    }

    function detailOfProjectMember(actType, bizId) {

        var projectListID = $("#<%=this.hiProjectListId.ClientID %>").val();

          var url = buildQueryUrl("<%=WebAppPath %>/TSM/List/TSM/SRPMProjectMemberEditor.aspx", { actionType: actType, bizId: bizId, projectListId: projectListID });

        showDivDialog(url, null, 650, 500, editProjectCallBack);
        return false;
    }

    function editProjectCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddMember,"") %>
        return true;
    }

    //编辑预算
    function detailOfBudgetDetail(actType) {
        var year = $("#<%=ddlProjectYear.ClientID %>").val();
        var projectListID = $("#<%=hiProjectListId.ClientID %>").val();
        var url = buildQueryUrl("<%=WebAppPath %>/TSM/List/TSM/SRPMProjectBudgetDetailEditor.aspx", { actionType: actType, bizId: projectListID, year: year });

        showDivDialog(url, null, 850, 700, editProjectCallBackB);
        return false;
    }

    function editProjectCallBackB(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnEditBudgetDetail,"") %>
        return true;
    }


    function filterHostDeptFuc() {
        var josn = { "IsSingle": "true" };
        return josn;
    }
    window.onload = function () {
        if ('<%=CurrentActivityName%>' == "符合性审查") {
            $("#trOpen").click();
        }
    }
</script>
