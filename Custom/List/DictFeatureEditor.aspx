<%@ Page Title="数据字典默认页编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="DictFeatureEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DictFeatureEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnValid" EnableTheming="false" DisplayStatus="(3.*)"
            CssClass="subtoolbarlink" OnClientClick="return showPreView();">
            <span><img  src="../../Themes/Images/btn-preview.png" width="16" height="16" />预览</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td colspan="2" class="tz-title">
                        基本信息
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        字典名称
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbDictName" runat="server" ReadOnly="true" tablename="BD_Dict"
                            field="DictName"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        字典编码
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox ID="tbDictCode" runat="server" ReadOnly="true" tablename="BD_Dict"
                            field="DictCode"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        流程受控类型
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlWorkflowType" tablename="BD_DictFeature"
                            field="WorkflowType" req="1" ActiveStatus="(23.*)" Width="85%">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="tz-title">
                        默认页
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        默认编辑页
                    </td>
                    <td class="td-r">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiEditorPage" tablename="BD_DictFeature"
                                        field="EditorPage" />
                                    <zhongsoft:XHtmlInputText type="text" ID="txtEditorPage" runat="server" readonly="readonly"
                                        style="width: 100%" MaxLength="250" class="kpms-textbox">
                                    </zhongsoft:XHtmlInputText>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnEditorPage" OnClientClick="return setEditorPage();"
                                        OnClick="btnEditorPage_Click" Style="height: 18px; width: 20px; padding: 0px"
                                        CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        默认列表页
                    </td>
                    <td class="td-r">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiListPage" tablename="BD_DictFeature" field="ListPage" />
                                    <zhongsoft:XHtmlInputText type="text" ID="txtListPage" runat="server" readonly="readonly"
                                        style="width: 100%" MaxLength="250" class="kpms-textbox">
                                    </zhongsoft:XHtmlInputText>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnListPage" OnClientClick="return setListPage();"
                                        OnClick="btnListPage_Click" Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up"
                                        EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        默认选择页
                    </td>
                    <td class="td-r">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiSelectorPage" tablename="BD_DictFeature"
                                        field="SelectorPage" />
                                    <zhongsoft:XHtmlInputText type="text" ID="txtSelectorPage" runat="server" readonly="readonly"
                                        style="width: 100%" MaxLength="250" class="kpms-textbox">
                                    </zhongsoft:XHtmlInputText>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnSelectorPage" OnClientClick="return setSelectorPage();"
                                        OnClick="btnSelectorPage_Click" Style="height: 18px; width: 20px; padding: 0px"
                                        CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <input type="hidden" runat="server" id="hiDictId" tablename="BD_DictFeature" field="DictId" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>

        function setEditorPage() {
            var tableCode = $("#<%=tbDictCode.ClientID%>").val();
            var json = { TableCode: tableCode, DialogType: "DictFeature", PageType: "1" };
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", json);
          
            var re = showModal(encodeURI(url), $("#<%=hiEditorPage.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiEditorPage.ClientID%>").val(re);
                return true;
            }
            return false;
        }

        function setListPage() {
            var tableCode = $("#<%=tbDictCode.ClientID%>").val();
            var json = { TableCode: tableCode, DialogType: "DictFeature", PageType: "0" };
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", json);
            var re = showModal(encodeURI(url), $("#<%=hiListPage.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiListPage.ClientID%>").val(re);
                return true;
            }
            return false;
        }

        function setSelectorPage() {
            var tableCode = $("#<%=tbDictCode.ClientID%>").val();
            var json = { TableCode: tableCode, DialogType: "DictFeature", PageType: "2" };
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", json);
            var re = showModal(encodeURI(url), $("#<%=hiSelectorPage.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiSelectorPage.ClientID%>").val(re);
                return true;
            }
            return false;
        }



        function showPreView() {
            var url = $("#<%=txtEditorPage.ClientID %>").val();
            if (url != "") {
                var editorPage = $("#<%=hiEditorPage.ClientID%>").val();
                var json = jQuery.parseJSON(editorPage);
                var secid = json.PageId;
                var strHeight = json.Height;
                var strWidth = json.Width;
                var height = strHeight == "" ? 630 : strHeight;
                var width = strWidth == "" ? 630 : strWidth;
                url = buildQueryUrl(url, { "secid": secid });
                showModal(url, "", width, height);
            }
            return false;
        }
    </script>
</asp:Content>
