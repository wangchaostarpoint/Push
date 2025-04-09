<%@ Page Title="项目收费信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ContractChargeAdd.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractChargeAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                到款通知单名称
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightDropDownList runat="server" ID="ddlNoticeName" class="kpms-textbox" req="1" ActiveStatus="(23.*)"/>
                <input type="hidden" runat="server" id="hidDPAYREQUISITIONNAME" tablename="FM_RECEIVECORPDETAIL" field="DPAYREQUISITIONNAME" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                到款时间
            </td>
            <td class="td-r">
            <input id="txtDeliveryDate" type="text" runat="server" class="kpms-textbox-date"
                readonly="readonly" req="1" tablename="FM_RECEIVECORPDETAIL" field="RECEIVEDATE" ActiveStatus="(23.*)"/>
            </td>
            <td class="td-l">到款金额（万元）</td>
            <td class="td-r"><zhongsoft:LightTextBox runat="server" ID="txtMoeny" class="kpms-textbox-money" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="到款金额只能填写数字且最多两位小数" req="1" tablename="FM_RECEIVECORPDETAIL" field="CHARGEAMOUNT" ActiveStatus="(23.*)"/></td>
            <td class="td-m" colspan="2" style="width: 30%"></td>
        </tr>
    </table>
    <input type="hidden" id="hidRECEIVECORPDETAILID" runat="server" tablename="FM_RECEIVECORPDETAIL" field="RECEIVECORPDETAILID"/>
    <input type="hidden" id="hidPROJECTID" runat="server" />
    <input type="hidden" id="hidRECEIVEPROJECTDETAILID" runat="server" />
        <input type="hidden" id="hidCONTRACTCHARGEFORMID" runat="server" field="CONTRACTCHARGEFORMID" tablename="FM_RECEIVECORPDETAIL" value="NULL"/>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
