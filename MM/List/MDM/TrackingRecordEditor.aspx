<%@ Page Language="C#" Title="跟踪记录信息详细" AutoEventWireup="true" CodeBehind="TrackingRecordEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.TrackingRecordEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">所属工程包
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongProjectPackage" readonly="readonly" class="kpms-textbox"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">工程名称</td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" readonly="readonly" class="kpms-textbox"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">记录时间<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRecordTime" readonly="readonly" class="kpms-textbox-date"
                    req="1" field="RecordTime" tablename="MM_TrackingRecord" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">跟踪主题<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbTheme" runat="server" TableName="MM_TrackingRecord"
                    req="1" Field="Theme" ActiveStatus="(23.*)" MaxLength="128" CssClass="kpms-textbox"
                    EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">跟踪内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbContent" runat="server" TableName="MM_TrackingRecord"
                    req="1" Field="Content" ActiveStatus="(23.*)" TextMode="MultiLine" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" TableName="MM_TrackingRecord"
                    Field="Memo" ActiveStatus="(23.*)" TextMode="MultiLine" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiTrackingRecordID" runat="server"
        tablename="MM_TrackingRecord" field="TrackingRecordID" />
    <input type="hidden" id="hiFlag" name="hiFlag" runat="server" tablename="MM_TrackingRecord"
        field="Flag" value="1" />
    <input type="hidden" id="hiMarketInfoID" runat="server" tablename="MM_TrackingRecord"
        field="MarketInfoID" />
    <script type="text/javascript">
</script>
</asp:Content>
