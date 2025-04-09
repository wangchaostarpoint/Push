<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerTrackRecordEditor.aspx.cs" Title="客户跟踪记录信息"
    Inherits="Zhongsoft.Portal.MM.List.CRM.CustomerTrackRecordEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

<table class="tz-table">
    <tr>
        <td class="td-l">
            项目名称
        </td>
        <td class="td-m" colspan="3">            
            <zhongsoft:LightObjectSelector runat="server" ID="lbsMarketProject" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiMarketProjectID':'id'}"
                PageWidth="850" Text="选择项目" PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                AfterSelect="afterSelect()" />
            <input type="hidden" id="hiMarketProjectID" runat="server" field="MarketProjectID"
                tablename="CRM_CustomerTrackRecord" />
        </td>
        <td class="td-l">
            记录编号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox id="txtRecordNo" runat="server" field="RecordCode" tablename="CRM_CustomerTrackRecord"
               class="kpms-textbox" activestatus="(23.*)" />
        </td>
    </tr>
    <tr style=" display:none">
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" ID="txtProjectCode" field="MarketProjectCode"
                tablename="CRM_CustomerTrackRecord" maxlength="32" readonly="readonly"
                runat="server" activestatus="(23.*)(23.修改工作记录)" class="kpms-textbox" />
        </td>
        <div id="tdPhase" runat="server">
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText type="text" ID="txtDesignPhase" runat="server" field="PhaseNames"
                    tablename="CRM_CustomerTrackRecord" readonly="readonly" activestatus="(23.*)(23.修改工作记录)"
                    class="kpms-textbox" />
            </td>
        </div>
        <div id="tdPhaseEmpty" runat="server" visible="false">
            <td colspan="4">
            </td>
        </div>
    </tr>
    <tr>
        <td class="td-l">
            客户名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectCustomer" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                PageWidth="850" Text="选择客户" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)"
                AfterSelect="afterSelect()" field="CustomerName" tablename="CRM_CustomerTrackRecord"/>
        </td>
        <td class="td-l">
            日期<span class="req-star">*</span>
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtTrackDate" readonly="readonly"
                class="kpms-textbox-date" field="TrackDate" tablename="CRM_CustomerTrackRecord"
                activestatus="(23.*)(23.修改工作记录)" />
        </td>
    </tr>
    <div id="MeetingType" runat="server">
        <tr>
            <td class="td-l">
                会议地点<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbCustomerTrackPlace" MaxLength="128" runat="server" class="kpms-textbox"
                    field="TrackPlace" req="1" tablename="CRM_CustomerTrackRecord" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主题<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="txtTheme" runat="server" field="Theme" tablename="CRM_CustomerTrackRecord"
                    MaxLength="128" req="1" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                与会人员<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectUser" IsMutiple="true" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiMeetingUsersID':'id'}"
                PageWidth="850" Text="选择与会人员" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)"
                AfterSelect="afterSelect()" field="MeetingCustomers" tablename="CRM_CustomerTrackRecord"/>
                <input type="hidden" runat="server" id="hiMeetingUsersID" field="MeetingUsers" tablename="CRM_CustomerTrackRecord" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                客户与会人员
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtMeetingCustomers" activestatus="(23.*)"
                    maxlength="128" class="kpms-textbox" field="MeetingCustomersName" tablename="CRM_CustomerTrackRecord" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbDesignBase" Rows="6" TextMode="MultiLine" runat="server"
                    maxtext="512" req="1" CssClass="kpms-textarea" EnableTheming="false" Field="Content"
                    ActiveStatus="(23.*)" TableName="MMCustomerTrackWorkRecordID" />
            </td>
        </tr>
    </div>
    </table>
    <!--主键 -->
    <input id="hiCustomerTrackRecordID" runat="server" field="CustomerTrackRecordID" name="hiCustomerTrackRecordID"
        tablename="CRM_CustomerTrackRecord" type="hidden" />
    <input id="hiCustomerId" runat="server" field="CUSTOMERID" name="hiCustomerId" tablename="CRM_CustomerTrackRecord"
        type="hidden" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
