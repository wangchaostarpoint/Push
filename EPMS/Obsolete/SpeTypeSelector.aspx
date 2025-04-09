<%@ Page Language="C#" AutoEventWireup="true" Title="选择专业类型" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="SpeTypeSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.SpeTypeSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" 
        ID="btnComplete" OnClientClick="return checkData();"
        ToolTip="选择完成" onclick="btnComplete_Click">        
        <span runat="server" id="span"><img runat="server" id="img" src="~/Themes/Images/btn_finish.gif" alt="选择完成" width="16" height="16" />选择完成</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" 
        ID="lbtnCancel" OnClientClick="return cancelEdit();"
        ToolTip="取消">        
        <span runat="server" id="span2"><img runat="server" id="img2" src="~/Themes/Images/btn_cancel.gif" alt="取消" width="16" height="16" />取消</span>
    </asp:LinkButton>
    <script>
        function checkData() {
            return true;
        }
        function closeExpWindow() {
            parent.returnValue = $("#<%=hiXml.ClientID %>").val() + "|" + $("#<%=hiName.ClientID %>").val()+ "|" + $("#<%=hiID.ClientID %>").val();
            closeWindow();
            return false;
        }
        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
    <script src="../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <asp:CheckBox runat="server" ID="cbAll" Text="选择全部"/>
    <asp:CheckBoxList runat="server" ID="cblSpeType" RepeatDirection="Horizontal" RepeatColumns="7">
    </asp:CheckBoxList>
    <input type="hidden" runat="server" id="hiXml" />
    <input type="hidden" runat="server" id="hiID" />
    <input type="hidden" runat="server" id="hiName" />
    <input type="hidden" runat="server" id="hiTitle" />
    <script>
        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>")) {
                if ("<%=DIALOG_MODE%>" == "Dialog") {
                    if (window.parent.document.getElementById("<%=PARAM_HI_ID%>") != null) {
                        var str = window.parent.document.getElementById("<%=PARAM_HI_ID%>").value;
                        var arr = str.split('|'); 
                        $("#<%=hiXml.ClientID %>").val(arr[0]);
                        if(arr[1]!=undefined){
                        $("#<%=hiTitle.ClientID %>").val(arr[1]);document.getElementById("tdTitle").innerHTML=arr[1];}
                    }
                }
                else {
                        var str = window.dialogArguments
                        var arr = str.split('|');
                        $("#<%=hiXml.ClientID %>").val(arr[0]);
                        if(arr[1]!=undefined){
                        $("#<%=hiTitle.ClientID %>").val(arr[1]);}
                }
                <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
            }
        })        
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
