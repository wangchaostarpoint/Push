<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamCarryforwardEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamCarryforwardEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                结转参数名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlParamScheduleBase" runat="server" req="1" activestatus="(23.*)"
                    field="ParamScheduleBaseID" tablename="MCM_PARAMCARRYFORWARD">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属拆分模板<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParamBase" field="PARAMSPLITBASEID"
                    tablename="MCM_PARAMCARRYFORWARD" req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                填写类型
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlShowType" field="SHOWTYPE" tablename="MCM_PARAMCARRYFORWARD"
                    activestatus="(23.*)">
                    <asp:ListItem Text="请选择" Value=""></asp:ListItem>
                    <asp:ListItem Text="天数" Value="Day"></asp:ListItem>
                    <asp:ListItem Text="比例" Value="Rate"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" field="SORT" tablename="MCM_PARAMCARRYFORWARD"
                    regex="^\d+$" errmsg="请填写两位正整数！" class="kpms-textbox" MaxLength="2" Width="30px"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiCarryforward" field="CARRYFORWARDID" tablename="MCM_PARAMCARRYFORWARD" />
    <!---是否启用--->
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MCM_PARAMCONTRACTTYPE" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
