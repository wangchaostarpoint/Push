<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseApplyEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.PurchaseApplyEditor" MasterPageFile="~/UI/Master/ObjectEditorNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                原流水号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbApplyCode" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="APPLYCODE" activestatus="(23.*)" ReadOnly="true" />
            </td>
            <td class="td-l">
                变更流水号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbChangeCode" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="APPLYBCODE" activestatus="(23.*)" ReadOnly="true" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProjName" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="PROJECTNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjCode" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="PROJECTCODE" ReadOnly="true" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                工程合同状态
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbState" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="SIGNSTATE" ReadOnly="true" activestatus="(23.*)" />
                <input type="hidden" id="hiContractState" tablename="MBM_PURCHASEAPPLYORBGFORM" field="CONTRACTSTATE"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购任务
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbTaskName" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="TASKNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购申请部门
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbDept" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="APPLYDEPTNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                申请批准时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtCheckDate" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    readonly="readonly" class="kpms-textbox-date" field="ReadDateTime" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购方式
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbType" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="PURCHASETYPE" ReadOnly="true" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                采购承办人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPurchaserName" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="PURCHASEHANDLERNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                估算价格（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbEstinatedPrice" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    CssClass="kpms-textbox-money" EnableTheming="false" field="ESTIMATEDPRICE" ReadOnly="true"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">
                采购价格（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbMoney" runat="server" tablename="MBM_PURCHASEAPPLYORBGFORM"
                    field="MONEY" activestatus="(23.*)" CssClass="kpms-textbox-money" EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                办理状态
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblMakeState" runat="server" RepeatDirection="Horizontal"
                    field="MAKESTATE" tablename="MBM_PURCHASEAPPLYORBGFORM" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiApplyId" tablename="MBM_PURCHASEAPPLYORBGFORM" field="APPLYID"
        runat="server" />
</asp:Content>
