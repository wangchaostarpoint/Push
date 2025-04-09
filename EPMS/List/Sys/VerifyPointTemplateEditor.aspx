<%@ Page Language="C#" AutoEventWireup="true" Title="校审要点模板详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="VerifyPointTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.VerifyPointTemplateEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">卷册名称
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtRollName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSTemplateSelector.aspx"
                    FilterFunction="wbsFilter()" activestatus="(23.*)" ResultForControls="{'txtWBSCode':'WBSCode','hiWBSTemplateID':'id'}"></zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">卷册编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" readonly="readonly" activestatus="(23.*)"
                    class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
                <%-- <zhongsoft:LightTextBox runat="server" ID="tbParentName" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>--%>
                <input type="hidden" runat="server" id="hiWBSTemplateID" tablename="EPMS_WBSBookTemplate"
                    field="WBSTemplateID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">校审要点<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbVerifPoint" TableName="EPMS_VerifyPointTemplate"
                    Field="VerifyPoint" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">校审角色<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRole" TableName="EPMS_VerifyPointTemplate"
                    Field="VerifyRole" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_VerifyPointTemplate"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否启用
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_VerifyPointTemplate"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_VerifyPointTemplate" field="VerifyPointTemplateID"
        runat="server" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

        function wbsFilter() {
            var projTempID = "<%=ProjTempID %>";
            return { ProjTempID: projTempID };
        }
    </script>
</asp:Content>
