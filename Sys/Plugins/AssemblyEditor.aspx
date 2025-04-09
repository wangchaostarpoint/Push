<%@ Page Title="程序集编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="AssemblyEditor.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.AssemblyEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnUpdate" CssClass="subtoolbarlink"  OnClick="btnUpdate_Click"
            DisplayStatus="(3.*)" EnableTheming="false"><span>更新插件</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                程序集名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAssemblyName" runat="server" ReadOnly="true" tablename="PortalAssembly"
                    field="AssemblyName" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr runat="server" id="trName" displaystatus="(23.*)">
            <td class="td-l">
                上传<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:FileUpload ID="fileUpload" runat="server" Width="85%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" tablename="PortalAssembly"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" EnableTheming="false" MaxLength="200"
                    field="Memo"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiAssemblyId" tablename="PortalAssembly"
        field="AssemblyId" />
    <input type="hidden" runat="server" id="hiFlag" tablename="PortalAssembly" field="Flag"
        value="1" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
        }
    </script>
</asp:Content>
