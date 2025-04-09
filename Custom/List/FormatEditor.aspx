<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master" AutoEventWireup="true"
    CodeBehind="FormatEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.FormatEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        字符串
                    </td>
                    <td class="td-m">
                        <input type="text" class="kpms-textbox" id="tbFormat" runat="server" req="1" style="width: 300px" />
                        <span class="req-star">形如：{0}[{1}]，其中{0}对应设置的第一个字段,{1}对应设置的第二个字段</span>
                        
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        对应字段
                    </td>
                    <td class="td-m">
                                   
                                     <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
                        <input type="hidden" runat="server" id="hiFields" />
                        <asp:ListBox ID="boxFields" runat="server" Width="300px" Rows="6" SelectionMode="Multiple">
                        </asp:ListBox>
                        <asp:LinkButton runat="server" ID="btnDelete" CssClass="kpms-btn" OnClick="btnDelete_Click"><span>删除</span></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        可选字段
                    </td>
                    <td class="td-m">
                        字段
                        <asp:DropDownList runat="server" ID="ddlFields" Width="100px" OnSelectedIndexChanged="ddlFileds_Change"
                            AutoPostBack="true">
                        </asp:DropDownList>
                        <input type="text" runat="server" id="tbField" class="kpms-textbox" readonly="readonly"
                            style="width: 150px" />
                        <asp:LinkButton runat="server" ID="btnAdd" CssClass="kpms-btn"
                            OnClick="btnAdd_Click"><span>添加</span></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <input type="hidden" runat="server" id="hiFormatFields" />
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
                $("#<%=hiFormatFields.ClientID %>").val(str);
                if(str!=null&&str!="")
                {
                <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
                }
                }
             }
             else if(window.dialogArguments!=null)
             {
          
                $("#<%=hiFormatFields.ClientID %>").val(window.dialogArguments);
                <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
              }
            }
        })


        function closeExpWindow() {
            parent.returnValue = $("#<%=tbFormat.ClientID %>").val()+"@|@"+ $("#<%=hiFields.ClientID %>").val();
            closeWindow();
            return false;
        }

        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }
    
    </script>
</asp:Content>
