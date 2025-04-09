<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QualityInfoEditor.aspx.cs" Title="质量信息详细"
    Inherits="Zhongsoft.Portal.EPMS.List.Quality.QualityInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" SourceMode="SelectorPage"
                    PageWidth="850" req="1" IsMutiple="false" DoCancel="true" SelectPageMode="Dialog"
                    ResultForControls="{'hiOrganizationID':'id','hiProjectCode':'ProjectCode','hiPhaseName':'PhaseName','hiProjectScale':'ProjectScale','hiProjectNature':'ProjectNature'}"
                    EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" TableName="EPMS_QualityEntity"
                    Field="ProjectName" />
                <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server" tablename="EPMS_QualityEntity" field="OrganizationID" />
                <input type="hidden" runat="server" id="hiProjectCode" tablename="EPMS_QualityEntity" field="ProjectCode" />
                <input type="hidden" runat="server" id="hiPhaseName" tablename="EPMS_QualityEntity" field="PhaseName" />
                <input type="hidden" runat="server" id="hiProjectScale" tablename="EPMS_QualityEntity" field="ProjectScale" />
                <input type="hidden" runat="server" id="hiProjectNature" tablename="EPMS_QualityEntity" field="ProjectNature" />
            </td>
            <td class="td-l">填写人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtWriteUserName" runat="server" TableName="EPMS_QualityEntity"
                    Field="WriteUserName" activestatus="(23.*)" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiWriteUserID" type="hidden" runat="server" tablename="EPMS_QualityEntity" field="WriteUserID" />
                <input type="hidden" runat="server" id="hiWriteDeptName" tablename="EPMS_QualityEntity" field="WriteDeptName" />
                <input id="hiWriteDeptID" type="hidden" runat="server" tablename="EPMS_QualityEntity"
                    field="WriteDeptID" />
                <input type="hidden" runat="server" id="hiWriteTime" tablename="EPMS_QualityEntity" field="WriteTime" />
            </td>
        </tr>
        <tr>
            <td class="td-l">卷册名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectWbs" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','hiParamSpecialtyID':'ExecSpecialtyID','hiSpecialtyCode':'ExecSpecialtyCode','txtSpecialtyName':'ExecSpecialtyName'}"
                    activestatus="(23.*)" tablename="EPMS_QualityEntity" field="WBSName" req="1"
                    FilterFunction="wbsFilter()" ></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_QualityEntity" field="WBSID" />
            </td>
            <td class="td-l">卷册编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.*)" tablename="EPMS_QualityEntity"
                    field="WBSCode" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">专业
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialtyName" activestatus="(23.*)"
                    tablename="EPMS_QualityEntity" field="SpecialtyName" readonly="readonly" class="kpms-textbox" />
                <input type="hidden" runat="server" id="hiParamSpecialtyID" tablename="EPMS_QualityEntity"
                    field="ParamSpecialtyID" />
                <input type="hidden" runat="server" id="hiSpecialtyCode" tablename="EPMS_QualityEntity"
                    field="SpecialtyCode" />
            </td>
            <td class="td-l">鉴定状态
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblQualityState" activestatus="(23.*)" RepeatDirection="Horizontal" />
                <input type="hidden" runat="server" id="hiQualityState" field="QualityState" tablename="EPMS_QualityEntity" />
            </td>
            <td class="td-l">鉴定人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtConfirmUserName" TableName="EPMS_QualityEntity" Field="ConfirmUserName" 
                                          readonly="readonly" class="kpms-textbox"/>
                <input type="hidden" runat="server" id="hiConfirmUserID" tablename="EPMS_QualityEntity" field="ConfirmUserID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">信息来源<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQualitySource" req="1" errmsg="请选择信息来源"
                    field="QualitySource" tablename="EPMS_QualityEntity" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">信息分类<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQualityClass" field="QualityClass"
                    tablename="EPMS_QualityEntity" activestatus="(23.*)" req="1" />
            </td>
            <td colspan="2" class="td-m"></td>
        </tr>
        <tr>
            <td class="td-l">内容摘要<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualityContent" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="2048" field="QualityContent"
                    tablename="EPMS_QualityEntity" activestatus="(23.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>

        <tr>
            <td class="td-l">原因分析<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbCauseAnalysis" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="1024" field="CauseAnalysis"
                    tablename="EPMS_QualityEntity" activestatus="(23.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">改进、处理情况<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualityMeasure" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="2048" field="QualityMeasure"
                    tablename="EPMS_QualityEntity" activestatus="(23.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">反馈落实意见<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbFeedback" runat="server" CssClass="kpms-textarea" req="1"
                                        EnableTheming="false" TextMode="MultiLine" maxtext="512" field="ApproveOpinion"
                                        tablename="EPMS_QualityEntity" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiQualityID" runat="server" field="QualityID" tablename="EPMS_QualityEntity" />
    <input type="hidden" runat="server" id="hiQualityCode" field="QualityCode" tablename="EPMS_QualityEntity" />
    <input type="hidden" id="hiFlag" runat="server" field="Flag" tablename="EPMS_QualityEntity" value="1"/>
    <script type="text/javascript">

        function wbsFilter() {
            var orgId = $('#<%=hiOrganizationId.ClientID %>').val();
            return { OrganizationID: orgId, WBSType: '<%=(int)WBSMode.任务管理 %>' };
        }

    </script>
</asp:Content>
