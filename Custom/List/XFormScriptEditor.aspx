<%@ Page Title="页面脚本设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="XFormScriptEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XFormScriptEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td class="td-m">
                        <asp:TextBox runat="server" ID="tbScript" EnableTheming="false" CssClass="kpms-textarea"
                            TextMode="MultiLine" Style="width: 95%">                      
                        </asp:TextBox>
                        <input runat="server" type="hidden" id="hiScript" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <hr />
    <script type="text/javascript">



        function Save() {
            $("#<%=hiScript.ClientID %>").val(encodeURIComponent($("#<%=tbScript.ClientID %>").val()));
            if (!checkReqField()) {
                return false;
            }
            parent.returnValue = $("#<%=hiScript.ClientID %>").val();
            return true;
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td colspan="4" align="right">
                        <asp:LinkButton runat="server" ID="btnSave" OnClientClick="return Save();" OnClick="btnSave_Click">
                           <span>确定</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="parent.returnValue = null;closeWindow();return false;">
                            <span>取消</span>
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
