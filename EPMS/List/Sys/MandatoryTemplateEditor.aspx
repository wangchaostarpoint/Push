<%@ Page Language="C#" AutoEventWireup="true" Title="强条模板详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="MandatoryTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.MandatoryTemplateEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr runat="server" visible="false">
            <td class="td-l">工程类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjType" TableName="EPMS_MandatoryTemplate"
                    req="1" Field="ParamProjectTypeID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">专业<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" TableName="EPMS_MandatoryTemplate"
                    Field="ParamSpecialtyID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" style="white-space: nowrap;">卷册编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWBSCode" TableName="EPMS_MandatoryTemplate"
                    req="1" Field="WBSCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="white-space: nowrap;">序号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSerialCode" TableName="EPMS_MandatoryTemplate"
                    req="1" Field="SerialCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l" style="white-space: nowrap;">专业<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbSpecialtyName" TableName="EPMS_MandatoryTemplate" req="1"
                    Field="SpecialtyName" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="white-space: nowrap;">标准编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMandatoryCode" TableName="EPMS_MandatoryTemplate"
                    req="1" Field="MandatoryCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l" style="white-space: nowrap;">条款号<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbItemCode" TableName="EPMS_MandatoryTemplate"
                    req="1" Field="ItemCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="white-space: nowrap;">标准名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMandatoryName" TableName="EPMS_MandatoryTemplate"
                    Field="MandatoryName" activestatus="(23.*)" maxtext="128"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">条款内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbContent" TableName="EPMS_MandatoryTemplate"
                    Field="MandatoryContent" activestatus="(23.*)" TextMode="MultiLine" EnableTheming="false"
                    CssClass="kpms-textarea" maxtext="1024" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="white-space: nowrap;">生效时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtEffectiveTime" runat="server" type="text" class="kpms-textbox-date"
                    readonly="readonly" TableName="EPMS_MandatoryTemplate" Field="EffectiveTime" activestatus="(23.*)" />
            </td>
            <td class="td-l" style="white-space: nowrap;">失效时间
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtExpirationTime" runat="server" type="text" class="kpms-textbox-date"
                    readonly="readonly" TableName="EPMS_MandatoryTemplate" Field="ExpirationTime" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否启用
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_MandatoryTemplate"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_MandatoryTemplate" field="MandatoryTemplateID"
        runat="server" />
    <script type="text/javascript">
        function initCustomerPlugin() {

        }
    </script>
</asp:Content>
