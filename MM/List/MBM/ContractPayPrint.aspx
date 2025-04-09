<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractPayPrint.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.ContractPayPrint" MasterPageFile="~/UI/Master/ObjectPrint.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <script type="text/javascript">
        function printMargin() {
            return "22,20,20,25"
        }
        function printOrientation() {
            return false;
        }
    </script>
    <div id="divBill" runat="server" style="page-break-after: always">
        <div class="kpms-print-maintitle">
            <asp:Label ID="Label1" runat="server" Style="font-family: 华文中宋; text-align: center">水利水电勘测设计研究院合同费用支付单</asp:Label>
        </div>
        <div>
            <div style="line-height: 28.0pt; text-align: right; font-size: 14px; font-family: 宋体;
                width: 684.0pt; font-weight: bold">
                <asp:Label ID="lbApplyDate" runat="server"></asp:Label>
            </div>
            <br />
        </div>
        <table class="kpms-table-inner">
            <tr style="height: 30.4pt">
                <td style="width: 60pt" colspan="2">
                    申请部门
                </td>
                <td style="width: 144pt" colspan="2">
                    <asp:Label runat="server" ID="lbApplyDeptName"></asp:Label>
                </td>
                <td style="width: 100pt" colspan="2">
                    合同类型
                </td>
                <td style="width: 60pt" colspan="2">
                    <asp:Label runat="server" ID="lbChargeTypeName"></asp:Label>
                </td>
                <td style="width: 60pt" colspan="2">
                    合同总额（万元）
                </td>
                <td style="width: 40pt" colspan="2">
                    <asp:Label runat="server" ID="lbContractValue"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30.4pt">
                <td colspan="2">
                    合同编号
                </td>
                <td colspan="2">
                    <asp:Label runat="server" ID="lbContractCode"></asp:Label>
                </td>
                <td colspan="2">
                    合同名称
                </td>
                <td colspan="6">
                    <asp:Label runat="server" ID="lbContractName"></asp:Label>
                </td>
            </tr>
            <tr runat="server" id="trProjInfo" style="border-left-width:0px; border-right-width:0px">
                <td colspan="12" style="border-left-width: 0px; border-right-width: 0px; width: 100%">
                    <zhongsoft:LightPowerGridView Width="100%" ID="gvProjInfo" runat="server" UseDefaultDataSource="true"
                        ShowHeader="false" AutoGenerateColumns="false" AllowPaging="false" PageSize="100">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table style="width:100%" class="kpms-table-inner">
                                        <tr style="height: 30.4pt">
                                            <td width="121" align="center">
                                                项目编号
                                            </td>
                                            <td width="86" align="center">
                                                <asp:Label runat="server" ID="lbProjectCode" Text='<%#Eval("PROJCODE") %>'></asp:Label>
                                            </td>
                                            <td width="72" colspan="2" align="center">
                                                项目名称
                                            </td>
                                            <td align="center" width="300" colspan="8">
                                                <asp:Label runat="server" ID="lbProjectName" Text='<%#Eval("PROJNAME") %>'></asp:Label>
                                            </td>
                                            <td width="84" colspan="3" align="center">
                                                付款额（万元）
                                            </td>
                                            <td align="center">
                                                <asp:Label runat="server" ID="lbPayAmount" Text='<%#Eval("PAYVALUE") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
            <tr style="height: 30.4pt">
                <td colspan="2">
                    累计已付款（万元）
                </td>
                <td colspan="2">
                    <asp:Label runat="server" ID="lbTotalPayment"></asp:Label>
                </td>
                <td colspan="2">
                    累计已付次数
                </td>
                <td colspan="6">
                    <asp:Label runat="server" ID="lbTotalNum"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30.4pt">
                <td colspan="2">
                    收款单位名称
                </td>
                <td colspan="6">
                    <asp:Label runat="server" ID="lbUnitName"></asp:Label>
                </td>
                <td colspan="2">
                    开户行
                </td>
                <td colspan="2">
                    <asp:Label runat="server" ID="lbBank"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30.4pt">
                <td colspan="2">
                    账号
                </td>
                <td colspan="6">
                    <asp:Label runat="server" ID="lbAccount"></asp:Label>
                </td>
                <td colspan="2">
                    附件张数
                </td>
                <td colspan="2">
                    <asp:Label runat="server" ID="lbAttachNum"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30.4pt">
                <td colspan="2">
                    付款内容
                </td>
                <td colspan="10">
                    <asp:Label runat="server" ID="lbPayContent"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30.4pt">
                <td colspan="2">
                    付款金额
                </td>
                <td colspan="6">
                    <asp:Label runat="server" ID="lbBigPayAmount"></asp:Label>
                </td>
                <td colspan="2">
                    小写
                </td>
                <td colspan="2">
                    <asp:Label runat="server" ID="lbPayAmount"></asp:Label>
                </td>
            </tr>
            <tr style="height: 60pt">
                <td>
                    院长:
                </td>
                <td colspan="2">
                    <asp:Label ID="lbPreSign" runat="server" Width="60px" align="left"></asp:Label>
                    <asp:Image ID="imgPreSign" runat="server" Width="60px" Visible="false" align="left" />
                </td>
                <td>
                    主管高层:
                </td>
                <td colspan="2">
                    <asp:Label ID="lbHeader" runat="server" Width="60px" align="left"></asp:Label>
                    <asp:Image ID="imgHeader" runat="server" Width="60px" Visible="false" align="left" />
                </td>
                <td>
                    部门主管(项目主管):
                </td>
                <td colspan="2">
                    <asp:Label ID="lbCheck" runat="server" Width="60px" align="left"></asp:Label>
                    <asp:Image ID="imgCheck" runat="server" Width="60px" Visible="false" align="left" />
                </td>
                <td>
                    申请人:
                </td>
                <td colspan="2">
                    <asp:Label ID="lbApply" runat="server" Width="60px" align="left"></asp:Label>
                    <asp:Image ID="imgApply" runat="server" Width="60px" Visible="false" align="left" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
