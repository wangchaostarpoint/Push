<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestEChartAllChart.ascx.cs"
    Inherits="Zhongsoft.Portal.TestSubSys.Controls.TestEChartAllChart" %>
<%@ Register Src="TestEChartContract.ascx" TagName="TestEChartContract" TagPrefix="uc1" %>
<%@ Register Src="TestEChartUsers.ascx" TagName="TestEChartUsers" TagPrefix="uc2" %>
<table width="100%" style="background: #fff;">
    <tr>
        <td colspan="2" valign="top">
            <uc1:TestEChartContract ID="TestEChartContract1" runat="server" />
        </td>
    </tr>
    <tr>
        <td valign="top" style="width: 50%;">
            <uc2:TestEChartUsers ID="TestEChartUsers1" runat="server" />
        </td>
        <td valign="top" style="width: 50%;">
            <uc2:TestEChartUsers ID="TestEChartUsers2" runat="server" />
        </td>
    </tr>
</table>
