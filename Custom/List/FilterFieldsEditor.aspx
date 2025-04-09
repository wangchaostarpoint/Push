<%@ Page  Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master" AutoEventWireup="true"
    CodeBehind="FilterFieldsEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.FilterFieldsEditor" %>

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
                        筛选列
                    </td>
                    <td class="td-m" colspan="3">
                        <table>
                            <tr>
                                <td valign="top">
                                    <asp:DropDownList runat="server" ID="ddlFields" Width="100px">
                                     <asp:ListItem Value="">请选择</asp:ListItem>
                                    </asp:DropDownList>
                                    <input type="text" id="txtField" runat="server" readonly="readonly" class="kpms-textbox" />
                                </td>
                                <td valign="top">
                                    <asp:LinkButton runat="server" ID="btnAdd" OnClick="btnAdd_Click"><span>添加</span></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiFilterFields" />
                            
                                     <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
                                    <asp:ListBox runat="server" ID="lbFields" Width="300px" Height="100px" ></asp:ListBox>
                          
                                  
                                </td>
                                <td valign="bottom">
                                    <asp:LinkButton runat="server" ID="btnDelete" OnClick="btnDelete_Click"><span>删除</span></asp:LinkButton>
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
             if("<%=DIALOG_MODE%>"=="Dialog")  {
              if (window.parent.document.getElementById("<%=PARAM_HI_ID%>") != null) {
                var str=window.parent.document.getElementById("<%=PARAM_HI_ID%>").value;
                $("#<%=hiFilterFields.ClientID %>").val(str);
                if(str!=null&&str!="")
                {
                <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
                }
                }
             }
             else if(window.dialogArguments!=null)
             {
                $("#<%=hiFilterFields.ClientID %>").val(window.dialogArguments);
                <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
              }
            }
        })

        $("#<%=ddlFields.ClientID %>").live("change",function(){
          $("#<%=txtField.ClientID %>").val($(this).val());
        });

        function closeExpWindow() {
            parent.returnValue = $("#<%=hiFilterFields.ClientID %>").val();
            closeWindow();
            return false;
        }

        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }
    
    </script>
</asp:Content>
