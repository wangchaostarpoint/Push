<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="TM_ParamNameEditor.aspx.cs" Inherits="Zhongsoft.Portal.TSM.List.TM_ParamNameEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">
                参数名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiParamNameID" field="ParamNameID" tablename="TSM_TECHPROJECTPARAM" />
                <zhongsoft:LightTextBox runat="server" ID="tbParamName" CssClass="kpms-textbox" MaxLength="20"
                    req="1" field="ParamName" tablename="TSM_TECHPROJECTPARAM" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数"
                    tablename="TSM_TECHPROJECTPARAM" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                说明
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="TSM_TECHPROJECTPARAM" field="Remark"
                    ActiveStatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="TSM_TECHPROJECTPARAM" field="Flag" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
