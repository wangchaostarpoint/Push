<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketInfoSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.Obsolete.MarketInfoSelector" Title="选择跟踪项目" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>所属工程包/工程名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
            <td>
                <asp:LinkButton runat="server" ID="btnNew" OnClientClick="return addMarket()">
                              <span>新建</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvProject" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="BelongProjectPackage" HeaderText="所属工程包">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="工程名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VoltageGrade" HeaderText="电压等级">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanFinishTime" HeaderText="计划完成日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnBindMarket" runat="server" Style="display: none" OnClick="btnBindMarket_OnClick" />
    <script type="text/javascript" language="javascript">
        function addMarket() {
            var json = { actionType: 2 };
            var url = buildQueryUrl("/MM/List/MDM/MarketInfoEditor.aspx", json);
            showDivDialog(url, "", 1000, 600, bindMarket);
            return false;
        }

        //后台执行绑定
        function bindMarket() {
            $("#<%=btnBindMarket.ClientID %>").click();
        }
    </script>
</asp:Content>
