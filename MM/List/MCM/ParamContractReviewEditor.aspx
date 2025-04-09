<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamContractReviewEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamContractReviewEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                评审内容<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbReviewContent" runat="server" req="1" activestatus="(23.*)"
                    MaxLength="64" field="REVIEWCONTENT" tablename="MCM_PARAMCONTRACTREVIEW"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                评审角度
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList ID="ddlReviewAngle" activestatus="(23.*)" field="REVIEWANGLE"
                    runat="server" tablename="MCM_PARAMCONTRACTREVIEW">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否总包要点
            </td>
            <td>
                <asp:RadioButtonList runat="server" ID="rbIsGeneral" field="ISGENERAL" tablename="MCM_PARAMCONTRACTREVIEW"
                    RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" field="SORT" tablename="MCM_PARAMCONTRACTREVIEW"
                    regex="^\d+$" errmsg="请填写两位正整数！" class="kpms-textbox" MaxLength="2" Width="30px"
                    req="1" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiParamContractReviewID" field="PARAMCONTRACTREVIEWID"
        tablename="MCM_PARAMCONTRACTREVIEW" />
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MCM_PARAMCONTRACTREVIEW" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
