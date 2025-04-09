<%@ Page Title="流程规则映射" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="FormRuleMapping.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormRuleMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    类型
    <asp:DropDownList runat="server" ID="ddlRuleType" Width="150">
    </asp:DropDownList>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
<style>
iframe, body{ background:none;}
</style>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="MappingId"
        AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="gvList_RowCommand"
        OnRowDataBound="gvList_RowDataBound" PageSize="100">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="ObjectId" HeaderText="对象ID" HeaderStyle-Width="200px" />
            <asp:TemplateField HeaderText="对象名称" HeaderStyle-Width="200px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblName"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RuleName" HeaderText="规则名称" HeaderStyle-Width="200px" />
            <asp:TemplateField HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Center"
                HeaderText="类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblRuleType"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderStyle-Width="80px" HeaderStyle-HorizontalAlign="Center"
                HeaderText="标识">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblFlag"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="IsASync" HeaderText="是否异步" HeaderStyle-Width="50px" />
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData"  Visible="false">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function checkList(array) {
            var otherParam = { "PackageName": "<%=PackageName %>", "XPDLID": "<%=XPDLID %>" };
            transParamToToolBar(array, otherParam);
        }
        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvList.CheckedClientID %>");
            checkList(array);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
