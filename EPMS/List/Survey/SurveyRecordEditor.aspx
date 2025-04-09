<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyRecordEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Survey.SurveyRecordEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="作业记录" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                专业
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialtyID" tablename="EPMS_SurveyRecordContent"
                    field="SpecialtyId" ActiveStatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_SurveyRecordContent"
                    field="SpecialtyName" />
                <input type="hidden" id="hiSpecialtyCode" name="hiSpecialtyCode" runat="server" tablename="EPMS_SurveyRecordContent"
                    field="SpecialtyCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <asp:Label ID="lbInspect" runat="server" Text="确认记录"/>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbInspectCondition" runat="server" maxtext="1024" TableName="EPMS_SurveyRecordContent"
                    Field="InspectCondition" ActiveStatus="(23.*)" EnableTheming="false" CssClass="kpms-textarea"
                    TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <asp:Label ID="lbExecute" runat="server" Text="默认执行情况"/>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbExecuteCondition" runat="server" maxtext="1024" TableName="EPMS_SurveyRecordContent"
                    Field="ExecuteCondition" EnableTheming="false" CssClass="kpms-textarea" TextMode="MultiLine" ActiveStatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiSurveyRecordContentId" name="hiSurveyRecordContentId"
        runat="server" tablename="EPMS_SurveyRecordContent" field="SurveyRecordContentId" />
    <input type="hidden" id="hiFlag" name="hiFlag" runat="server" tablename="EPMS_SurveyRecordContent"
        field="Flag" value="1" />
    <input type="hidden" id="hiFormID" name="hiFormID" runat="server" tablename="EPMS_SurveyRecordContent"
        field="FormID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
