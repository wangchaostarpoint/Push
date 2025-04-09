<%@ Page Language="C#" AutoEventWireup="true" Title="业务类型参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamBusinessTypeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamBusinessTypeEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                业务类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbType" TableName="EPMS_PARAMBUSINESSTYPE"
                    Field="BUSINESSTYPE" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMBUSINESSTYPE"
                    Field="DESCRIPTION" activestatus="(23.*)" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                包括的业务板块
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAll" Text="选择全部业务板块" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cbl" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMBUSINESSTYPE" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^[1-9]{0,2}$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMBUSINESSTYPE"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMBUSINESSTYPE" field="PARAMBUSINESSTYPEID"
        runat="server" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            initCBoxAll('<%=cbl.ClientID %>', '<%=cbAll.ClientID %>');
            $('#<%=cbl.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cbl.ClientID %>', '<%=cbAll.ClientID %>');
            });

            $('#<%=cbAll.ClientID %>').live('change', function () {
                initCBoxList('<%=cbl.ClientID %>', '<%=cbAll.ClientID %>');
            });
        }

    </script>
</asp:Content>
