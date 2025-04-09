<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    CodeBehind="XEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script>
        function initCustomerPlugin() {

            checkRegex();
            checkMaxLength();
        }
    </script>

</asp:Content>
