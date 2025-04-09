<%@ Page Language="C#" Title="签署页" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="SignPage.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Product.SignPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <style>
        .signTb
        {
            width: 100%;
            font-size: 16pt;
            font-weight: bold;
        }
        
        .signTd
        {
            /*font-weight: normal;
            font-size: 15pt;*/
            width: 130px;
        }
    </style>
    <script type="text/javascript">
        function printMargin() {
            return "25,25,25,25"
        }
        function printOrientation() {
            return true;
        }
    </script>
    <div style="margin: 50px auto auto auto; width: 60%;">
        <asp:Literal runat="server" ID="ltSignInfo"></asp:Literal></div>
    <!-- 每行显示签名数量-->
    <input type="hidden" runat="server" id="hiSignerCnt1Row" value="4" />
</asp:Content>
