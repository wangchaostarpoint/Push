<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QualityUsingEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.QualityUsingEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="质量信息及克服常见差错措施" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtProjectName" runat="server" readonly="readonly"
                    activestatus="(23.*)" class="kpms-textbox" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                    activestatus="(23.*)" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                卷册名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSName" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox" />
                <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_QualityUsing" field="WBSID" />
            </td>
            <td class="td-l">
                卷册编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专业
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialtyName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" />
            </td>
            <td class="td-l">
                填写人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtWriteUserName" runat="server" TableName="EPMS_QualityUsing"
                    Field="WriteUserName" activestatus="(23.*)" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input id="hiWriteUserID" type="hidden" runat="server" tablename="EPMS_QualityUsing"
                    field="WriteUserID" />
            </td>
            <td class="td-l">
                填写日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtWriteTime" runat="server" TableName="EPMS_QualityUsing"
                    Field="WriteTime" activestatus="(23.*)" req="1" class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                信息来源<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQualitySource" req="1" errmsg="请选择信息来源"
                    field="QualitySourceID" tablename="EPMS_QualityUsing" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiQualitySource" tablename="EPMS_QualityUsing"
                    field="QualitySource" />
            </td>
            <td class="td-l">
                信息分类<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQualityClass" field="QualityClass"
                    tablename="EPMS_QualityUsing" activestatus="(23.*)" req="1" />
            </td>
            <td class="td-l">
                信息级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlImportanceLevel" field="ImportanceLevel"
                    tablename="EPMS_QualityUsing" activestatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主题词<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualityTheme" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="256" field="QualityTheme"
                    tablename="EPMS_QualityUsing" activestatus="(23.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                信息内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualityContent" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="2048" field="QualityContent"
                    tablename="EPMS_QualityUsing" activestatus="(23.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                克服预防措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbQualityMeasure" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="2048" field="QualityMeasure"
                    tablename="EPMS_QualityUsing" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="1024" field="Memo" tablename="EPMS_QualityUsing"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!--主键-->
    <input type="hidden" id="hiQualityUsingID" runat="server" field="QualityUsingID"
        tablename="EPMS_QualityUsing" />
    <input type="hidden" id="hiQualityState" runat="server" field="QualityState" tablename="EPMS_QualityUsing"
        value="1" />
    <input type="hidden" id="hiFlag" runat="server" field="Flag" tablename="EPMS_QualityUsing"
        value="1" />
    <input type="hidden" id="hiWriteDeptID" runat="server" field="WriteDeptID" tablename="EPMS_QualityUsing" />
    <input type="hidden" id="hiWriteDeptName" runat="server" field="WriteDeptName" tablename="EPMS_QualityUsing" />
    <script type="text/javascript">
     
    </script>
</asp:Content>
