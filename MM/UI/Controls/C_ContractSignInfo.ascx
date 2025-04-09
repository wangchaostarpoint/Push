<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_ContractSignInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_ContractSignInfo" %>
<div class="wp_listleft">
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        <span><a onclick="openContractSignInfo()">本月签订进项合同（<asp:Label ID="lbNum" runat="server"
                            CssClass="digitalstyle"></asp:Label>&nbsp;个，合同额&nbsp;<asp:Label ID="lbSum" runat="server"
                                CssClass="digitalstyle"></asp:Label>&nbsp;万元）</a></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span><a onclick="openContractSignInfo()">本月签订外委合同（<asp:Label ID="lbOutSourcingNum"
                            runat="server" CssClass="digitalstyle"></asp:Label>&nbsp;个，合同额&nbsp;<asp:Label ID="lbOutSourcingAmount"
                                runat="server" CssClass="digitalstyle"></asp:Label>&nbsp;万元）</a></span>
                    </td>
                </tr>
            </table>
            <zhongsoft:LightPowerGridView runat="server" ID="gvContractInfo" AllowPaging="false"
                PageSize="3" UseDefaultDataSource="true" AutoGenerateColumns="false" ShowHeader="false"
                ShowExport="false">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="部门">
                        <ItemTemplate>
                            <asp:Label ID="lbDeptInfo" Text='<%#Eval("UNDERTAKEDEPTNAME")%>' ToolTip='<%#Eval("UNDERTAKEDEPTNAME") %>'
                                runat="server"></asp:Label>
                            <br />
                            本月签订<%#Eval("MONTHNUM")%>个,合同额<%#Eval("MONTHVALUE")%>万元<br />
                            本年签订<%#Eval("YEARNUM")%>
                            个,合同额<%#Eval("YEARVALUE")%>万元<br />
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </div>
    </div>
</div>
<script type="text/javascript">
    var myDate = new Date();
    var startDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-01 00:00:00";
    var endDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate() + " 23:23:59";
    //将参数传递给右侧列表页面，并展示该时间段的列表数据；
    function openContractSignInfo() {
        var param = { startDate: startDate, endDate: endDate };
        //向webPart部件传参
        window.parent.setWebPartParam(self.frameElement.id, param);
    }

    function viewContractInfo(obj) {
        var deptID = $(obj).attr("attrid");
        var param = { parentID: deptID };
        //向webPart部件传参
        setDashboardParam(param, obj);
        setDashboardTab("ContractList");
    }
</script>
