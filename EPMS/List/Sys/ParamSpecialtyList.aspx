<%@ Page Language="C#" AutoEventWireup="true" Title="项目专业参数设置" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ParamSpecialtyList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamSpecialtyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">专业名称</span> <span>
        <zhongsoft:LightTextBox ID="tbType" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ParamSpecialtyId" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" ParentIdColumn="ParentId"
        SelfIdColumn="ParamSpecialtyId">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# gvList.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ParamBusinessPlateID" HeaderText="业务板块" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="所在分院">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbDept"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SpecialtyType" HeaderText="专业类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="项目专业代字">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="项目专业名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialityDrawCode" HeaderText="专业简称编码">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialityDrawName" HeaderText="专业简称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DESCRIPTION" HeaderText="描述">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="适用的项目类型" Visible="false">
                <ItemTemplate>
                    <%--><asp:CheckBox runat="server" ID="cbAllProjType" Text="选择全部项目类型" OnCheckedChanged="cbAll_CheckedChanged"
                        AutoPostBack="true" />
                    <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="3"
                        OnSelectedIndexChanged="cbl_SelectedIndexChanged" AutoPostBack="true">
                    </asp:CheckBoxList>--%>
                    <div runat="server" id="divProjectTypes" tip="1" style="width: 300px" class="autoskip">
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序号" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamSpecialtyId") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamSpecialtyId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:TreeGridView>
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
