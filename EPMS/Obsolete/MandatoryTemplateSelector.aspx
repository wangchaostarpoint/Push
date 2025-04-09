<%@ Page Language="C#" AutoEventWireup="true" Title="选择强条模板" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="MandatoryTemplateSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.MandatoryTemplateSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">专业</span> <span>
        <zhongsoft:LightTextBox ID="tbSpecialtyName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">规范名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">条款号</span> <span>
        <zhongsoft:LightTextBox ID="tbItemCode" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="MandatoryTemplateID"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="MandatoryTemplateID" HeaderText="MandatoryTemplateID"
                Visible="false" />
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MandatoryName" HeaderText="标准名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MandatoryCode" HeaderText="标准编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="条款号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="执行专业" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbExecuteSpecialty"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

</script>
</asp:Content>
