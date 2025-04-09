<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDeleveryReceiveManEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Delevery.ProductDeleveryReceiveManEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                资料交付单编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProductDeliverCode" runat="server" field="ProductDeliverCode"
                    readonly="readonly" tablename="EPMS_PublishDeliver" activestatus="(23.?)" class="kpms-textbox" />
            </td>
            <td colspan="4" class="td-m">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                客户名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCustomerName" field="CustomerName" tablename="EPMS_PublishDeliver"
                    activestatus="(23.?)" MaxLength="64" req="1" />
            </td>
            <td class="td-l">
                接收人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbReceiveManName" field="ReceiveManName"
                    tablename="EPMS_PublishDeliver" activestatus="(3.*)" MaxLength="16" />
            </td>
            <td class="td-l">
                交付客户日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtDeliverCustomerDate" runat="server"
                    readonly="readonly" TableName="EPMS_PublishDeliver" Field="DeliverCustomerDate"
                    ActiveStatus="(3.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiPublishDeliverID" name="hiPublishDeliverID" runat="server"
        tablename="EPMS_PublishDeliver" field="PublishDeliverID" />
</asp:Content>
