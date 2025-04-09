<%@ Page Language="C#" AutoEventWireup="true" Title="项目（合同）单项参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamSingleList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamSingleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">单项名称</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">业务类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlBizType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false" Style="width: 110px; margin: 3px 0px;">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlParamProjectPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false" Style="width: 110px; margin: 3px 0px;">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ParamSingleID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="业务类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbBizType"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目阶段">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPhaseName"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否项目单项">
                <ItemTemplate>
                    <%# Convert.ToInt32(Eval("IsProject"))==1?"是":"否"%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamSingleID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamSingleID") %>' />
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
