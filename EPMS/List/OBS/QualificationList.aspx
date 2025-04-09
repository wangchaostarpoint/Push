<%@ Page Language="C#" AutoEventWireup="true" Title="资格类型设置" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="QualificationList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.QualificationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">资格类型</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="QualificationID" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="QualificationCode" HeaderText="资格编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QualificationName" HeaderText="资格名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="角色">
                <ItemTemplate>
                    <asp:Label ID="lbRoleName" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="资格等级">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbQualificationGrade"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="控制项目类型">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rblIsControlProject" RepeatDirection="Horizontal"
                        key='<%#Eval("QualificationID") %>' filed="IsControlProject" OnSelectedIndexChanged="UpdateQualificationValue"
                        AutoPostBack="true">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用" HeaderStyle-Width="100px">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" key='<%#Eval("QualificationID") %>'
                        filed="Flag" OnSelectedIndexChanged="UpdateQualificationValue" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
