<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjBidOpenRecordEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.ProjBidOpenRecordEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register TagPrefix="uc1" TagName="OtherBidUnit" Src="~/MM/UI/Controls/OtherBidUnit.ascx" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtTaskName" field="MARKETPROJECTNAME"
                    tablename="MBM_TenderEntity" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                    req="1" EnableTheming="false" Writeable="false" PageWidth="850" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiTenderEntityID':'id','txtStartBidDay':'STARTBIDDATE','txtOpenAddress':'BidOpenAddress'}"
                    AfterSelect="formateDate()" OnClick="txtTaskName_Click" PageUrl="~/MM/Obsolete/TenderEntitySelector.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiTenderEntityID" field="TenderEntityID"
                    tablename="MBM_TenderEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                开标日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDay" req="1"
                    tablename="MBM_TenderEntity" readonly="readonly" class="kpms-textbox-date" field="STARTBIDDATE"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">
                开标地点
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbBidOpenAddress" field="BidOpenAddress"
                    tablename="MBM_TenderEntity" MaxLength="128" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                评标办法
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbEvaluationMethod" CssClass="kpms-textarea" runat="server"
                    activestatus="(23.*)" TextMode="MultiLine" EnableTheming="false" maxtext="512"
                    tablename="MBM_TenderEntity" field="EvaluationMethod" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                本单位参与开标人员
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectUsers" IsMutiple="true"
                    SelectPageMode="Dialog" ResultForControls="{'hiBidParticipantIDs':'id'}" EnableTheming="false"
                    PageWidth="800px" Text="本单位参与开标人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" TableName="MBM_TenderEntity"
                    field="BidParticipantNames" />
                <input type="hidden" runat="server" id="hiBidParticipantIDs" tablename="MBM_TenderEntity"
                    field="BidParticipantIDs" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    activestatus="(23.*)" EnableTheming="false" maxtext="512" tablename="MBM_TenderEntity"
                    field="Memo" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="MBM_TenderEntity"
        value="1" />
    <uc1:OtherBidUnit ID="ucOtherBidUnit" runat="server"></uc1:OtherBidUnit>
    <script>
        //格式化开标日期
        function formateDate() {
            var startBidDay = $("#<%=txtStartBidDay.ClientID %>").val();
            if (startBidDay != "") {
                $("#<%=txtStartBidDay.ClientID %>").val(parseDate(startBidDay));
            }
            return false;
        }
    </script>
</asp:Content>
