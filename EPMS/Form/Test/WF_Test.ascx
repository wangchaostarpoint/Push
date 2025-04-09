<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_Test.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Test.WF_Test" %>
<table id="Table1" class="kpms-table">
    <tr>
        <td class="td-l">
            年份
        </td>
        <td class="td-r">
            <asp:DropDownList ID="ddlMonth" runat="server">
            </asp:DropDownList>
        </td>
        </td class="td-m" colspan="4"></td>
    </tr>
    <tr>
        <td colspan="6">
            <%--<zhongsoft:LightPowerGridView ID="lpList" AllowPaging="true"
                PageSize="10" runat="server" AutoGenerateColumns="false" BindGridViewMethod="BindList">
                <Columns>
                    <asp:BoundField DataField="PROJECTPHASECODE" HeaderText="项目编号" />
                    <asp:BoundField DataField="PROJECTPHASENAME" HeaderText="项目名称" />
                </Columns>
            </zhongsoft:LightPowerGridView>--%>
            <zhongsoft:LightPowerGridView ID="lpList" AllowPaging="true" PageSize="10" runat="server"
                AutoGenerateColumns="false" BindGridViewMethod="BindList">
                <Columns>
                    <asp:BoundField DataField="app_name" HeaderText="步骤名称" />
                    <asp:BoundField DataField="creator_name" HeaderText="处理人" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="lpOrgList" AllowPaging="true" PageSize="10" runat="server"
                AutoGenerateColumns="false" BindGridViewMethod="BindList">
                <Columns>
                    <asp:BoundField DataField="ORGUNITNAME" HeaderText="部门名称" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="lpUserList" AllowPaging="true" PageSize="10" runat="server"
                AutoGenerateColumns="false" BindGridViewMethod="BindList">
                <Columns>
                    <asp:BoundField DataField="LOGINID" HeaderText="用户工号" />
                    <asp:BoundField DataField="USERNAME" HeaderText="用户姓名" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
