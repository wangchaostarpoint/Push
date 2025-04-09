<%@ Page Language="C#" AutoEventWireup="true" Title="业务板块参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamBusinessPlateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamBusinessPlateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务板块</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="PARAMBUSINESSPLATEID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="BUSINESSPLATE" HeaderText="业务板块">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightTemplateField HeaderText="归属的业务类型">
                <ItemTemplate>
                     <asp:CheckBox runat="server" ID="cbAllBizType" Text="选择全部业务类型" OnCheckedChanged="cbAllBizType_CheckedChanged"
                        AutoPostBack="true" />
                    <asp:CheckBoxList runat="server" ID="cblBizType" RepeatDirection="Horizontal" RepeatColumns="3"
                        OnSelectedIndexChanged="cblBizType_SelectedIndexChanged" AutoPostBack="true">
                    </asp:CheckBoxList>
                    <asp:Label runat="server" ID="lbBusinessType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
            <%--<zhongsoft:LightTemplateField HeaderText="包括的项目类型">
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="cbAllProjType" Text="选择全部项目类型" OnCheckedChanged="cbAllProjType_CheckedChanged"
                        AutoPostBack="true" />
                    <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="3"
                        OnSelectedIndexChanged="cblProjType_SelectedIndexChanged" AutoPostBack="true">
                    </asp:CheckBoxList>
                    <asp:Label runat="server" ID="lbProjectType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightTemplateField HeaderText="对应部门">
                <ItemTemplate>                    
                    <asp:Label runat="server" ID="lbDept"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("PARAMBUSINESSPLATEID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("PARAMBUSINESSPLATEID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
