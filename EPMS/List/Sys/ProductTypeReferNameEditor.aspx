<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductTypeReferNameEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ProductTypeReferNameEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="图名对应成品等级详细" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">图纸名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbProductName" TableName="EPMS_ProductTypeReferName"
                    Field="ProductName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">专业<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpe" TableName="EPMS_ProductTypeReferName" Field="SpecialityID" ActiveStatus="(23.*)" req="1" />
                <input id="hiSpecialityName" type="hidden" runat="server" tablename="EPMS_ProductTypeReferName" field="SpecialityName" />
            </td>
            <td class="td-l">成品类型<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProductType" TableName="EPMS_ProductTypeReferName" Field="ParamProductID" ActiveStatus="(23.*)" req="1" />
                <input id="hiProductType" type="hidden" runat="server" tablename="EPMS_ProductTypeReferName" field="ProductType" />
            </td>
        </tr>
        <tr>
            <td class="td-l">说明
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_ProductTypeReferName"
                    Field="Memo" activestatus="(23.*)" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否启用
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ProductTypeReferName"
                    Field="Flag" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ProductTypeReferName" field="ProductTypeReferNameID"
        runat="server" />
    <%--    目前只填充施工图阶段的适用于成品四级校审流程的成品等级--%>
    <input id="hiSPhaseID" type="hidden" runat="server" value="40" />
    <input id="hiVerifyFormID" type="hidden" runat="server" value="231" />
</asp:Content>

