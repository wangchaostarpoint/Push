<%@ Page Title="参数设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="ParamEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ParamEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="td-l">
                        参数设置
                    </td>
                    <td class="td-m" colspan="3">
                        <table>
                            <tr>
                                <td valign="top">
                                    <zhongsoft:LightTextBox runat="server" ID="tbNewParam" Width="100px" MaxLength="36"
                                        DataType="EnStr"></zhongsoft:LightTextBox>
                                    <asp:DropDownList runat="server" ID="ddlType" Width="100px">
                                    </asp:DropDownList>
                                </td>
                                <td valign="top">
                                    <asp:LinkButton runat="server" ID="btnAddParam" OnClick="btnAddParam_Click"><span>添加</span></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiParams" />
                                    <input type="hidden" runat="server" id="hiSessionParams" />
                                    <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
                                    <asp:ListBox runat="server" ID="lbParam" Width="210px" Height="100px" AutoPostBack="true"
                                        OnSelectedIndexChanged="lbParam_Change"></asp:ListBox>
                                    <br />
                                    <asp:Label runat="server" ID="lblType"></asp:Label>
                                </td>
                                <td valign="bottom">
                                    <asp:LinkButton runat="server" ID="btnDeleteParam" OnClick="btnDeleteParam_Click"><span>删除</span></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnSure" OnClientClick="return closeExpWindow();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>")) {
                if ("<%=DIALOG_MODE%>" == "Dialog") {
                    if (window.parent.document.getElementById("<%=PARAM_HI_ID%>") != null) {
                        var str = window.parent.document.getElementById("<%=PARAM_HI_ID%>").value;
                        $("#<%=hiParams.ClientID %>").val(str);
                        if (str != null && str != "") {
                          <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
                        }
                    }
                }
                else if (window.dialogArguments != null) {
                    $("#<%=hiParams.ClientID %>").val(window.dialogArguments);
                    <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
                }
            }
        })

        function closeExpWindow() {
            parent.returnValue = $("#<%=hiParams.ClientID %>").val();
            closeWindow();
            return false;
        }

        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }
    
    </script>
</asp:Content>
