<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoneyApplyPrint.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MM.MoneyApplyPrint" MasterPageFile="~/UI/Master/ObjectPrint.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <style type="text/css">
        .print-noborder
        {
            border: none;
            width: 600px;
            border-collapse: collapse;
            border-spacing: 0px;
            padding: 0px;
            margin: 0px;
            line-height: 25px;
            margin: 0 auto;
        }
        .print-noborder td
        {
            border: none;
        }
        .kpms-table-inner td
        {
            font-size: 11pt !important;
        }
    </style>
    <script type="text/javascript">
        function printMargin() {
            return "22,20,23,25"
        }
        function printOrientation() {
            return false;
        }
    </script>
    <div id="divBill" runat="server" style="page-break-after: always">
        <div class="kpms-print-maintitle" style="width: 100%">
            <asp:Label ID="Label1" runat="server" Style="font-family: 华文中宋;">电力勘测设计研究院资金拨付审批表</asp:Label>
        </div>
        <div>
            <table class="kpms-table-inner">
                <tr>
                    <td colspan="12">
                        <asp:Label runat="server" ID="lbShowTime"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        申请部门
                    </td>
                    <td colspan="10">
                        <asp:Label runat="server" ID="lbApplyDeptName"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 50px">
                    <td colspan="2">
                        摘要及用途
                    </td>
                    <td colspan="10">
                        <asp:Label runat="server" ID="lbPurpose"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2" colspan="2">
                        金额
                    </td>
                    <td colspan="2">
                        小写（元）
                    </td>
                    <td colspan="8">
                        <asp:Label runat="server" ID="lbAmount"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        大写（元）
                    </td>
                    <td colspan="8">
                        <asp:Label runat="server" ID="lbBigAmount"></asp:Label>
                    </td>
                </tr>
                <tr style="height: 61px">
                    <td style="width: 50px;">
                        院长
                    </td>
                    <td>
                        <asp:Label ID="lbPreSign" runat="server" Width="60px" align="left"></asp:Label>
                        <asp:Image ID="imgPreSign" runat="server" Width="60px" Visible="false" align="left" />
                    </td>
                    <td style="width: 50px;">
                        主管院高层
                    </td>
                    <td style="width: 100px;">
                        <asp:Label ID="lbAHeader" runat="server" Width="60px" align="left"></asp:Label>
                        <asp:Image ID="imgAHeader" runat="server" Width="60px" Visible="false" align="left" />
                    </td>
                    <td style="width: 50px;">
                        财务部部长
                    </td>
                    <td style="width: 100px;">
                        <asp:Label ID="lbCheck" runat="server" Width="60px" align="left"></asp:Label>
                        <asp:Image ID="imgCheck" runat="server" Width="60px" Visible="false" align="left" />
                    </td>
                    <td style="width: 70px;">
                        接收部门部长
                    </td>
                    <td style="width: 70px;">
                        <asp:Label ID="lbReceiveHeaderSign" runat="server" Width="60px" align="left"></asp:Label>
                        <asp:Image ID="imgReceiveHeaderSign" runat="server" Width="60px" Visible="false"
                            align="left" />
                    </td>
                    <td style="width: 70px;">
                        申请部门部长
                    </td>
                    <td>
                        <asp:Label ID="lbApplyHeaderSign" runat="server" Width="60px" align="left"></asp:Label>
                        <asp:Image ID="imgApplyHeaderSign" runat="server" Width="60px" Visible="false" align="left" />
                    </td>
                    <td style="width: 70px;">
                        申请部门经办人
                    </td>
                    <td>
                        <asp:Label ID="lbApplySign" runat="server" Width="60px" align="left"></asp:Label>
                        <asp:Image ID="imgApplySign" runat="server" Width="60px" Visible="false" align="left" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
