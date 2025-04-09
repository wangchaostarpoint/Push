<%@ Page Title="会议内容详细" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ProjectMeetingEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectMeetingEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                讨论问题及解决办法<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbQuestion" ActiveStatus="(23.*)" MaxLength="1024" Field="Memo"
                    TableName="EPMS_ProjectMeetingContent" runat="server" req="1" TextMode="MultiLine"
                    CssClass="kpms-textarea" EnableTheming="false" Rows="4"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                执行人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" IsMutiple="true"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiPutUserID':'id','tbUserCode':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="AddUserFilter()"
                    field="ExecUserName" tablename="EPMS_ProjectMeetingContent"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiExecUserID" runat="server" field="ExecUserID" tablename="EPMS_ProjectMeetingContent" />
            </td>
            <td class="td-l">
                计划完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbExecDate" activestatus="(23.*)" EnableTheming="false"
                    class="kpms-textbox-date" readonly="readonly" field="ExecTime" tablename="EPMS_ProjectMeetingContent" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiMeetingContentID" runat="server" field="MeetingContentID"
        tablename="EPMS_ProjectMeetingContent" />
    <input type="hidden" id="hiMeetingFormID" runat="server" field="MeetingFormID" tablename="EPMS_ProjectMeetingContent" />
    <input type="hidden" id="hiOrganizationID" runat="server" />
    <input type="hidden" runat="server" id="hiUserXML" />
    <script type="text/javascript">
        function InitCustomerPlugin() {
            checkMaxLength();
        }

        //添加参与人
        //        function AddUserFilter() {
        //            var param = new InputParamObject("m");
        //            var filter = { ProjectPhaseID: "<%=hiOrganizationID.Value %>" };
        //            getDivUsersNew('<%=hiUserXML.ClientID %>', param, filter, addUser);

        //            return false;
        //        }
        function AddUserFilter() {
            var orgId = '<%=OrganizationID %>';
            //$("#<%=hiOrganizationID.ClientID %>").val();
            return { ProjectPhaseID: orgId };
        }
    </script>
</asp:Content>
