<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreBidNoticePrint.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.PreBidNoticePrint" MasterPageFile="~/UI/Master/ObjectPrint.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <div id="divBill" runat="server" style="page-break-after: always">
        <table class="tz-table">
            <tr>
                <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                    border-bottom: medium none; valign: " align="center" colspan="10" rowspan="1">
                    <span style="letter-spacing: -1pt; font-size: 64pt;"><font face="宋体" size="1" style="font-size: 18pt;">
                        预中标通知书</font></span>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>
                    <asp:Label ID="lbName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp; “广西壮族自治区水利电力勘测设计研究院<asp:Label ID="lbProj" runat="server" />采购项目”招标（招标编号：<asp:Label
                        ID="lbCode" runat="server" />
                    ）， 经评标小组评审，招标领导小组定标，确定贵方为预中标人。请贵公司于<asp:Label ID="lbYear" runat="server" />年<asp:Label
                        ID="lbMonth" runat="server" />
                    月<asp:Label ID="lbDay" runat="server" />日前派员来我院商谈合同事宜。<br />
                    特此通知。
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    广西壮族自治区 电力勘测设计研究院
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="lbNYear" runat="server" />年<asp:Label ID="lbNMonth" runat="server" />
                    月<asp:Label ID="lbNDay" runat="server" />日
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
