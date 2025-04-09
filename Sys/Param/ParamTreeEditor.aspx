<%@ Page Title="枚举联级设置编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamTreeEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Param.ParamTreeEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">上级名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbParentName" ReadOnly="true" Width="80%" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbItemName" req="1" field="Name" Width="80%" tablename="ParamLevel" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtCode" req="1" MaxLength="18" Width="50%"
                    field="Code" tablename="ParamLevel" activestatus="(23.*)"></zhongsoft:LightTextBox>
                <asp:LinkButton runat="server" ID="btnGetCode" EnableTheming="false" CssClass="subtoolbarlink" displaystatus="(2.*)" OnClick="btnGetCode_Click"> <span style=" color:Blue;">自动获取编号</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否可用<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblIsEnable" runat="server" field="IsEnable" tablename="ParamLevel"
                    RepeatDirection="Horizontal" req="1">
                    <asp:ListItem Text="是" Value="True" Selected="True">是</asp:ListItem>
                    <asp:ListItem Text="否" Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" req="1" MaxLength="4" DataType="UInteger" Width="50" field="Sort" tablename="ParamLevel" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-m" colspan="5">
                <asp:TextBox runat="server" ID="tbRemark" field="Memo" tablename="ParamLevel" CssClass="kpms-textarea" EnableTheming="false" ActiveStatus="(23.*)" maxtext="100" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiParentId" field="ParentId" tablename="ParamLevel" />
    <input type="hidden" runat="server" id="hiId" field="ParamLevelId" tablename="ParamLevel" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="ParamLevel" /> 
    <input type="hidden" runat="server" id="hiTempletType" field="TempletType" tablename="ParamLevel" /> 
</asp:Content>


