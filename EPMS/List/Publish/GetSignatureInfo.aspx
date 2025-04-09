<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetSignatureInfo.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.GetSignatureInfo" MasterPageFile="~/UI/Master/ObjectPrint.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <style type="text/css">
        .kpms-table-inner td
        {
            font-size: medium !important;
            border-left: none !important;
            border-right: none !important;
            border-top: none !important;
            border-bottom: none !important;
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
    <%--<table>
        <tr>
            <td style="text-align: left">
            </td>
        </tr>
    </table>--%>
    <div runat="server" id="divInfo">
        <asp:Literal runat="server" ID="ltSignInfo"></asp:Literal>
    </div>
</asp:Content>
