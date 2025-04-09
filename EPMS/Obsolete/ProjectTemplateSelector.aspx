<%@ Page Language="C#" AutoEventWireup="true" Title="选择项目模板" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="ProjectTemplateSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjectTemplateSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" runat="server" id="span1"><span class="filter-block-lb">工程类别</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
            EnableTheming="false" /></span></span>
    <span class="filter-block" runat="server" id="span2"><span class="filter-block-lb">阶段</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" class="kpms-ddlsearch"
            EnableTheming="false" /></span></span>
    <span class="filter-block" runat="server" id="spanProject"><span class="filter-block-lb">模板名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox></span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="ProjectTemplateID"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="工程类别" ItemStyle-Width="20%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProjectType" Text='<%#Eval("ParamProjectTypeID") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="阶段" ItemStyle-Width="20%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPhase" Text='<%#Eval("ParamPhaseID") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectTemplateName" HeaderText="模板名称" ItemStyle-Width="60%"/>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiEmptyTemplate" value="空模板" />
</asp:Content>
