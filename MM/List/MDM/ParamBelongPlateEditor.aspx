<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamBelongPlateEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.ParamBelongPlateEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                板块名称<span class="req-star">*</span>
            </td>
            <td>
                <zhongsoft:LightTextBox ID="tbPlateName" runat="server" MaxLength="32" field="BELONGPLATENAME"
                    req="1" tablename="MDM_PARAMBELONGPLATE" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" runat="server" MaxLength="3" TableName="MDM_PARAMBELONGPLATE"
                    Field="SORT" ActiveStatus="(23.*)" regex="^[0-9]\d{0,3}$" errmsg="请输入整数" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否总包板块<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbIsGeneral" field="ISGENERAL" tablename="MDM_PARAMBELONGPLATE"
                    req="1" ActiveStatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiBelongPlateID" field="BELONGPLATEID" tablename="MDM_PARAMBELONGPLATE" />
</asp:Content>
