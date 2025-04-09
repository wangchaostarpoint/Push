<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamExpendDetailEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.ParamExpendDetailEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">
                参数明细名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiParamNameID" field="PARAMEXPENDNAMEID"
                    tablename="MM_PATAMEXPENDDETAIL" />
                <input type="hidden" runat="server" id="hiParamDetailID" field="PATAMDETAILID" tablename="MM_PATAMEXPENDDETAIL" />
                <zhongsoft:LightTextBox runat="server" ID="tbParamDetailName" CssClass="kpms-textbox"
                    MaxLength="20" req="1" field="PATAMDETAILNAME" tablename="MM_PATAMEXPENDDETAIL"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                字段存储类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlType" runat="server" tablename="MM_PATAMEXPENDDETAIL"
                    req="1" field="SHOWTYPE" ActiveStatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数"
                    tablename="MM_PATAMEXPENDDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbCheck" runat="server" activestatus="(23.*)" Checked="true" />
                <input type="hidden" id="hiUse" runat="server" tablename="MM_PATAMEXPENDDETAIL" field="ISUSER" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="MM_PATAMEXPENDDETAIL"
        field="Flag" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
