<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishSingleCostEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.PublishSingleCostEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="出版单价维护详细" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">单项名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbSingleCostName" TableName="EPMS_PublishSingleCost"
                    Field="SingleCostName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">印制类型<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCostType" TableName="EPMS_PublishSingleCost" Field="CostType" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">单价<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSingleCost" TableName="EPMS_PublishSingleCost" DataType="Decimal2" CssClass="kpms-textbox-money" EnableTheming="false"
                    Field="SingleCost" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">说明
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_PublishSingleCost"
                    Field="Memo" activestatus="(23.*)" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" TableName="EPMS_PublishSingleCost" req="1"
                    Field="Sort" activestatus="(23.*)" CssClass="kpms-textbox-money" DataType="PositiveInteger"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PublishSingleCost"
                    Field="Flag" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PublishSingleCost" field="PublishSingleCostID"
        runat="server" />
</asp:Content>
