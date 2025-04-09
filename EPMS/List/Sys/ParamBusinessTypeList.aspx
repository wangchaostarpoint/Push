<%@ Page Language="C#" AutoEventWireup="true" Title="业务类型参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamBusinessTypeList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamBusinessTypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务类型</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="PARAMBUSINESSTYPEID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="BUSINESSTYPE" HeaderText="业务类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述" ShowToolTip="true"
                HeaderStyle-Width="450px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="包括的业务板块">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("PARAMBUSINESSTYPEID") %>' />
                    <%--<asp:CheckBox runat="server" ID="cbAll" Text="选择全部业务板块" OnCheckedChanged="cbAll_CheckedChanged"
                        AutoPostBack="true" />
                    <asp:CheckBoxList runat="server" ID="cbl" RepeatDirection="Horizontal" RepeatColumns="3"
                        AutoPostBack="true" OnSelectedIndexChanged="cbl_SelectedIndexChanged">
                    </asp:CheckBoxList>--%>
                    <asp:Label runat="server" ID="lbBusinessPlates"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("PARAMBUSINESSTYPEID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
