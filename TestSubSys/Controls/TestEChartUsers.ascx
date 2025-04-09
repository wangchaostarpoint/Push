<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestEChartUsers.ascx.cs"
    Inherits="Zhongsoft.Portal.TestSubSys.Controls.TestEChartUsers" %>
<script type="text/javascript">
</script>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="list_borderbottom">
    <tr>
        <td class="list-header publish">
            <span style="float: left">人员年龄分布</span> <span style="float: right">
                <zhongsoft:LightDropDownList ID="ddlDept" runat="server" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged"
                    AutoPostBack="true">
                </zhongsoft:LightDropDownList>
            </span>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:EChart ID="EChartUserAge" runat="server" Width="600" Height="250px">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
