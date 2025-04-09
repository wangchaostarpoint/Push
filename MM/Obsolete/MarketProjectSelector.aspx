<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketProjectSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.MarketProjectSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择工程项目" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>工程名称
                <zhongsoft:LightTextBox ID="tbProjectPackage" runat="server" Width="80px"></zhongsoft:LightTextBox>
            </td>
            <td>项目编号/名称
                <zhongsoft:LightTextBox ID="tbProjectName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
            <td>工程类别
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
            <td style="display: none;">绑定状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlBoundState" Width="80px">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                <asp:LinkButton runat="server" ID="btnNew" OnClick="btnNew_Click" OnClientClick="return AddItem()" Visible="False">
                    <span>新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <script type="text/javascript" language="javascript">
        function AddItem() {
            var param = { actionType: 3 };
            var url = buildQueryUrl("/MM/List/MDM/MarketProjectEditor.aspx", param);
            var dom = showModal(url, "", 1096, 660);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvProject" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectPackage" ShowToolTip="true" ItemStyle-Width="150px" Width="150px" />
            <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MarketProjectName" HeaderText="项目名称" ShowToolTip="true" ItemStyle-Width="150px" Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="工程类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BusinessManagerName" HeaderText="商务经理" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BoundState" HeaderText="绑定状态" Visible="false">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
