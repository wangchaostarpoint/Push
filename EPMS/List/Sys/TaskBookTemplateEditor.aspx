<%@ Page Language="C#" AutoEventWireup="true" Title="任务书模板详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="TaskBookTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.TaskBookTemplateEditor" %>

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
            <td class="td-l">任务内容、范围、分工
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbContentOrRange" TableName="EPMS_WBSBookTemplate"
                    Field="ContentOrRange" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">任务依据及条件
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbBasisOrConditions" TableName="EPMS_WBSBookTemplate"
                    Field="BasisOrConditions" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">任务原则及要求
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbPrincipleOrRequire" TableName="EPMS_WBSBookTemplate"
                    Field="PrincipleOrRequire" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">任务相关参数
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbReleParam" TableName="EPMS_WBSBookTemplate"
                    Field="ReleParam" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">技术组织措施<br />
                （技术指导书）
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbTechMeasure" TableName="EPMS_WBSBookTemplate"
                    Field="TechMeasure" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_WBSBookTemplate"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否启用
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_WBSBookTemplate"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_WBSBookTemplate" field="WBSBookTemplateID"
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
