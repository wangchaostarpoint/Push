<%@ Page Language="C#" AutoEventWireup="true" Title="项目模块系统区域参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamProjectModuleEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectModuleEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                代字<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCode" TableName="EPMS_PARAMPROJECTMODULE"
                    Field="ModuleCode" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TableName="EPMS_PARAMPROJECTMODULE"
                    Field="ModuleName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblType" RepeatDirection="Horizontal" TableName="EPMS_PARAMPROJECTMODULE"
                    Field="ModuleType" activestatus="(23.*)" req="1">
                    <asp:ListItem Value="模块">模块</asp:ListItem>
                    <asp:ListItem Value="系统">系统</asp:ListItem>
                    <asp:ListItem Value="区域">区域</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMPROJECTMODULE"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                适用的项目类型
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllProjType" Text="选择全部项目类型" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMPROJECTMODULE" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMPROJECTMODULE"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMPROJECTMODULE" field="ParamProjectModuleId"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            //适用的项目类型
            initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            $('#<%=cblProjType.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });

            $('#<%=cbAllProjType.ClientID %>').live('change', function () {
                initCBoxList('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });
        }
    </script>
</asp:Content>
