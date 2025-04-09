<%@ Page Title="优秀项目获奖编辑" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="OSProjectAwardEditor.aspx.cs" Inherits="Zhongsoft.Portal.QSM.List.OSProjectAwardEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    TableName="QSM_OSProjectAwardRecord" Field="ProjectName" activestatus="(23.*)"
                    req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="QSM_OSProjectAwardRecord"
                    field="ProjectID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="QSM_OSProjectAwardRecord"
                    Field="ProjectCode" />
            </td>
            <td class="td-l">
                专业
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" req="1" activestatus="(23.*)"
                    field="Specialty" tablename="QSM_OSProjectAwardRecord">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目设总
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectManagerName" field="ProjectManagerName"
                    tablename="QSM_OSProjectAwardRecord" activestatus="(23.*)" SourceMode="SelectorPage"
                    ResultAttr="name" EnableTheming="false" ResultForControls="{'hiProjectManagerID':'id','hiProjectManagerCode':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiProjectManagerCode" field="ProjectManagerCode"
                    tablename="QSM_OSProjectAwardRecord" />
                <input type="hidden" runat="server" id="hiProjectManagerID" field="ProjectManagerID"
                    tablename="QSM_OSProjectAwardRecord" />
            </td>
            <td class="td-l">
                项目总工
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectChiefName" field="ProjectChiefName"
                    tablename="QSM_OSProjectAwardRecord" activestatus="(23.*)" SourceMode="SelectorPage"
                    ResultAttr="name" EnableTheming="false" ResultForControls="{'hiProjectChiefID':'id','hiProjectChiefCode':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiProjectChiefID" field="ProjectChiefID"
                    tablename="QSM_OSProjectAwardRecord" />
                <input type="hidden" runat="server" id="hiProjectChiefCode" field="ProjectChiefCode"
                    tablename="QSM_OSProjectAwardRecord" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAwardName" TableName="QSM_OSProjectAwardRecord" activestatus="(23.*)"
                    Field="AwardName" runat="server" CssClass="kpms-textbox" maxtext="64" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                获奖级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAwardRank" TableName="QSM_OSProjectAwardRecord" activestatus="(23.*)"
                    Field="AwardRank" runat="server" CssClass="kpms-textbox" maxtext="64" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                授奖单位<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAwardDept" TableName="QSM_OSProjectAwardRecord" activestatus="(23.*)"
                    Field="AwardDept" runat="server" CssClass="kpms-textbox" maxtext="64" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                获奖等级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAwardLevel" req="1" activestatus="(23.*)"
                    field="AwardLevel" tablename="QSM_OSProjectAwardRecord">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖证书或文件编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAwardCode" TableName="QSM_OSProjectAwardRecord" activestatus="(23.*)"
                    Field="AwardCertificateCode" runat="server" CssClass="kpms-textbox" maxtext="64"
                    req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                授奖年度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAwardYear" req="1" activestatus="(23.*)"
                    field="AwardYear" tablename="QSM_OSProjectAwardRecord">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                登记时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtRecordDate" runat="server" class="kpms-textbox-date"
                    req="1" field="RecordDate" tablename="QSM_OSProjectAwardRecord" readonly="readonly"
                    activestatus="(23.*)" />
            </td>
            <td class="td-m" colspan="2" />
        </tr>
        <tr>
            <td class="td-l">
                参加人
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtParticipantUsers" activestatus="(23.*)"
                    IsMutiple="true" SourceMode="SelectorPage" EnableTheming="false" OnClientClick="return batchAddUser();">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiParticipantUsers" tablename="QSM_OSProjectAwardRecord"
                    field="ParticipantUsers" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖人
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtAwardUsers" activestatus="(23.*)"
                    SourceMode="SelectorPage" EnableTheming="false" OnClientClick="return batchAddUser2();">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiAwardUsers" tablename="QSM_OSProjectAwardRecord"
                    field="AwardUsers" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="1024" field="Memo" tablename="QSM_OSProjectAwardRecord"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiRecordID" type="hidden" tablename="QSM_OSProjectAwardRecord" field="OSProjectAwardRecordID"
        runat="server" />
    <input id="hiFlag" type="hidden" tablename="QSM_OSProjectAwardRecord" field="Flag"
        value="1" runat="server" />
    <input id="hiUserXML" type="hidden" runat="server" />
    <asp:Button ID="btnAddUser" runat="server" OnClick="btnAddUser_Click" Style="display: none" />
    <asp:Button ID="btnAddUser2" runat="server" OnClick="btnAddUser2_Click" Style="display: none" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }      

        function batchAddUser() {
            var param = new InputParamObject("m");
            var userValue = $("#<%=hiParticipantUsers.ClientID%>").val();
            $("#<%=hiUserXML.ClientID%>").val(userValue)
            getEPMSUser('<%=hiUserXML.ClientID %>', param, null, addUser);
            return false;
        }

        function addUser() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddUser,"")%>;
        }
        
        function batchAddUser2() {
            var param = new InputParamObject("m");            
            var userValue = $("#<%=hiAwardUsers.ClientID%>").val();
            $("#<%=hiUserXML.ClientID%>").val(userValue)
            getEPMSUser('<%=hiUserXML.ClientID %>', param, null, addUser2);
            return false;
        }

        function addUser2() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddUser2,"")%>;
        }
    </script>
</asp:Content>
