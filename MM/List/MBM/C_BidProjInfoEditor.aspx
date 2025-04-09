<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_BidProjInfoEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.C_BidProjInfoEditor" MasterPageFile="~/UI/Master/ObjectEditorNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbMarketProjectName" runat="server" MaxLength="256
                " field="MARKETPROJECTNAME" req="1" tablename="MDM_MIDMARKETPROJECT" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="tbMarketProjectCode" runat="server" field="MarketProjectCode"
                    tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工程类别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtProjTypeName" runat="server" field="TYPENAME"
                    tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                经营经理
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtManagerName" runat="server" field="MANAGERNAME"
                    tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目设总
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtDesignName" runat="server" field="DESIGNNAME"
                    tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                预估总合同额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractValue" CssClass="kpms-textbox-money" runat="server"
                    Style="text-align: right" Width="120" tablename="MDM_MIDMARKETPROJECT" field="CONTRACTVALUE"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                进度要求
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProgressRequire" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                    field="PROGRESSREQUIRE" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                质量要求
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbQualityRequire" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                    field="QUALITYREQUIRE" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                其他要求
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbOtherRequire" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                    field="OTHERREQUIRE" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold" colspan="4">
                投标信息
            </td>
        </tr>
        <tr>
            <td class="td-l">
                投标阶段
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtBidPhaseName" runat="server" field="PHASENAME"
                    tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" readonly="readonly" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                招标单位<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbUnit" runat="server" MaxLength="256" field="UNIT" req="1"
                    tablename="MDM_MIDMARKETPROJECT" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                开标时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDate" tablename="MDM_MIDMARKETPROJECT"
                    readonly="readonly" class="kpms-textbox-date" field="STARTBIDDAY" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                实际开标时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtFactDate" runat="server" field="FACTBIDOPENDATE"
                    tablename="MDM_MIDMARKETPROJECT" readonly="readonly" class="kpms-textbox-date"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                投标结果
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtResult" runat="server" field="RESULT"
                    tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                中标单位
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtGain" runat="server" field="GAINCUSTOMERNAME"
                    tablename="MDM_MIDMARKETPROJECT" class="kpms-textbox" activestatus="(23.*)" />
            </td>
        </tr>
    </table>
    <!----工程主键ID---->
    <input type="hidden" runat="server" id="hiMidMarketProjectID" tablename="MDM_MIDMARKETPROJECT"
        field="MIDMARKETPROJECTID" />
    <input type="hidden" runat="server" id="hiGeneralProjectName" value="总承包" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
