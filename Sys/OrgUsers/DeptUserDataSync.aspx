<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptUserDataSync.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.Sys.OrgUsers.DeptUserDataSync" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnSync" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return sync()" OnClick="btnSync_Click"><span>
         <img  src="../../Themes/Images/btn_subtoolbarnew.gif" width="16" height="16"/>组织人员同步</span></asp:LinkButton></div>
    <script type="text/javascript">
        function sync() {
            return confirm('确认进行组织人员同步？');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
