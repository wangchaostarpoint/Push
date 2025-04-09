<%@ Page Language="C#" AutoEventWireup="true" Title="项目类型参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamProjectTypeList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamProjectTypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目类型</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ParamProjectTypeId" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PROJECTTYPECODE" HeaderText="项目类型代字">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROJECTTYPE" HeaderText="项目类型名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ParamFileCategoryName" HeaderText="对应档案类型" />
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述" ItemStyle-Width="300px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="归属的业务板块" Visible="false">
                <ItemTemplate>
                    <%-- <asp:CheckBox runat="server" ID="cbAllBizPlate" Text="选择全部业务板块" OnCheckedChanged="cbAllBizPlate_CheckedChanged"
                        AutoPostBack="true" />
                    <asp:CheckBoxList runat="server" ID="cblBizPlate" RepeatDirection="Horizontal" RepeatColumns="3"
                        AutoPostBack="true" OnSelectedIndexChanged="cblBizPlate_SelectedIndexChanged">
                    </asp:CheckBoxList>--%>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamProjectTypeId") %>' />
                    <asp:Label runat="server" ID="lbBusinessPlates"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="包括的项目阶段" ItemStyle-Width="250px" Visible="false">
                <ItemTemplate>
                    <%--<asp:CheckBox runat="server" ID="cbAllPhase" Text="选择全部项目阶段" OnCheckedChanged="cbAllPhase_CheckedChanged"
                        AutoPostBack="true" />
                    <asp:CheckBoxList runat="server" ID="cblPhase" RepeatDirection="Horizontal" RepeatColumns="3"
                        AutoPostBack="true" OnSelectedIndexChanged="cblPhase_SelectedIndexChanged">
                    </asp:CheckBoxList>--%>
                    <div runat="server" id="divProjectPhases" tip="1" style="width: 300px" class="autoskip">
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamProjectTypeId") %>'
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
