<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesignTaskInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.DesignTaskInfo" %>
<%@ Import Namespace="DAL.EPMS" %>
<tr>
    <td class="td-l">项目名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtManager':'ManagerUserName'}"
            TableName="EPMS_WBSBook" Field="ProjectName" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSBook"
            field="OrganizationID" />
    </td>
    <td class="td-l">项目编号
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSBook" Field="ProjectCode" />
    </td>
</tr>
<tr>
    <td class="td-l" style="display: none">任务类型
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="txtWBSType" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            readonly="readonly" class="kpms-textbox" />
    </td>
    <td class="td-l">任务书编号
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtWBSBookCode" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSBook" Field="WBSBookCode"
            tooltip="编号自动生成" />
    </td>
    <td class="td-l">是否创优项目
    </td>
    <td class="td-r">
        <asp:RadioButtonList ID="rdblIsExcellent" runat="server" ActiveStatus="(23.?)" RepeatColumns="2">
            <asp:ListItem Text="是" Value="1"></asp:ListItem>
            <asp:ListItem Text="否" Value="0"></asp:ListItem>
        </asp:RadioButtonList>
    </td>
    <td class="td-l">项目设总
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtManager" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            readonly="readonly" class="kpms-textbox" />
    </td>
</tr>
<tr>
    <td class="td-l">卷册名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
            ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','hiWBSTemplateID':'WBSTemplateID','hiPutSpecialtyID':'ExecSpecialtyID','hiPutSpecialtyCode':'ExecSpecialtyCode','txtPutSpecialtyName':'ExecSpecialtyName','txtWBSType':'WBSType','hiBelongDeptID':'BelongDeptID','txtBelongDeptName':'BelongDeptName','txtWBSOwner_hivalue':'WBSOwnerName','txtWBSOwner':'WBSOwnerName','hiWBSOwnerID':'WBSOwnerID','tbWorkDayOfTrade':'WorkDayOfTrade','tbWorkDayOfConfirm':'WorkDayOfConfirm'}"
            activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)" tablename="EPMS_WBSBook" field="WBSName"
            BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()" OnClick="txtWBSName_Click"
            req="1"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_WBSBook" field="WBSID" />
        <input type="hidden" runat="server" id="hiWBSTemplateID" />
    </td>
    <td class="td-l">卷册编号
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            tablename="EPMS_WBSBook" field="WBSCode" readonly="readonly" class="kpms-textbox" />
    </td>
</tr>
<tr>
    <td class="td-l">专业
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPutSpecialtyName" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            readonly="readonly" class="kpms-textbox" tablename="EPMS_WBSBook" field="PutSpecialtyName" />
    </td>
    <td class="td-l">所属部门
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)"
            readonly="readonly" class="kpms-textbox" />
    </td>
    <td class="td-l">卷册负责人<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwner" IsMutiple="false"
            SelectPageMode="Dialog" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            ShowAttrs="name,UserCode" ResultForControls="{'hiWBSOwnerID':'id'}" tablename="EPMS_WBSBook"
            FilterFunction="wbsOwnerFilter()" req="1" PageWidth="850" field="WBSOwnerName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiWBSOwnerID" tablename="EPMS_WBSBook" field="WBSOwnerID" />
        <input type="hidden" runat="server" id="hiBelongDeptID" />
    </td>
</tr>
<tr>
    <td class="td-l">主设人
    </td>
    <td class="td-r">
        <zhongsoft:LightObjectSelector runat="server" ID="txtPutUser" IsMutiple="false" SelectPageMode="Dialog"
            activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)" SourceMode="SelectorPage" ShowJsonRowColName="true"
            DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiPutUserId':'id'}"
            PageWidth="850" tablename="EPMS_WBSBook" field="PutUserName" ShowSelectBtn="false"
            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiPutUserId" tablename="EPMS_WBSBook" field="PutUserID" />
    </td>
    <td class="td-l">专工
    </td>
    <td class="td-r">
        <zhongsoft:LightObjectSelector runat="server" ID="txtReCheckUser" IsMutiple="false"
            SelectPageMode="Dialog" activestatus="(23.审核)(23.审批)" SourceMode="SelectorPage"
            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
            ResultForControls="{'hiCheckUserID':'id'}" tablename="EPMS_WBSBook" field="RecheckUserName"
            PageWidth="850" ShowSelectBtn="false" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiReCheckUserID" tablename="EPMS_WBSBook"
            field="RecheckUserID" />
    </td>
    <td class="td-l" style="display: none">计划院交出时间
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanCompleteDate" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l" style="display: none">校核人
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:LightObjectSelector runat="server" ID="txtCheckInfoUser" IsMutiple="false"
            SelectPageMode="Dialog" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            ShowAttrs="name,UserCode" ResultForControls="{'hiCheckUserInfoID':'id'}" PageWidth="850"
            tablename="EPMS_WBSBook" field="CheckUserName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiCheckUserInfoID" tablename="EPMS_WBSBook"
            field="CheckUserID" />
    </td>
    <td class="td-m" colspan="2"></td>
</tr>
<tr>
    <td class="td-l">计划开始时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanStartTime" activestatus="(23.编制卷册作业指导书)(23.审核)"
            readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSBook" Field="PlanStartTime">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l">计划个人出手时间
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanHandTime" activestatus="(23.编制卷册作业指导书)(23.审核)"
            readonly="readonly" class="kpms-textbox-date">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l" style="display: none">计划室交出时间
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanRecheckTime1" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-m" colspan="2"></td>
</tr>
<tr>
    <td class="td-l" style="display: none">计划校核完成时间
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="tbPlanCheckTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date">
        </zhongsoft:XHtmlInputText>
    </td>
    <td class="td-l" style="display: none">计划批准完成时间
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="tbPlanApprovalTime" activestatus="(23.?)"
            readonly="readonly" class="kpms-textbox-date">
        </zhongsoft:XHtmlInputText>
    </td>
</tr>
<tr>
    <td class="td-l">任务标识
    </td>
    <td class="td-m" colspan="3">
        <asp:CheckBoxList runat="server" ID="cblWBFFlag" RepeatDirection="Horizontal" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)">
        </asp:CheckBoxList>
        <input type="hidden" runat="server" id="hiWBSFlag" />
    </td>
    <td class="td-l">定额工日
    </td>
    <td class="td-r">
        <%-- <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfTrade" TableName="EPMS_WBSBook"
            Field="WorkDayOfTrade" activestatus="(23.*)" Style="text-align: right; width: 70px;"
            regex="^\d{0,2}.[0-9]{0,2}$" errmsg="请输入最多2位整数2位小数"></zhongsoft:LightTextBox>--%>
        <%--<zhongsoft:XHtmlInputText runat="server" ID="txtWorkDayOfTrade" class="kpms-textbox-money"
            activestatus="(23.审核)(2.编制卷册作业指导书)">
        </zhongsoft:XHtmlInputText>--%>
        <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfConfirm" DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="False" activestatus="(23.编制卷册作业指导书)(23.审核)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr id="trPressurePipe">
    <td colspan="6">
        <table class="tz-table" width="100%">
            <tr>
                <td class="td-l">管道介质
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlPipeMedium" runat="server" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
                        Width="190" tablename="EPMS_WBSBook" field="ParamPipeMediumID">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">设计压力
                </td>
                <td class="td-r" nowrap>
                    <zhongsoft:LightTextBox ID="tbDesignPressure" runat="server" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
                        Width="50" tablename="EPMS_WBSBook" field="DesignPressure" EnableTheming="false"
                        CssClass="kpms-textbox-money" Regex="^([1-9]\d{0,3}|[0])(\.\d{0,1})?$" errmsg="请输入正数，最多4位整数，1位小数"></zhongsoft:LightTextBox>MPa(表压)
                </td>
                <td class="td-l">设计温度
                </td>
                <td class="td-r" nowrap>
                    <zhongsoft:LightTextBox ID="tbDesignTemperature" runat="server" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
                        tablename="EPMS_WBSBook" field="DesignTemperature" EnableTheming="false" CssClass="kpms-textbox-money"
                        Width="50" Regex="^-?[0-9]\d*$" errmsg="请输入整数" MaxLength="4"></zhongsoft:LightTextBox>℃
                </td>
                <td class="td-l">管道工程直径
                </td>
                <td class="td-r" nowrap>
                    <zhongsoft:LightTextBox ID="tbPipeDiameter" runat="server" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
                        Width="50" tablename="EPMS_WBSBook" field="PipeDiameter" EnableTheming="false"
                        CssClass="kpms-textbox-money" Regex="^[0-9]\d*$" errmsg="请输入正整数" MaxLength="4"></zhongsoft:LightTextBox><span
                            style="font-size: large">mm</span>
                </td>
            </tr>
            <tr>
                <td class="td-l">压力管道级别[<a href="javascript:viewPressurePipeDescriptionPdf();" style="color: Blue">说明</a>]
                </td>
                <td class="td-r" colspan="3">
                    <asp:LinkButton ID="lkbZddj" runat="server" OnClientClick="return false" EnableTheming="false"
                        activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)" ForeColor="Blue">自动定级</asp:LinkButton>
                    <zhongsoft:LightDropDownList ID="ddlPressurePipeLevel" runat="server" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
                        tablename="EPMS_WBSBook" field="ParamPressurePipeLevelID" Width="120px">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">压力管道审核人
                </td>
                <td class="td-r">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtGDCheckerName" IsMutiple="false"
                        SelectPageMode="Dialog" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)" SourceMode="SelectorPage"
                        ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                        ResultForControls="{'hiGDCheckerID':'id'}" tablename="EPMS_WBSBook" field="GDCheckerName"
                        PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="gdCheckerFilter()"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiGDCheckerID" tablename="EPMS_WBSBook" field="GDCheckerID" />
                </td>
                <td class="td-l">压力管道审定
                </td>
                <td class="td-r">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtGDAuthorizerName" IsMutiple="false"
                        SelectPageMode="Dialog" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
                        SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                        ShowAttrs="name,UserCode" ResultForControls="{'hiGDAuthorizerID':'id'}" tablename="EPMS_WBSBook"
                        field="GDAuthorizerName" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="gdAuthorizerFilter()"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiGDAuthorizerID" tablename="EPMS_WBSBook"
                        field="GDAuthorizerID" />
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr style="display: none">
    <td class="td-l">计划/实耗工作量(日)
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox ID="tbPlanOrFactWorDay" runat="server" EnableTheming="false"
            CssClass="kpms-textbox-money" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            TableName="EPMS_WBSBook" Field="PlanOrFactWorDay">
        </zhongsoft:LightTextBox>
        计算/设计/其他/校核/合计/
    </td>
</tr>
<tr style="display: none">
    <td class="td-l">计划/实际出图张数
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox ID="tbPlanOrFactPictureNum" runat="server" EnableTheming="false"
            CssClass="kpms-textbox-money" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            TableName="EPMS_WBSBook" Field="PlanOrFactPictureNum">
        </zhongsoft:LightTextBox>
        新制/套用/合计/计算/(页)
    </td>
</tr>
<tr runat="server" id="trbtn" displaystatus="(23.编制卷册作业指导书)(3.编制卷册设计任务书)(3.审核)(3.审批)">
    <td colspan="6" class="td-m">
        <asp:Button ID="btnOldWbsBook" runat="server" Text="套用历史工程设计任务书" activestatus="(23.编制卷册作业指导书)(3.编制卷册设计任务书)(3.审核)(3.审批)"
            OnClientClick="return selOldProectWBSBook()" />
        <asp:Button ID="btnWbsBookPlate" runat="server" Text="套用标准任务书模板" activestatus="(3.编制卷册作业指导书)(3.编制卷册设计任务书)(3.审核)(3.审批)"
            OnClientClick="return selWBSBookTemplete()" Visible="false" />
    </td>
</tr>
<tr itemshow="sgt">
    <td class="td-l" style="white-space: nowrap;">设计内容及范围
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbContentOrRange" TextMode="MultiLine" MaxLength="2048"
            EnableTheming="false" CssClass="kpms-textarea" TableName="EPMS_WBSBook" Field="ContentOrRange"
            activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr itemshow="sgt">
    <td class="td-l">主要设计原则及专题论证
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbBasisOrConditions" TextMode="MultiLine" MaxLength="2048"
            EnableTheming="false" CssClass="kpms-textarea" TableName="EPMS_WBSBook" Field="BasisOrConditions"
            activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"></zhongsoft:LightTextBox>
    </td>
</tr>

<tr itemshow="sgt" style="display: none">
    <td class="td-l">技术组织措施
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbPrincipleOrRequire" TextMode="MultiLine"
            EnableTheming="false" CssClass="kpms-textarea" TableName="EPMS_WBSBook" Field="PrincipleOrRequire"
            activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr style="display: none">
    <td class="td-l">攻关创优课题
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbReleParam" TextMode="MultiLine" EnableTheming="false"
            CssClass="kpms-textarea" TableName="EPMS_WBSBook" Field="ReleParam" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr>
    <td class="td-l">设计注意事项：（包括常见病<br />
        和多发病等质量信息的利用）      
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbTechMeasure" TextMode="MultiLine" EnableTheming="false" MaxLength="2048"
            CssClass="kpms-textarea" TableName="EPMS_WBSBook" Field="TechMeasure" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr flag="hidden">
    <td class="td-l">数字化设计范围、深度、<br />
        注意的事项
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" EnableTheming="false"
            CssClass="kpms-textarea" TableName="EPMS_WBSBook" Field="Memo" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"></zhongsoft:LightTextBox>
    </td>
</tr>
<tr style="display: none">
    <td class="flexible" colspan="6">归档资料项目
    </td>
</tr>
<tr style="display: none">
    <td class="td-l">卷册设计任务书
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbRollWbsBookNum" runat="server" EnableTheming="false"
            CssClass="kpms-textbox-money" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            TableName="EPMS_WBSBook" Field="RollWbsBookNum"></zhongsoft:LightTextBox>(份)
    </td>
    <td class="td-l">计算书
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbCalculateNum" runat="server" EnableTheming="false"
            CssClass="kpms-textbox-money" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            TableName="EPMS_WBSBook" Field="CalculateNum"></zhongsoft:LightTextBox>(份)
    </td>
    <td class="td-l">交换资料
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbMutualFileNum" runat="server" EnableTheming="false"
            CssClass="kpms-textbox-money" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            TableName="EPMS_WBSBook" Field="MutualFileNum"></zhongsoft:LightTextBox>(份)
    </td>
</tr>
<tr style="display: none">
    <td class="td-l">设计成品校审记录卡
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbProductCheckCardNum" runat="server" EnableTheming="false"
            CssClass="kpms-textbox-money" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            TableName="EPMS_WBSBook" Field="ProductCheckCardNum"></zhongsoft:LightTextBox>(份)
    </td>
    <td class="td-l">其他资料
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightTextBox ID="tbOtherFileNum" runat="server" EnableTheming="false"
            CssClass="kpms-textbox-money" activestatus="(23.编制卷册作业指导书)(23.编制卷册设计任务书)(23.审核)(23.审批)"
            TableName="EPMS_WBSBook" Field="OtherFileNum"></zhongsoft:LightTextBox>(份)
    </td>
</tr>
<!-- 任务书主键ID-->
<input type="hidden" runat="server" id="hiWBSBookID" tablename="EPMS_WBSBook" field="WBSBookID" />
<!-- 任务书类型-->
<input type="hidden" runat="server" id="hiWBSBookType" tablename="EPMS_WBSBook" field="WBSBookType" />
<!-- 任务书性质-->
<input type="hidden" runat="server" id="hiWBSBookNature" tablename="EPMS_WBSBook"
    field="WBSBookNature" />
<!-- 提出部门-->
<input type="hidden" runat="server" id="hiPutDeptID" tablename="EPMS_WBSBook" field="PutDeptID" />
<input type="hidden" runat="server" id="hiPutDeptName" tablename="EPMS_WBSBook" field="PutDeptName" />
<!-- 提出专业-->
<input type="hidden" runat="server" id="hiPutSpecialtyID" tablename="EPMS_WBSBook"
    field="PutSpecialtyID" />
<input type="hidden" runat="server" id="hiPutSpecialtyCode" tablename="EPMS_WBSBook"
    field="PutSpecialtyCode" />
<!-- 卷册负责人角色-->
<input type="hidden" runat="server" id="hiOwnerRoleId" />
<!-- 工程类型ID-->
<input type="hidden" runat="server" id="hiParamProjectTypeID" />
<!-- 阶段ID-->
<input type="hidden" runat="server" id="hiPhaseId" />
<input type="hidden" runat="server" id="hiXml" />
<input type="hidden" runat="server" id="hiExeSpecialtyID" />
<script type="text/javascript">
    function initDesignTaskInfo() {
        setPressurePipe();
        $("#<%=cblWBFFlag.ClientID %>").click(function () {
            setPressurePipe();
        });

        $('[flag="hidden"]').hide();
        $("#<%=tbMemo.ClientID %>").val("");
        var wbsFlag = $('#<%=hiWBSFlag.ClientID %>').val();
        //增加“数字化设计范围、深度、注意的事项”，文本输入。（三维的卷册使用）
        if (wbsFlag.indexOf("数字化设计") > -1) {
            $('[flag="hidden"]').show();
        }
    }

    function setPressurePipe() {
        var str = "";
        $("input[id*=cblWBFFlag]").each(function () {

            if ($(this).attr("checked") == "checked") {
                str += $(this).next().text() + ",";
            }
        });
        if (str.indexOf("压力管道") > -1) {
            //勾选压力管道后，页面上不显示以下内容 modified by likun on 20160318
            //$("#trPressurePipe").show();
            $("#trPressurePipe").hide();
        }
        else if (str.indexOf("数字化设计") > -1) {
            $("#trPressurePipe").hide();
            $('[flag="hidden"]').show();
        }
        else {
            $("#trPressurePipe").hide();
        }
    }


    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择卷册！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        //当前登录人在所选项目中担任主设人的专业ID
        var specialtyID = $('#<%=hiExeSpecialtyID.ClientID %>').val();
        return { OrganizationID: orgId, TypeID: '<%=WBSType.册.GetHashCode() %>', ExeSpecialtyID: specialtyID, IsShowMore: 0, WBSState: '<%=(int)WBSState.尚未开展 %>', 'IsFilterSpe': 'true' };
    }

    //选择卷册负责人筛选条件
    function ownerFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var roleId = $('#<%=hiOwnerRoleId.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        return "{OrganizationID:'" + orgId + "',RoleID:'" + roleId + "',DeptID:'" + deptID + "'}";
    }

    //选择压力管道审核人
    function gdCheckerFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var roleId = $('#<%=hiOwnerRoleId.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        return "{OrganizationID:'" + orgId + "',RoleID:'" + roleId + "',DeptID:'" + deptID + "'}";
    }

    //选择压力管道审定人
    function gdAuthorizerFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var roleId = $('#<%=hiOwnerRoleId.ClientID %>').val();
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        return "{OrganizationID:'" + orgId + "',RoleID:'" + roleId + "',DeptID:'" + deptID + "'}";
    }

    //选择历史项目任务书
    function selOldProectWBSBook() {
        var specID = $('#<%=hiPutSpecialtyID.ClientID %>').val();
        var projectTypeID = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        var phaseID = $('#<%=hiPhaseId.ClientID %>').val();
        var wbsCode = $('#<%=txtWBSCode.ClientID %>').val();
        var param = new InputParamObject("s");
        var josn = { 'SpecialtyID': specID, 'ParamProjectTypeID': projectTypeID, 'PhaseID': phaseID, 'WBSCode': wbsCode };
        getWBSBook("<%=hiXml.ClientID %>", param, josn, selWBSBookCallBack);
        return false;
    }

    //选择任务模板
    function selWBSBookTemplete() {
        var param = new InputParamObject("s");
        var josn = {};
        getWBSBookTemplete("", param, josn, selWBSBookCallBack);
        return false;
    }

    function selWBSBookCallBack(re) {
        if (re != null) {
            $('#<%=tbContentOrRange.ClientID %>').val(re.buildAttrJson("o", "ContentOrRange"));
            $('#<%=tbBasisOrConditions.ClientID %>').val(re.buildAttrJson("o", "BasisOrConditions"));
            $('#<%=tbPrincipleOrRequire.ClientID %>').val(re.buildAttrJson("o", "PrincipleOrRequire"));
            $('#<%=tbReleParam.ClientID %>').val(re.buildAttrJson("o", "ReleParam"));
            $('#<%=tbTechMeasure.ClientID %>').val(re.buildAttrJson("o", "TechMeasure"));
        }
        return false;
    }

    function viewPressurePipeDescriptionPdf() {

        var url = buildQueryUrl("/Sys/Download/EPMS/设计一体化平台-压力管道设计说明.pdf");
        window.open(url);

    }

    function getWBSID() {
        return $("#<%=hiWBSID.ClientID %>").val();
    }

    //选择压力管道审定人
    function getOrgID() {
        return $('#<%=hiOrganizationID.ClientID %>').val();
    }

    //卷册负责人筛选
    function wbsOwnerFilter() {
        var deptID = $('#<%=hiBelongDeptID.ClientID %>').val();
        return { OrganizationId: deptID };
    }

</script>
