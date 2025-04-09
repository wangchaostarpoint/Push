<%@ Page Title="插件编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PluginEditor.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.PluginEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnValid" EnableTheming="false" DisplayStatus="(3.*)"
            CssClass="subtoolbarlink" OnClick="btnValid_Click"><span>
        <img  title="校验" src="<%=WebAppPath %>/Themes/Images/btn_finish.gif" width="15" height="15" />校验</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                插件名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPluginName" runat="server" tablename="PortalPlugin"
                    req="1" MaxLength="50" ActiveStatus="(23.*)" field="PluginName"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                程序集名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAssembly" ActiveStatus="(23.*)"
                    req="1" tablename="PortalPlugin" field="AssemblyId">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiAssembly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbClassName" runat="server" ActiveStatus="(23.*)" tablename="PortalPlugin"
                    field="ClassName" req="1" MaxLength="200"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                全局插件
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="chbIsGlobal" tablename="PortalPlugin" field="IsGlobal"
                    ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                插件类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlType" req="1" ActiveStatus="(23.*)" tablename="PortalPlugin"
                    field="PluginType">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                说明
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" tablename="PortalPlugin" field="Memo"
                    EnableTheming="false" TextMode="MultiLine" maxtext="200" ActiveStatus="(23.*)"
                    CssClass="kpms-textarea"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="PortalPlugin" field="Flag"
        value="1" />
    <input type="hidden" runat="server" id="hiPluginId" tablename="PortalPlugin" field="PluginId" />
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            $("#<%=this.tbClassName.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("../Handler/JsonSelectorHandler.ashx", {
                        term: request.term + ',plugin'
                    }, response);
                },
                minLength: 0,
                select: function (event, ui) {
                }
            }).dblclick(function () {
                $(this).autocomplete("search");
            });
        }

        $("#<%=ddlAssembly.ClientID %>").live("change", function () {
            if ($(this).val() == "") {
                return;
            }
            var old = $("#<%=hiAssembly.ClientID %>").val();
            var assembly = $(this).find("option:selected").text();
            $("#<%=hiAssembly.ClientID %>").val(assembly);
            assembly = assembly.substring(0, assembly.lastIndexOf('.'));
            if ($("#<%=tbClassName.ClientID %>").val() == "") {
                $("#<%=tbClassName.ClientID %>").val(assembly);
            }
            else if ($("#<%=tbClassName.ClientID %>").val() == old.substring(0, old.lastIndexOf('.'))) {
                $("#<%=tbClassName.ClientID %>").val(assembly);
            }
        })

    </script>
</asp:Content>
