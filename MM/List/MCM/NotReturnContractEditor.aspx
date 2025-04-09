<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotReturnContractEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.NotReturnContractEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                合同名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox type="text" ID="tbContractName" runat="server" field="CONTRACTNAME"
                    req="1" tablename="MCM_CONTRACTENTITY" activestatus="(23.*)" MaxLength="64" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                承办人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtUndertakeUserName" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" maxlength="32" class="kpms-textbox" field="UNDERTAKEUSERNAME"
                    activestatus="(23.?)" />
            </td>
            <td class="td-l">
                归档时间
            </td>
            <td>
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSignDate" tablename="MCM_CONTRACTENTITY"
                    readonly="readonly" maxlength="32" class="kpms-textbox" field="SIGNDATE" activestatus="(23.?)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同编号
            </td>
            <td class="td-l">
                <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                    style="width: 120px" tablename="MCM_CONTRACTENTITY" field="CONTRACTCODE" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                合同类型<span class="req-star">*</span>
            </td>
            <td>
                <zhongsoft:LightDropDownList ID="ddlContractType" runat="server" field="PARAMCONTRACTTYPEID"
                    req="1" tablename="MCM_CONTRACTENTITY" activestatus="(3.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiContractTypeName" field="CONTRACTTYPENAME"
                    tablename="MCM_CONTRACTENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同金额（万元）
            </td>
            <td>
                <zhongsoft:XHtmlInputText ID="txtContractValue" runat="server" type="text" class="kpms-textbox-money"
                    readonly="readonly"  tablename="MCM_CONTRACTENTITY" field="CONTRACTVALUE" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" style="text-align: center">
                <asp:Button runat="server" ID="btnSureReturn" OnClientClick="return checkSubmit()"
                    Text="确定返回" OnClick="btnSubmit_Click" />
                <input type="hidden" runat="server" id="hiIsReturn" field="ISRETURN" tablename="MCM_CONTRACTENTITY" />
                <input type="hidden" runat="server" id="hiReturnDate" field="RETURNDATE" tablename="MCM_CONTRACTENTITY" />
            </td>
        </tr>
    </table>
    <!---流程主键ID-->
    <input type="hidden" runat="server" id="hiContractID" field="CONTRACTID" tablename="MCM_CONTRACTENTITY" />
    <input type="hidden" runat="server" id="hiContractState" field="CONTRACTSTATE" tablename="MCM_CONTRACTENTITY" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function checkSubmit() {
            if (!checkReqField()) {
                return false;
            }

            if ("<%=ActionType %>" == "Create" || "<%=ActionType %>" == "Update" || "<%=ActionType %>" == "Control") {
                parent.returnValue = "isSave";
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
