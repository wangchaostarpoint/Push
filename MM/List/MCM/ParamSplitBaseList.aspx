<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamSplitBaseList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamSplitBaseList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="拆分模板及分项维护" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">名称</span><span>
        <zhongsoft:LightTextBox ID="tbParamName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView ID="gvList" runat="server" AutoGenerateColumns="False" DataKeyNames="PARAMSPLITBASEID,Flag,ParentID"
        SelfIdColumn="PARAMSPLITBASEID" IndentSize="5" ParentIdColumn="ParentID" UseDefaultDataSource="true"
        AllowPaging="true" PageSize="10" OnRowDataBound="gvList_RowDataBound" BindGridViewMethod="BindDataGrid">
        <PagerStyle HorizontalAlign="Right" ></PagerStyle>
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="6%">
                <ItemTemplate>
                    <%# gvList.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="名称" DataField="PARAMSPLITBASENAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="排序" DataField="SORT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否启用" DataField="Flag">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:TreeGridView>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=this.gvList.CheckedClientID %>";

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
