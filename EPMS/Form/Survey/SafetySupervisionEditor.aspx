<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="绩效测量和监视记录详细"
    AutoEventWireup="true" CodeBehind="SafetySupervisionEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Survey.SafetySupervisionEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                安全监查、检查项目
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox ID="tbDetailContent" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="2048" tablename="EPMS_SupervisionDetail"
                    field="DetailContent" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                监查、检查人
            </td>
            <td class="td-r">
                <input runat="server" id="hiOperatorID" type="hidden" field="OperatorID" tablename="EPMS_SupervisionDetail" />
                <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" IsMutiple="false"
                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiOperatorID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                    activestatus="(23.*)" field="OperatorName" tablename="EPMS_SupervisionDetail" />
            </td>
            <td class="td-l">
                监查、检查时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSupervisionDate" runat="server"
                    readonly="readonly" field="SupervisionDate" tablename="EPMS_SupervisionDetail"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                监查、检查结果
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox ID="tbOperatorResult" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="2048" tablename="EPMS_SupervisionDetail"
                    field="OperatorResult" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiSupervisionDetailID" field="SupervisionDetailID"
        tablename="EPMS_SupervisionDetail" />
            <input type="hidden" runat="server" id="hiSupervisionID" field="SupervisionID"
        tablename="EPMS_SupervisionDetail" />
    <input type="hidden" runat="server" id="hiDetailTypeID" field="DetailTypeID" tablename="EPMS_SupervisionDetail" />
    <input type="hidden" runat="server" id="hiDetailTypeName" field="DetailTypeName"
        tablename="EPMS_SupervisionDetail" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_SupervisionDetail"
        value="1" />
    <script type="text/javascript" src="<%=WebAppPath %>/EM/UI/Script/EMGeneralScript.js"></script>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
